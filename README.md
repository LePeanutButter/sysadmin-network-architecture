# CCNA-aligned networking, system administration, and cloud labs

[![standard-readme compliant](https://img.shields.io/badge/readme%20style-standard-brightgreen.svg?style=flat-square)](https://github.com/RichardLitt/standard-readme)

Configuration logs, shell scripts, terminal outputs, and study notes developed for the **Network Architecture and Services (AYSR)** course at **Escuela Colombiana de Ingeniería**.

Based on the **CCNA: Introduction to Networks** curriculum, the repository covers routing, switching, addressing, system administration, automation, and basic network design.

## Table of Contents

- [Background](#background)
- [Install](#install)
- [Usage](#usage)
- [Repository Structure](#repository-structure)
- [Maintainers](#maintainers)
- [License](#license)

## Background

This repository documents both theoretical and practical work in **networking and system administration**, combining:

- **Virtualization and OS deployment** (Slackware, Solaris, Windows Server, Android-x86).
- **Cisco Packet Tracer topologies** with OSPF, VLANs, and WAN simulation.
- **Shell scripting for Unix/Linux**: log viewing, file inspection, process management, user/group automation.
- **DNS services** configuration on Solaris, Slackware, and Windows.
- **Network analysis with Wireshark** (HTTP flows, TCP handshakes, encapsulation).
- **Cloud computing** experiments with AWS EC2 and Azure SQL Database.

The goal is to integrate **network design, system administration, and automation** in a lab setting that simulates real-world IT environments.

## Install

No installation is required to explore this repository.  
To run the scripts, you need:

- **Bash** (Unix/Linux compatible)
- A **Unix-like environment** (Slackware, Solaris, Linux, BSD, or macOS)
- Optional: **VMware Workstation Pro** or **Cisco Packet Tracer** for lab replication

Example setup on Linux:

```sh
# Clone the repository
git clone https://github.com/LePeanutButter/sysadmin-network-architecture.git
cd sysadmin-network-architecture

# Run a sample script
bash shell-scripts/system-log-viewer.sh
```

## Usage

This repository can be used as:

1. **Reference material** for CCNA labs and study notes.
2. **Executable scripts** to automate administration tasks in Unix/Linux environments.
3. **Network simulation files** (`.pkt` and `.pkz`) to replicate OSPF-based topologies in Cisco Packet Tracer.
4. **Lab documentation** (in Spanish) for reproducing virtualization, DNS, and cloud-based experiments.
5. **SQL-based environments** demonstrating database design, scripting, and cross-platform deployment.

## Repository Structure

- `netarch-setup-records/`

  Logs, notes, and lab records (VM deployment, networking, Wireshark analysis, DNS, AWS cloud setup).

- `shell-scripts/`

  Bash scripts for system administration and task automation. Portable across Slackware, Solaris, Linux, BSD, and macOS.

- `pt-topologies/`
  Cisco Packet Tracer projects implementing OSPF, VLANs, and WAN links. Includes Santiago’s and Natalia’s implementations.

- `db-sql/`
  SQL database implementations developed for the **Databases and Network Protocols: Cloud and Virtual Integration** lab.
  Includes cross-platform deployments on:

  - **PostgreSQL (Slackware Linux):** Tourism Databases
  - **Microsoft SQL Server (Windows Server 2025):** Calendar Databases
  - **Azure SQL Database (Cloud):** Library Management System

  Each subfolder contains structured SQL scripts for:

  - Database and user creation
  - Schema definition with PK/FK constraints
  - Data population and verification
  - Cloud connectivity and auditing via `sp_executesql` and `STRING_AGG`

- `www/`

  PHP-based **web application lab** demonstrating integration between **network services, databases, and application layers**.

  This directory contains a **School Grades Management System** used to practice:

  - Client–server interaction over HTTP
  - Backend development with **PHP**
  - Database connectivity using **MariaDB/MySQL**
  - Secure data handling via **prepared statements (mysqli)**

  The application allows adding students, recording grades, and displaying calculated averages through a simple web interface.
  It serves as a practical example of **application-layer services** running on top of a networked infrastructure, reinforcing CCNA concepts related to server roles, services, and data flow.

- `pcap-files/`

  **Wireshark packet capture files** used for **network traffic analysis and verification**.

  This directory includes `.pcap` files captured during controlled lab experiments to validate:

  - Local network connectivity
  - Address resolution processes
  - Proper switch operation

  The captures contain analysis of:

  - **ARP** (IP-to-MAC resolution)
  - **ICMP** (echo request/reply for connectivity testing)
  - **STP** (Spanning Tree Protocol control traffic)

  These files support hands-on learning of **Layer 2 and Layer 3 protocols**, packet encapsulation, and troubleshooting techniques commonly evaluated in the **CCNA: Introduction to Networks** curriculum.

## Maintainers

- [@LePeanutButter](https://github.com/LePeanutButter) - Santiago Botero Garcia

## License

[MIT](./LICENSE) © 2025 Santiago Botero

## Contributors

- [@Lanapequin](https://github.com/Lanapequin) - Laura Natalia Perilla Quintero
- [@LePeanutButter](https://github.com/LePeanutButter) - Santiago Botero Garcia
