# SQL Databases – Cross-Platform Implementations

This directory contains all database scripts developed for the **_Databases and Network Protocols: Cloud and Virtual Integration_** lab.
It documents **multi-platform database environments** deployed on **PostgreSQL (Slackware Linux)**, **Microsoft SQL Server (Windows Server 2025)**, and **Azure SQL Database (Cloud)**.

Each subfolder includes platform-specific SQL scripts for database creation, user management, schema definition, data seeding, validation, and auditing.

---

## Folder Structure

```
db-sql/
├── pg/        → PostgreSQL (Slackware Linux) – Tourism Databases
├── mssql/     → Microsoft SQL Server – Calendar Databases
└── azure/     → Azure SQL Database – Library Management System
```

---

## Overview by Platform

| Platform                                       | Environment                              | Project                       | Description                                                                                                                     |
| :--------------------------------------------- | :--------------------------------------- | :---------------------------- | :------------------------------------------------------------------------------------------------------------------------------ |
| **PostgreSQL (Slackware Linux)**               | Local virtualized environment            | **Tourism Databases**         | Two independent databases (`turismo_laura`, `turismo_santiago`) managing departments, cities, and tourist attractions.          |
| **Microsoft SQL Server (Windows Server 2025)** | On-premise virtual environment           | **Calendar Databases**        | Two personal calendar systems (`Calendario_Laura`, `Calendario_Santiago`) with categories, activities, and reminders.           |
| **Azure SQL Database (Cloud)**                 | Cloud environment via Azure for Students | **Library Management System** | Centralized digital library (`LibraryDB`) managing users, books, articles, and access logs in a secure, scalable cloud setting. |

---

## Common Learning Objectives

Across all implementations, the following concepts were applied and compared:

- **Database creation and user roles** in multi-user environments
- **Relational schema design** with primary and foreign key constraints
- **Data normalization and referential integrity** enforcement
- **Script automation and modularization** for setup and validation
- **Cross-platform connectivity** via CLI, SSMS, DBeaver, and Azure tools
- **Security management** (logins, ownership, and TLS connections)
- **Data validation and auditing** using SQL queries and dynamic scripts

---

## Platform-Specific Documentation

| Platform                           | Directory           | README                                                |
| :--------------------------------- | :------------------ | :---------------------------------------------------- |
| **PostgreSQL (Slackware)**         | [`/pg`](./pg)       | [Tourism Databases README](./pg/README.md)            |
| **Microsoft SQL Server (Windows)** | [`/mssql`](./mssql) | [Calendar Databases README](./mssql/README.md)        |
| **Azure SQL Database (Cloud)**     | [`/azure`](./azure) | [Library Management System README](./azure/README.md) |

Each README includes:

- Schema diagrams and table definitions
- Execution order of scripts
- Connection examples and tool configurations
- Validation queries and sample outputs

---

## Overall Learning Outcomes

- Gained experience in **cross-environment SQL administration**.
- Implemented consistent **schema design principles** across diverse database engines.
- Practiced **hybrid cloud integration** using Azure services.
- Strengthened understanding of **network protocols**, **authentication**, and **data transport security**.
- Developed transferable skills in **database automation**, **virtualization**, and **multi-platform interoperability**.
