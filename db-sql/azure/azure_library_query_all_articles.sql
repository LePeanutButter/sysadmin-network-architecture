/*
  Table: articles

  Purpose:
  Lists all academic or journal articles available.

  Columns Returned:
    - article_id
    - title
    - author
    - journal
    - publication_year
    - doi
*/

SELECT
  article_id,
  title,
  author,
  journal,
  publication_year,
  doi
FROM dbo.articles;
