-- Remove existing tables if they exist to allow clean recreation
DROP TABLE IF EXISTS [dbo].[access_logs];
DROP TABLE IF EXISTS [dbo].[books];
DROP TABLE IF EXISTS [dbo].[articles];
DROP TABLE IF EXISTS [dbo].[users];

/*
Table: users

Purpose:
Stores registered users of the system.

Columns:
- user_id: Primary key, auto-incremented
- name: Full name of the user
- email: Email address
- registration_date: Date of registration, defaults to current date

Constraints:
- PK_users: Primary key on user_id
- DF_users_registration_date: Default value for registration_date
*/
CREATE TABLE [dbo].[users] (
    [user_id] INT IDENTITY(1,1) NOT NULL,
    [name] NVARCHAR(100) NOT NULL,
    [email] NVARCHAR(100) NOT NULL,
    [registration_date] DATE NOT NULL CONSTRAINT [DF_users_registration_date] DEFAULT (CAST(GETDATE() AS DATE)),
    CONSTRAINT [PK_users] PRIMARY KEY CLUSTERED ([user_id])
) ON [PRIMARY];

/*
Table: books

Purpose:
Stores metadata about books available in the system.

Columns:
- book_id: Primary key, auto-incremented
- title: Title of the book
- author: Author of the book
- publication_year: Year the book was published
- isbn: Unique ISBN identifier
- category: Genre or classification

Constraints:
- PK_books: Primary key on book_id
- UQ_books_isbn: Unique constraint on isbn
*/
CREATE TABLE [dbo].[books] (
    [book_id] INT IDENTITY(1,1) NOT NULL,
    [title] NVARCHAR(255) NOT NULL,
    [author] NVARCHAR(255) NOT NULL,
    [publication_year] INT NULL,
    [isbn] NVARCHAR(20) NULL,
    [category] NVARCHAR(100) NULL,
    CONSTRAINT [PK_books] PRIMARY KEY CLUSTERED ([book_id]),
    CONSTRAINT [UQ_books_isbn] UNIQUE ([isbn])
) ON [PRIMARY];

/*
Table: articles

Purpose:
Stores metadata about academic or journal articles.

Columns:
- article_id: Primary key, auto-incremented
- title: Title of the article
- author: Author of the article
- journal: Journal name
- publication_year: Year of publication
- doi: Unique DOI identifier

Constraints:
- PK_articles: Primary key on article_id
- UQ_articles_doi: Unique constraint on doi
*/
CREATE TABLE [dbo].[articles] (
    [article_id] INT IDENTITY(1,1) NOT NULL,
    [title] NVARCHAR(255) NOT NULL,
    [author] NVARCHAR(255) NOT NULL,
    [journal] NVARCHAR(255) NULL,
    [publication_year] INT NULL,
    [doi] NVARCHAR(100) NULL,
    CONSTRAINT [PK_articles] PRIMARY KEY CLUSTERED ([article_id]),
    CONSTRAINT [UQ_articles_doi] UNIQUE ([doi])
) ON [PRIMARY];

/*
Table: access_logs

Purpose:
Tracks user access to resources (books or articles).

Columns:
- access_id: Primary key, auto-incremented
- user_id: Foreign key to users
- resource_type: Type of resource ('book' or 'article')
- resource_id: ID of the accessed resource
- book_id: Foreign key to books (nullable)
- article_id: Foreign key to articles (nullable)
- access_date: Timestamp of access, defaults to current UTC time

Constraints:
- PK_access_logs: Primary key on access_id
- FK_access_logs_users: Foreign key to users(user_id)
- FK_access_logs_book: Foreign key to books(book_id)
- FK_access_logs_article: Foreign key to articles(article_id)
- CHK_access_logs_resource_consistency: Ensures resource_type matches the correct foreign key and resource_id
*/
CREATE TABLE [dbo].[access_logs] (
    [access_id] INT IDENTITY(1,1) NOT NULL,
    [user_id] INT NOT NULL,
    [resource_type] NVARCHAR(50) NOT NULL,
    [resource_id] INT NOT NULL,
    [book_id] INT NULL,
    [article_id] INT NULL,
    [access_date] DATETIME2 NOT NULL CONSTRAINT [DF_access_logs_access_date] DEFAULT SYSUTCDATETIME(),
    CONSTRAINT [PK_access_logs] PRIMARY KEY CLUSTERED ([access_id]),
    CONSTRAINT [FK_access_logs_users] FOREIGN KEY ([user_id]) REFERENCES [dbo].[users]([user_id]),
    CONSTRAINT [FK_access_logs_book] FOREIGN KEY ([book_id]) REFERENCES [dbo].[books]([book_id]),
    CONSTRAINT [FK_access_logs_article] FOREIGN KEY ([article_id]) REFERENCES [dbo].[articles]([article_id]),
    CONSTRAINT [CHK_access_logs_resource_consistency] CHECK (
        (
            [resource_type] = N'book'
            AND [book_id] IS NOT NULL
            AND [article_id] IS NULL
            AND [resource_id] = [book_id]
        )
        OR
        (
            [resource_type] = N'article'
            AND [article_id] IS NOT NULL
            AND [book_id] IS NULL
            AND [resource_id] = [article_id]
        )
    )
) ON [PRIMARY];
