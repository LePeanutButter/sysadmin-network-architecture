/*
  Table: access_logs

  Purpose:
  Displays all user access records to books or articles.

  Columns Returned:
    - access_id
    - user_id
    - resource_type
    - resource_id
    - book_id
    - article_id
    - access_date
*/

SELECT
  access_id,
  user_id,
  resource_type,
  resource_id,
  book_id,
  article_id,
  access_date
FROM dbo.access_logs;
