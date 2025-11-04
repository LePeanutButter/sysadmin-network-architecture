# Azure SQL Database – Library Management System

This folder contains SQL scripts developed and deployed on **Azure SQL Database** as part of the _Databases and Network Protocols: Cloud and Virtual Integration_ lab.
The scripts implement a **Library Management System** that models users, books, articles, and access logs, integrating relational integrity, auditing, and automation concepts.

---

## Folder Structure

```
db-sql/
└── azure/
   ├── azure_library_create_tables.sql
   ├── azure_library_sample_dataset.sql
   ├── azure_library_query_all_users.sql
   ├── azure_library_query_all_books.sql
   ├── azure_library_query_all_articles.sql
   ├── azure_library_query_all_access_logs.sql
   └── azure_library_audit_table_row_counts.sql
```

---

## Overview

| Script                                       | Purpose                                                                                                                     |
| :------------------------------------------- | :-------------------------------------------------------------------------------------------------------------------------- |
| **azure_library_create_tables.sql**          | Defines the database schema for the Library Management System, including primary keys, foreign keys, and check constraints. |
| **azure_library_sample_dataset.sql**         | Populates the database with 100 test records per table (users, books, articles, access logs).                               |
| **azure_library_query_all_users.sql**        | Retrieves all registered users and registration metadata.                                                                   |
| **azure_library_query_all_books.sql**        | Lists all available books in the catalog.                                                                                   |
| **azure_library_query_all_articles.sql**     | Displays all academic or journal articles.                                                                                  |
| **azure_library_query_all_access_logs.sql**  | Shows access records of users interacting with books or articles.                                                           |
| **azure_library_audit_table_row_counts.sql** | Dynamically computes total row counts per table for auditing or validation purposes.                                        |

---

## Database Schema

The **Azure Library Database** contains the following tables:

| Table         | Description                                     | Key Columns                                            |
| :------------ | :---------------------------------------------- | :----------------------------------------------------- |
| `users`       | Registered users of the system.                 | `user_id`, `email`, `registration_date`                |
| `books`       | Metadata about available books.                 | `book_id`, `isbn`, `category`                          |
| `articles`    | Metadata about journal or academic articles.    | `article_id`, `doi`, `journal`                         |
| `access_logs` | Tracks user access events to books or articles. | `access_id`, `user_id`, `resource_type`, `access_date` |

All foreign key relationships enforce **referential integrity** between `users`, `books`, and `articles` through `access_logs`.

---

## Execution Order

To deploy and populate the Azure SQL environment, execute the scripts in the following order:

1. **`azure_library_create_tables.sql`**
   Creates all tables and constraints.
2. **`azure_library_sample_dataset.sql`**
   Inserts sample records for users, books, articles, and access logs.
3. **`azure_library_query_all_*.sql`**
   Verify data integrity and table contents using individual SELECT queries.
4. **`azure_library_audit_table_row_counts.sql`**
   Generate a summary report of table row counts for auditing.

---

## Azure SQL Deployment Notes

These scripts were executed and tested using:

- **Azure SQL Database (Serverless)** instance under the _Azure for Students_ subscription.
- Tools:

  - **Azure Portal → Query Editor (Preview)**
  - **DBeaver** (JDBC connection)
  - **PowerShell / sqlcmd** for remote query execution.

**Connection Example (PowerShell):**

```powershell
sqlcmd -S <your-server>.database.windows.net -d LibraryDB -U <username> -P <password> -N -C
```

**Connection Example (DBeaver):**

```
Host: <your-server>.database.windows.net
Database: LibraryDB
Port: 1433
Driver: Microsoft SQL Server
SSL: require (TLS 1.2)
```

---

## Sample Output

Example result of `azure_library_audit_table_row_counts.sql`:

| TableName           | TotalRows |
| ------------------- | --------- |
| [dbo].[users]       | 100       |
| [dbo].[books]       | 100       |
| [dbo].[articles]    | 100       |
| [dbo].[access_logs] | 100       |

---

## Learning Outcomes

- Design and deployment of **normalized relational schemas** in cloud-based SQL environments.
- Use of **constraints** and **check conditions** for data consistency.
- Integration of **PowerShell**, **DBeaver**, and **Azure Portal** tools for multi-platform access.
- Validation of data using **dynamic SQL auditing** (`sp_executesql` with `STRING_AGG`).
- Hands-on experience with **Azure SQL Database**, **TLS security**, and **query automation**.
