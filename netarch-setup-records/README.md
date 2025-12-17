# Netarch Setup Records

This folder contains logs, notes, terminal outputs, and configuration steps developed during hands-on labs aligned with the **CCNA: Introduction to Networks** curriculum. Topics include virtualization, operating system administration, network simulation, and automation.

> **Note:** Logs and documentation are written in **Spanish**, as they were produced as part of coursework in a Spanish-speaking academic environment.

## Base platform: Infrastructure for virtualization and networking

This work simulated a real-world IT infrastructure using virtualization to install, configure, and manage multiple operating systems in a controlled academic setting.

### Virtual Machine Deployment and OS Installation

Using **VMware Workstation Pro**, students deployed and configured:

- **Slackware Linux**
- **Solaris**
- **Windows Server 2025 (CLI and GUI)**
- **Android-x86**

Key configuration tasks included:

- Assigning **DHCP and static IP addresses** in bridge mode
- Creating **users and groups** for role-based administration
- Verifying **network connectivity** (ping, traceroute, DNS tests)
- Exploring **file systems, logs, and permissions**
- Documenting **VM-specific configuration files** (VMX, VMDK, NVRAM)
- Producing a **video presentation** explaining **hypervisors, containers, and cloud computing**

### System Administration and Networking Practices

The work combined system setup and basic network administration across Unix/Linux and Windows environments. Activities included:

- **Slackware & Solaris** > manual installation, network setup, user/group creation, syslog configuration.
- **Windows Server** > domain services, account management, permissions, and event logging.
- **Android-x86** > installation and network testing in a non-mobile context.
- **Command-line practice** > essential shell and PowerShell utilities for file management, logs, and process handling.
- **Networking concepts** > comparison of NAT vs Bridge Mode, DNS resolution, and IP addressing strategies.

### Results and Learning Outcomes

The lab achieved a functional multi-OS virtualized environment, with the following outcomes:

- **Correct deployment** of four different operating systems on VMware.
- **Hands-on practice** with system installation, networking, user/group management, and permissions.
- **File system exploration** across Slackware, Solaris, and Windows for comparative analysis.
- **Syslog and logging** tested on Unix/Linux systems, with Windows logs explored through Event Viewer.
- **Bridge-mode networking** successfully demonstrated inter-VM connectivity and DNS testing.

## Operating System Configuration, Shell, and Network Support Software

This work focused on system administration, scripting, and network simulation across **Unix/Linux** and **Windows** platforms.

### Packet Tracer and Network Simulation

The work introduced **Cisco Packet Tracer** as a tool for network design, message tracing, and protocol analysis.

Activities included:

- Completing the **Getting Started with Cisco Packet Tracer** course.
- Designing and simulating network topologies with **OSPF routing**.
- Testing connectivity between devices (DHCP, RADIUS, servers, and switches).
- Using **Simulation Mode** to trace ICMP packets step by step through the **OSI layers**, analyzing encapsulation and de-encapsulation.
- Deliverables included `.pkt` and `.pkz` project files documenting the implementations.

### Real Network Analysis with Wireshark

Students captured and analyzed real traffic with **Wireshark**, focusing on:

- HTTP request/response flows and TCP handshakes.
- Protocol encapsulation at each OSI layer.
- Use of **filters** for isolating specific packets and protocols.
- Network interface comparison: physical NICs (Intel/Realtek) vs. virtual NICs (Slackware, Solaris).
- Analysis of performance parameters: MAC addresses, IPv4/IPv6, link speeds, and duplex modes.

Video tutorials were also created to demonstrate **Wireshark usage, interface navigation, and HTTP traffic analysis.**

### System Administration and Shell Scripting

To complement network simulations, multiple Unix shell scripts were developed and tested in **Slackware and Solaris**:

- `system-log-viewer.sh` > filtering and monitoring of system logs.
- `file-inspector.sh` > file search and word counting.
- `directory-inspector.sh` > recursive search across directories and files.
- `create-group.sh` > group creation with system checks.
- `create-user.sh` > automated user creation with home directories and permissions.

Additionally, the **VI editor** was used for advanced file editing, practicing commands for search/replace, deletion, undo, copy, uppercase conversion, and navigation.

### Virtualization, File Sharing, and Cloud Computing

The work extended to **virtualization and cross-platform services**:

- **VM deployments** > Windows Server, Solaris, and Slackware VMs configured with static IPs and validated connectivity through `ping` tests.
- **SMB/SAMBA file sharing** > setup on Solaris and accessed from Windows and Slackware.
- **Cloud experiments** > deployment of Amazon EC2 instances using **AWS Academy**, including configuration of Amazon Linux, connection through SSH, and exploration of Slackware installation in cloud environments.

Scripts were also uploaded to **EC2 instances** via `scp`, executed remotely, and validated in real cloud-based scenarios.

### Results and Learning Outcomes

The work provided hands-on experience in:

- Designing and simulating **scalable network topologies** in Packet Tracer.
- Analyzing **real-world network traffic** using Wireshark and NIC comparison.
- Automating **system administration tasks** with shell scripts.
- Practicing **file sharing and interoperability** across heterogeneous systems.
- Exploring **cloud computing fundamentals** with AWS EC2.

## DNS Services Configuration and Task Automation Through Scripting in Virtualized Environments

This work focused on deploying **DNS services and automating administrative tasks** in virtualized environments.

### DNS Services Deployment in Virtualized Environments

Configured **BIND DNS servers** on Solaris, Slackware, and Windows Server:

- **A** (IPv4 Address)
- **AAAA** (IPv6 Address)
- **NS** (Name Server)
- **MX** (Mail Exchange)
- **CNAME** (Canonical Name)

Configuration tasks included editing `named.conf`, creating forward zone files, defining SOA (Start of Authority) records, and validating resolution using **dig**, **nslookup**, and resolver configurations. Local and external domain resolution was verified, ensuring redundancy through synchronized secondary servers.

### Task Automation with Shell and PowerShell

To complement DNS configuration, multiple **administrative scripts** were developed for Unix/Linux and Windows environments:

- `schedule-task-script.sh` > Automates creation and validation of scheduled tasks using `cron`.
- `process-manager.sh` > Provides an interactive menu for listing, searching, killing, and restarting processes.
- `files-script.sh` > Recursively scans the filesystem to list the smallest files under a size threshold.

Each script was tested in **Solaris** and **Slackware**, ensuring parameter validation, error handling, and portability across shells (`bash` and `ksh`).

### Results and Learning Outcomes

The lab successfully integrated **DNS services** and **scripting automation**:

- DNS was configured and validated across Solaris, Slackware, and Windows Server, with custom domains and record management.
- Shell and PowerShell scripts automated system tasks, demonstrating portability and robust error handling.
- Tools such as **nslookup** and **dig** were used to diagnose and verify DNS functionality.

## Application Layer Protocols and Physical Layer Standards in Network Infrastructures

This section documents the integration of **application-layer protocols** and **physical-layer standards** in academic and simulated environments, combining **logical network design** with **hands-on physical implementation.**

It expands on DNS and service configuration through **Packet Tracer**, **Wireshark**, and **real cabling practices**, providing a comprehensive view from simulation to real-world infrastructure.

### Application Layer Protocols

Using **Cisco Packet Tracer**, multiple services were configured and analyzed:

- **DNS, HTTP, FTP, and Email** services across different domains (`sistemas.com`, `civil.com`, `electrica.com`), ensuring name resolution, web hosting, file transfer, and inter-domain email communication.
- Validation through **PDU simulation** to observe encapsulation and OSI-layer behavior.
- Service testing using **PING**, **HTTP browsing**, and **FTP/TELNET sessions**, highlighting communication at layers 4-7.

Each service was verified with both **domain names** and **IP-based requests**, demonstrating proper DNS integration and HTTP response headers (e.g., `200 OK`, `Content-Type`, `Host`, etc.).

FTP operations included **file upload/download**, using user authentication and permission management.

### Network Traffic Analysis with Wireshark

Wireshark was employed to capture **real network traffic**, including HTTP, DHCP, and Telnet sessions:

- Detailed inspection of **TCP handshakes** and **HTTP request/response** exchanges.
- Observation of **DHCP Discover-Offer-Request-ACK** sequences.
- Manual **HTTP requests via Telnet**, highlighting differences between raw text-based requests and browser-managed transactions.
- Visualization of HTTP 200 responses and content-type differentiation (`text/html`, `application/pdf`, `image/png`).

These captures illustrated how **application-layer data** is transported and visualized differently depending on the client (e.g., raw Telnet vs. browser).

### DNS Record Analysis and Real-World Domain Inspection

Using **CentralOps.net**, DNS and WHOIS data were analyzed for several domains:

- **escuelaing.edu.co** > internal DNS infrastructure and LACNIC-assigned IP ranges.
- **jbb.gov.co** > hybrid configuration using GoDaddy and Microsoft Azure DNS.
- **google.com** > multi-redundant, globally distributed infrastructure managed by Google LLC.
- **lufthansa.com** > DNSSEC-enabled corporate domain hosted on Microsoft Azure.

Each analysis detailed domain creation dates, TTLs, registrars, IP ranges, and ownership information, strengthening understanding of **global DNS hierarchy and security practices.**

### NTP Synchronization and Physical Layer Standards

The lab concluded with **Network Time Protocol (NTP)** configuration on Solaris and Slackware systems, enabling clock synchronization across multi-platform environments.
In the **physical layer**, students practiced structured cabling with **UTP Cat5e/6, RJ-45 connectors**, and **patch panel termination**, following **T568A/T568B wiring standards.**

Hands-on crimping, continuity testing, and inspection of campus structured cabling systems complemented the logical network simulations, bridging conceptual and physical aspects of networking.

### Results and Learning Outcomes

This lab reinforced both **logical network design** and **physical infrastructure deployment** skills:

- Complete implementation of **application-layer protocols** in simulated networks.
- Real-world validation of **HTTP, DNS, FTP, DHCP, and NTP** traffic.
- Integration of **DNS resolution, email, and web services** under unified domain management.
- Practical exposure to **structured cabling standards** and **physical connectivity verification.**
- Cross-analysis between **simulation (Packet Tracer)** and **real-world network traces (Wireshark).**

## Databases and Network Protocols

This lab integrated **database management, protocol analysis, and cloud deployment**, emphasizing the relationship between **data infrastructure and network communication** in both local and virtualized environments.

### Network Protocol Analysis

Using **Wireshark**, students analyzed **DNS, HTTP, and Ethernet frames**, examining packet headers, TCP handshakes, and protocol encapsulation.

- **DNS**: Queried domain `lh3.google.com`, identifying UDP transport, port 53, and IPv4 address resolution.
- **HTTP**: Captured GET requests and `HTTP/1.1 200 OK` responses, examining fields like `Host`, `Cache-Control`, `ETag`, and `Content-Type`.
- **Ethernet**: Reviewed MAC addressing, encapsulation, and protocol identification (IPv4 via 0x0800 type field).

### Database Deployment in Virtualized Environments

Three database platforms were installed and configured:

- **PostgreSQL (Slackware Linux)**
  Installed from source using SlackBuilds, initialized with `initdb`, and configured for user-specific access.
  Each student created a database with relational tables (`departamentos`, `ciudades`, `lugares_turisticos`), managing users and privileges through SQL commands.

- **SQL Server (Windows Server 2022)**
  Installed via **SQL Server Express** and managed with **SQL Server Management Studio (SSMS)**.
  Databases were created for each student (`Calendario_Laura`, `Calendario_Santiago`), including tables for `Categorías`, `Actividades`, and `Recordatorios`, with enforced relational integrity.

- **Azure SQL Database (Microsoft Azure)**
  Implemented under the **Azure for Students** program.
  Explored **IaaS, PaaS, SaaS**, and **Serverless** models, along with **regions**, **availability zones**, and **scaling strategies** (horizontal vs. vertical).
  Configured a relational schema (`books`, `articles`, `users`, `access_logs`), secured access via **TLS 1.2**, and connected remotely through PowerShell and DBeaver.

> SQL schema and data scripts are stored in the [`/db-sql/`](./db-sql) folder, organized by platform:
> `pg/` (PostgreSQL), `mssql/` (SQL Server), and `azure/` (Azure SQL Database).

### System Integration and Automation

Cross-platform access was configured using **DBeaver** to connect PostgreSQL and SQL Server remotely by enabling:

- `pg_hba.conf` remote access in Slackware.
- TCP/IP and port 1433 rules in Windows Firewall.
- Automatic startup services for both database engines.

### Cloud Infrastructure with Amazon EC2

Students deployed **web servers** in **AWS EC2** using **Amazon Linux 2**:

- Created **VPCs**, **subnets**, **internet gateways**, and **route tables**.
- Configured **security groups** for HTTP/SSH access.
- Deployed **Apache web servers** with custom HTML pages hosted publicly.
- Explored **Elastic IP**, **scalability (Auto Scaling)**, **Amazon RDS**, and **security practices (IAM, GuardDuty, Network Firewall)**.
- Compared **AWS hosting** vs. traditional hosting, emphasizing automation, scalability, and reliability.

### Results and Learning Outcomes

This lab provided an end-to-end view of **network communication, database management, and cloud infrastructure**, achieving:

- Packet-level understanding of **DNS, HTTP, and Ethernet** communications.
- Successful deployment of **PostgreSQL, SQL Server, and Azure SQL** in hybrid environments.
- Practical use of **AWS EC2, VPCs, and Apache web servers**.
- Integration of **security, scalability, and automation principles** across cloud and on-premise platforms.
- Strengthened comprehension of **data transport, encryption (TLS), and virtual networking** within modern IT ecosystems.

## Application Layer, Base Platform, and Network Layer Protocols

This section presents the **implementation, analysis, and interaction** of **application-layer, base platform, and network-layer protocols** within heterogeneous environments, emphasizing how these layers collaborate to deliver **reliable, scalable, and observable network services**.

The work integrates **routing protocols, web services, DNS resolution, transport reliability, and cloud-based monitoring**, using **Cisco Packet Tracer**, **Wireshark**, **Linux/Solaris systems**, **Windows Server**, and **Microsoft Azure** to demonstrate end-to-end communication from the network core to the application layer.

### Network Layer Protocols and Routing Operations

The network layer was implemented and validated through **IPv4 addressing, subnetting, and routing configuration** on Cisco routers:

- Assignment of **IPv4 addresses**, subnet masks, gateways, and broadcast domains based on host requirements.
- Implementation of **static routing** to enable communication between non-directly connected networks.
- Deployment and comparison of **dynamic routing protocols (EIGRP and OSPF)** to evaluate convergence, scalability, and routing efficiency.
- Verification of routing tables and path selection using commands such as `show ip route` and `tracert`.

Connectivity was validated through **ICMP Echo Requests**, confirming full inter-network reachability and correct routing behavior across serial and Ethernet links.

### Transport Layer Reliability and Process Communication

The transport layer was analyzed with emphasis on **TCP-based communication** supporting web applications:

- Observation of **TCP three-way handshakes**, sequence numbers, acknowledgments (ACKs), and retransmissions.
- Analysis of **segmentation and reassembly**, ensuring correct delivery of application data.
- Evaluation of **flow control and congestion control mechanisms**, highlighting their role in maintaining network stability under load.
- Packet inspection with Wireshark to validate checksums and detect transmission errors.

These mechanisms ensured **reliable, ordered, and loss-free data delivery** between clients and servers.

### Application Layer Services and Web Protocols

Multiple application-layer services were deployed across different operating systems:

- Configuration of **Apache (Solaris)**, **Nginx (Slackware Linux)**, and **IIS (Windows Server)** as HTTP servers.
- Creation of static and dynamic web pages to validate service availability.
- Deployment of **PHP-enabled web applications** integrated with **PostgreSQL databases** for persistent data storage.
- Testing of services using **curl**, web browsers, and DNS-based access.

HTTP transactions were validated by inspecting **request methods (GET)**, **response codes (200 OK)**, and **HTTP headers**, confirming correct interpretation at the application layer.

### DNS Resolution and Service Abstraction

A **DNS service** was implemented to abstract IP addressing and improve usability:

- Configuration of **zone files**, A records, and name resolution for web servers.
- Validation of DNS functionality through forward lookups and service access via domain names.
- Integration of DNS with web services to allow access using **human-readable hostnames** instead of IP addresses.

This abstraction demonstrated the importance of DNS in **service scalability and administrative simplicity**.

### Base Platform Services and System Integration

Base platform services were configured to support application execution and persistence:

- Installation and configuration of **PHP runtimes**, system libraries, and compilation dependencies.
- Deployment of **PostgreSQL databases**, including schema creation, user management, and permission control.
- Configuration of service startup and process management to ensure persistence across reboots.

These components formed the foundation required for stable and secure application-layer operation.

### Cloud Monitoring and Observability with Azure

Cloud-based monitoring was implemented using **Azure Application Insights**:

- Real-time observation of **request rates, response times, dependency calls, and resource usage (CPU and memory)**.
- Analysis of application behavior under repeated client requests.
- Visualization of application topology and external dependencies.
- Use of telemetry data to identify performance bottlenecks and validate SLA compliance.

This demonstrated how observability tools enhance **operational awareness and proactive management** in modern cloud environments.

### Protocol Interaction and End-to-End Communication

The interaction between layers was analyzed holistically:

- **Network layer (IP)** ensured logical addressing and routing across geographic locations.
- **Transport layer (TCP)** guaranteed reliable delivery and error handling.
- **Application layer (HTTP, DNS)** enabled correct request interpretation, session handling, and content delivery.

Experiments using **ICMP (ping, tracert)** illustrated real-world routing paths, latency, and intermediary network behavior, reinforcing the layered model of communication.

### Results and Learning Outcomes

This section achieved a comprehensive understanding of protocol integration across layers:

- Successful configuration of **routing, transport, and application-layer protocols**.
- Practical deployment of **web servers, databases, and DNS services** across multiple platforms.
- Deep analysis of **TCP/IP behavior** using packet capture tools.
- Integration of **cloud observability** into traditional network and application deployments.
- Clear demonstration of how **layered protocols cooperate** to deliver reliable, secure, and scalable services.

This work highlights the critical role of **protocol interoperability and platform integration** in enterprise and cloud-based network architectures.

## Integration and Operation of LAN/WLAN Infrastructures and Application Layer Services

This section documents the **design, configuration, and operational integration** of **wired (LAN) and wireless (WLAN) network infrastructures** with **application-layer services**, combining **logical segmentation**, **physical connectivity**, and **service deployment** in both simulated and real environments.

The work integrates **Ethernet switching, VLAN segmentation, trunking, WiFi deployment, and routing mechanisms** with **application-layer services** such as **web servers, databases, and network management tools**, using **Cisco Packet Tracer**, **Wireshark**, **Linux/Solaris systems**, and **cloud infrastructure** to bridge theory and practice.

### LAN Infrastructure and Switching Operations

The wired LAN infrastructure was implemented using **Cisco Layer 2 and Layer 3 switches**, focusing on scalability, segmentation, and loop prevention:

- Configuration of **basic switch security**, including hostname assignment, password encryption, console and VTY access control, and administrative banners.
- Implementation of **VLAN-based segmentation** to logically separate network traffic, improving performance and security.
- Configuration of **access ports** and **802.1Q trunk links** to allow VLAN propagation between switches.
- Verification of VLAN membership and trunk status using commands such as `show vlan brief` and `show interfaces trunk`.

Connectivity and correct operation were validated through **ICMP testing (ping)** and **packet-level inspection**, confirming proper MAC learning, VLAN isolation, and inter-switch communication.

### Spanning Tree and Network Stability

To ensure loop-free operation in multi-switch topologies, **Spanning Tree Protocol (STP - PVST)** was enabled and analyzed:

- Observation of **root bridge election**, port roles (root, designated, blocked), and convergence behavior.
- Use of **PortFast** on end-device access ports to reduce startup delays while maintaining loop protection.
- Packet analysis of **STP BPDUs** using Wireshark to understand topology control mechanisms.

This analysis reinforced the importance of STP in maintaining **network stability and redundancy** in larger LAN deployments.

### WLAN Deployment and Wireless Network Integration

Wireless networking was deployed using **wireless routers and access points**, integrated with the wired LAN:

- Configuration of **SSIDs**, channel allocation, transmission power, and coverage planning to reduce interference.
- Implementation of **WPA2-PSK with AES encryption**, ensuring secure wireless access.
- Use of **DHCP services** to dynamically assign IP addresses to wireless clients.
- Analysis of **NAT behavior**, differentiating communication between private and public IP spaces.

Wireless connectivity was validated through **intra-WLAN and WLAN-to-LAN communication tests**, demonstrating proper isolation, routing, and address translation behavior.

### Traffic Analysis and Network Validation

**Wireshark** was used extensively to analyze real and simulated traffic:

- Capture and inspection of **ARP**, **ICMP**, **STP**, **DHCP**, and **HTTP** packets.
- Verification of **MAC address resolution**, broadcast behavior, and switch learning processes.
- Analysis of encapsulation across OSI layers, from Ethernet frames to application-layer payloads.

These captures provided a detailed view of how **LAN and WLAN infrastructures transport application-layer data** under different scenarios.

### Application Layer Services Deployment

Application-layer services were deployed and integrated with the network infrastructure:

- Installation and configuration of **Apache web servers** with **PHP** support on cloud-based Linux systems.
- Deployment of a **dynamic web application** connected to a **relational database (MariaDB/PostgreSQL)** for persistent data storage.
- Validation of service availability through HTTP access and database transactions.
- Secure service operation using proper user privileges and database access controls.

This integration demonstrated how **network infrastructure directly supports application availability, performance, and security**.

### Network Management, Monitoring, and Automation

Network operation was complemented with **management and diagnostic tools**:

- Implementation of **SNMP agents** on Solaris and Slackware systems for remote monitoring.
- Development of **portable Shell scripts** for network diagnostics, interface inspection, routing analysis, and port detection.
- Verification of open services and monitoring endpoints using SNMP queries and custom scripts.

These tools highlighted the importance of **automation, monitoring, and observability** in modern network operations.

### Results and Learning Outcomes

The integration of LAN, WLAN, and application-layer services achieved the following outcomes:

- Successful deployment of **segmented, scalable wired and wireless networks**.
- Practical understanding of **VLANs, trunking, STP, NAT, and WiFi security**.
- End-to-end validation of **application-layer services over integrated network infrastructures**.
- Hands-on experience with **traffic analysis, network monitoring, and automation**.
- Clear correlation between **physical infrastructure, logical design, and service-level operation**.

## Data link layer, network layer, and application layer

This work focused on analyzing and implementing **Ethernet and WiFi networks**, integrating **data link, network, and application layer services**, and applying **dynamic routing protocols** such as EIGRP and OSPF to ensure optimal connectivity.

### Network Deployment and VLAN Segmentation

A **hybrid network topology** was implemented using **Layer 2 and Layer 3 switches, routers, and WiFi access points**. The configuration included:

- **IP addressing** according to predefined subnets.
- **VLAN creation** for separating private networks from WAN connections.
- **DNS configuration** to allow host resolution by both IP and domain name.
- Connectivity validation using **ping, traceroute, and web browsing**.

Each switch and router was configured with **hostnames, console/VTY passwords, and security banners**. DHCP was enabled on routers for automatic IP assignment, including subnet-specific exclusions and relay addresses for cross-network DHCP requests.

Initial configurations ensured that **devices within each VLAN could communicate internally**, while access to external networks was controlled. Switch trunk ports were enabled to carry VLAN traffic between devices.

### Dynamic Routing Implementation

Using **Packet Tracer simulations**, a multi-city network was subnetted according to host requirements. Dynamic routing protocols were configured to manage traffic between LANs:

- **EIGRP**: Configured with AS 1, using composite metrics based on **bandwidth (K1)** and **delay (K3)**, while other K-values remained 0. Auto-summarization was disabled to maintain accurate VLSM routing.
- **OSPF**: Implemented for comparison, allowing evaluation of routing behavior and metric calculation.

Routers exchanged routing information dynamically, ensuring that all subnets were reachable. Connectivity was verified using **ping** tests between devices in different cities, confirming correct routing table updates and end-to-end communication.

### DHCP and IP Address Automation

DHCP servers were configured to assign IP addresses, subnet masks, and gateways automatically to host devices:

- Example configuration for VLAN 35:

  - Device “Natalia”: IP 90.0.0.10, subnet mask 255.255.255.248, gateway 90.0.0.9.
  - Other devices in the same subnet received sequential IPs within the /29 range.

This configuration optimized network management, reduced manual errors, and ensured proper access to both **internal and external services**.

### Application Layer Services

To integrate the application layer, **DNS and web servers** were deployed, enabling hosts to resolve names and access services efficiently:

- Hostnames were resolved using both **IP addresses and domain names**.
- DNS servers were configured to support internal network queries.
- Web servers were tested via browser and command-line clients to validate accessibility and response.

### Results and Learning Outcomes

This lab consolidated knowledge of the **data link, network, and application layers**:

- VLAN segmentation and planned IP addressing demonstrated **logical network organization**.
- DHCP automation optimized resource allocation and reduced administrative overhead.
- EIGRP and OSPF implementation reinforced understanding of **dynamic routing metrics**, including bandwidth and delay-based decisions.
- Integration of **DNS and web services** highlighted the importance of application-layer availability in network design.
- End-to-end testing verified connectivity across both **wired and wireless LANs** and WAN links.

Overall, this work strengthened skills in **network design, configuration, and administration**, emphasizing the strategic integration of physical and logical infrastructures to build **robust, secure, and scalable networks**.
