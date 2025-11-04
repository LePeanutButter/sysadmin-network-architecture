/*
  Table: users

  Purpose:
  Fetches all registered users in the system.

  Columns Returned:
    - user_id
    - name
    - email
    - registration_date
*/

SELECT
  user_id,
  name,
  email,
  registration_date
FROM dbo.users;
