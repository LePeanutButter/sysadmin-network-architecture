/* 
  Script: Row Count Summary for All Tables

  Purpose:
  Dynamically generates and executes a query that returns the total number of rows for each base table in the current database.
  Useful for auditing, monitoring table sizes, or validating data loads.

  Logic:
    - Uses STRING_AGG to concatenate individual SELECT COUNT(*) statements for each table.
    - Each SELECT includes the schema-qualified table name and its row count.
    - Combines all SELECTs using UNION ALL to produce a unified result set.
    - Executes the final query using sp_executesql.

  Compatibility:
    - Designed for Azure SQL Database and SQL Server 2017+ (STRING_AGG support required).
    - Only includes tables of type 'BASE TABLE' (excludes views).

  Output Columns:
    - TableName: NVARCHAR – Schema-qualified name of the table (e.g., [dbo].[users]).
    - TotalRows: INT – Number of rows in the table.

  Sample Output:
    | TableName         | TotalRows |
    |-------------------|-----------|
    | [dbo].[users]     | 100       |
    | [dbo].[books]     | 100       |
    | [dbo].[articles]  | 100       |
    | [dbo].[access_logs]| 100      |

  Notes:
    - Requires appropriate SELECT permissions on all tables.
    - For large databases, execution time may vary depending on table sizes.
*/
DECLARE @sql NVARCHAR(MAX);

-- Build dynamic query using STRING_AGG
SELECT @sql = STRING_AGG(
    'SELECT ''' + QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME) + ''' AS TableName, COUNT(*) AS TotalRows FROM ' +
    QUOTENAME(TABLE_SCHEMA) + '.' + QUOTENAME(TABLE_NAME),
    CHAR(13) + 'UNION ALL' + CHAR(13)
)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_TYPE = 'BASE TABLE';

-- Execute the dynamic query
EXEC sp_executesql @sql;
