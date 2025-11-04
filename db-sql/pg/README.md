# PostgreSQL (Slackware Linux) – Tourism Databases

This folder contains SQL scripts designed and executed on **PostgreSQL** running in **Slackware Linux**, as part of the _Databases and Network Protocols: Cloud and Virtual Integration_ lab.
The scripts implement two separate databases — **turismo_laura** and **turismo_santiago** — representing independent tourism data systems for managing departments, cities, and tourist destinations in Colombia.

---

## Folder Structure

```
db-sql/
└── pg/
    ├── slackware_create_roles.sql
    ├── slackware_create_databases.sql
    ├── slackware_create_tables_turismo.sql
    ├── slackware_insert_turismo.sql
    └── slackware_select_turismo.sql
```

---

## Overview

| Script                                  | Purpose                                                                                                                                          |
| :-------------------------------------- | :----------------------------------------------------------------------------------------------------------------------------------------------- |
| **slackware_create_roles.sql**          | Creates PostgreSQL roles (`laura`, `santiago`) with login privileges and passwords.                                                              |
| **slackware_create_databases.sql**      | Creates the `turismo_laura` and `turismo_santiago` databases and assigns ownership to the respective users.                                      |
| **slackware_create_tables_turismo.sql** | Defines the database schema for both databases, including `departamentos`, `ciudades`, and `lugares_turisticos` tables with proper foreign keys. |
| **slackware_insert_turismo.sql**        | Inserts sample data for departments, cities, and tourist attractions in both databases.                                                          |
| **slackware_select_turismo.sql**        | Performs validation queries to confirm data integrity and successful insertions.                                                                 |

---

## Database Schema

Each tourism database (`turismo_laura`, `turismo_santiago`) uses the same normalized schema:

| Table                | Description                                         | Key Columns                                | Relationships                                |
| :------------------- | :-------------------------------------------------- | :----------------------------------------- | :------------------------------------------- |
| `departamentos`      | Stores Colombian departments (regions).             | `id`, `nombre`                             | Referenced by `ciudades.id_departamento`     |
| `ciudades`           | Contains cities belonging to each department.       | `id`, `nombre`, `id_departamento`          | Referenced by `lugares_turisticos.id_ciudad` |
| `lugares_turisticos` | Lists tourist attractions and related descriptions. | `id`, `nombre`, `descripcion`, `id_ciudad` | Depends on `ciudades.id`                     |

This schema enforces **referential integrity** through explicit foreign keys linking all geographical levels.

---

## Execution Order

To deploy and test the PostgreSQL tourism databases:

1. **`slackware_create_roles.sql`**
   Creates user roles `laura` and `santiago`.

2. **`slackware_create_databases.sql`**
   Creates databases `turismo_laura` and `turismo_santiago` owned by each user.

3. **`slackware_create_tables_turismo.sql`**
   Builds tables for departments, cities, and tourist attractions in both databases.

4. **`slackware_insert_turismo.sql`**
   Populates each database with test data.

5. **`slackware_select_turismo.sql`**
   Queries all tables to verify that the data was inserted correctly.

---

## Execution Environment

Scripts were executed and tested in:

- **Slackware Linux 15.0**
- **PostgreSQL 15.x**
- **psql command-line client**

**Connection Example:**

```bash
psql -U postgres
```

Once connected, execute the scripts sequentially, or load them with:

```bash
\i slackware_create_roles.sql
\i slackware_create_databases.sql
\i slackware_create_tables_turismo.sql
\i slackware_insert_turismo.sql
\i slackware_select_turismo.sql
```

---

## Sample Data Overview

| Database         | Table              | Example Records                                |
| :--------------- | :----------------- | :--------------------------------------------- |
| turismo_laura    | departamentos      | Antioquia, Guaviare, Amazonas                  |
| turismo_laura    | ciudades           | Medellín, San José del Guaviare, Leticia       |
| turismo_laura    | lugares_turisticos | Comuna 13, Ciudad de piedra, Isla de los Micos |
| turismo_santiago | departamentos      | Cundinamarca, Boyacá, Nariño                   |
| turismo_santiago | ciudades           | Bogotá, Villa de Leyva, Pasto                  |
| turismo_santiago | lugares_turisticos | Monserrate, Plaza Mayor, Laguna de la Cocha    |

---

## Learning Outcomes

- Setup of **multi-user PostgreSQL environments** with independent databases and ownership.
- Design of **relational schemas** enforcing referential integrity.
- Practical management of **foreign key relationships** across hierarchical data.
- Use of **psql commands** (`\c`, `\i`) for database switching and batch execution.
- Reinforcement of **system administration and SQL fundamentals** in Linux environments.
