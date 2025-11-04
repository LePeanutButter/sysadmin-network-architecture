/*
  Table: books

  Purpose:
  Lists all books stored in the system with metadata.

  Columns Returned:
    - book_id
    - title
    - author
    - publication_year
    - isbn
    - category
*/

SELECT
  book_id,
  title,
  author,
  publication_year,
  isbn,
  category
FROM dbo.books;
