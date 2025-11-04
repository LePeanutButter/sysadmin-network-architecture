# Microsoft SQL Server – Calendar Databases

This folder contains SQL scripts designed and executed on **Microsoft SQL Server 2022 (Windows Server 2025)** as part of the _Databases and Network Protocols: Cloud and Virtual Integration_ lab.
The scripts define and populate two independent databases — **Calendario_Laura** and **Calendario_Santiago** — representing personal scheduling systems for two users.

---

## Folder Structure

```
db-sql/
└── mssql/
   ├── windows_create_databases.sql
   ├── windows_create_logins_and_users.sql
   ├── windows_create_tables.sql
   ├── windows_seed_data.sql
   └── windows_verify_data.sql
```

---

## Overview

| Script                                  | Purpose                                                                                                                                                                   |
| :-------------------------------------- | :------------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| **windows_create_databases.sql**        | Creates two databases (`Calendario_Laura`, `Calendario_Santiago`). No tables or constraints are defined here.                                                             |
| **windows_create_logins_and_users.sql** | Defines server-level logins (`Laura`, `Santiago`) and maps them as database users with `db_owner` privileges in each database.                                            |
| **windows_create_tables.sql**           | Creates the relational schema for both databases, including tables, primary keys, and foreign key relationships between `Categorias`, `Actividades`, and `Recordatorios`. |
| **windows_seed_data.sql**               | Inserts sample data for categories, activities, and reminders into each user’s database.                                                                                  |
| **windows_verify_data.sql**             | Runs SELECT queries to verify successful data insertion in all tables.                                                                                                    |

---

## Database Schema

Each database (`Calendario_Laura`, `Calendario_Santiago`) follows the same normalized structure:

| Table           | Description                                                        | Key Columns      | Relationships                             |
| :-------------- | :----------------------------------------------------------------- | :--------------- | :---------------------------------------- |
| `Categorias`    | Stores activity categories for classification.                     | `IdCategoria`    | Referenced by `Actividades.IdCategoria`   |
| `Actividades`   | Contains user events or activities with optional category linkage. | `IdActividad`    | Referenced by `Recordatorios.IdActividad` |
| `Recordatorios` | Holds reminder entries associated with specific activities.        | `IdRecordatorio` | Depends on `Actividades.IdActividad`      |

All foreign keys enforce **referential integrity** within each user’s database, ensuring consistent data relationships.

---

## Execution Order

To deploy the environment in **SQL Server Management Studio (SSMS)**:

1. **`windows_create_databases.sql`**
   Creates both databases.

2. **`windows_create_logins_and_users.sql`**
   Adds server logins and maps users to databases with `db_owner` role.

3. **`windows_create_tables.sql`**
   Builds tables and relationships in each database.

4. **`windows_seed_data.sql`**
   Populates the databases with test data for categories, activities, and reminders.

5. **`windows_verify_data.sql`**
   Runs verification queries to confirm the data was inserted successfully.

---

## Execution Environment

These scripts were tested in:

- **Windows Server 2025 Datacenter (GUI mode)**
- **Microsoft SQL Server 2022 Developer Edition**
- **SQL Server Management Studio (SSMS) 20.x**

**Connection Example (SSMS):**

```
Server type: Database Engine
Server name: localhost
Authentication: SQL Server Authentication
Login: Laura / Santiago
Password: Segura123
```

**Security Note:**
Passwords in these scripts are for academic demonstration only.
Use strong passwords and limit permissions in production environments.

---

## Sample Verification Queries

Example results from `windows_verify_data.sql`:

| Database            | Table         | Sample Data              |
| ------------------- | ------------- | ------------------------ |
| Calendario_Laura    | Categorias    | Estudio, Trabajo         |
| Calendario_Laura    | Actividades   | Clase de SQL             |
| Calendario_Laura    | Recordatorios | 2025-10-10 07:00 – Email |
| Calendario_Santiago | Categorias    | Ejercicio, Proyecto      |
| Calendario_Santiago | Actividades   | Entrenamiento            |
| Calendario_Santiago | Recordatorios | 2025-10-09 05:30 – Alarm |

---

## Learning Outcomes

- Configuration of **multi-database environments** in SQL Server.
- Practice with **login creation, database ownership, and permission control**.
- Implementation of **relational design** using PK/FK constraints.
- Execution of **data seeding and verification** workflows via SSMS.
- Reinforcement of **security best practices** and multi-user database management.
