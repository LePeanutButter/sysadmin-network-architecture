# Cisco Packet Tracer Network Topologies

Packet Tracer files organized by network design scenarios and protocol implementations. Each simulation highlights key aspects of network architecture, from IP planning to inter-VLAN routing and WAN emulation.

## Operating System Configuration, Shell, and Network Support Software

This section contains the practical implementation of an OSPF (Open Shortest Path First) network simulation, created using Cisco Packet Tracer. The goal of this project was to apply theoretical knowledge and create a functional and scalable network design based on a reference topology. Below are the details of the implementation and the associated files.

### Overview

The original network topology, shown in Figure 6, was used as a reference for the OSPF implementation. It defines the placement of routers, switches, servers, and end devices, as well as the segmentation of VLANs and the assignment of IP addresses. OSPF was configured to ensure the network's functionality, scalability, and efficiency.

The project includes two main configurations that can be reviewed and replicated:

1. **Santiago's Implementation**  
   Filename: `ospf-santiago-implementation.pkz`  
   This file contains the complete configuration of the network designed and implemented by Santiago. It includes IP address assignments, VLAN databases, and serial link settings for WAN simulation.

2. **Natalia's Implementation**  
   Filename: `ospf-natalia-implementation.pkt`  
   This file contains the network configuration designed by Natalia. Like Santiago's configuration, it includes all the necessary settings for VLANs, IP addresses, and the configuration of serial links for the WAN network simulation.

### File Descriptions

- **`ospf-santiago-implementation.pkz`**  
  This file represents the network configuration created by Santiago. It includes the setup of routers, switches, end devices, and the OSPF routing protocol. The network design is based on the original reference topology, with various VLANs and subnets configured for optimal performance.

- **`ospf-natalia-implementation.pkt`**  
  This file contains Natalia's OSPF configuration. Similar to Santiago's file, it includes the setup of all network devices and the application of OSPF for dynamic routing. This configuration is also based on the same reference topology and implements similar network segmentation and WAN settings.

### Network Design

#### OSPF Overview

OSPF (Open Shortest Path First) is a dynamic routing protocol that helps routers exchange information about network topology and compute the most efficient route to each destination. In this implementation, OSPF ensures:

- **Fast convergence**: Quickly adapts to network changes.
- **Load balancing**: Distributes traffic across multiple paths to prevent congestion.
- **Scalability**: Easily accommodates additional routers and subnets.

#### VLANs and Subnets

The network is divided into multiple VLANs to segment traffic and improve security and performance. Each VLAN corresponds to a specific subnet, and OSPF is used to dynamically route traffic between these VLANs.

#### Serial Link Configuration

For the WAN simulation, serial links were configured between the routers. These links are essential for simulating communication between remote sites and are part of the OSPF configuration.

## Application Layer Protocols and Physical Layer Standards in Network Infrastructures

This section documents the **Packet Tracer simulations** developed for the _Application Layer Protocols and Physical Layer Standards in Network Infrastructures_ lab.
The goal was to integrate and analyze **application-layer protocols (DNS, HTTP, FTP, Email, NTP)** within a multi-domain network topology, and to link these logical configurations with physical-layer standards such as **UTP cabling, RJ-45 connectors**, and **patch panel wiring.**

### Overview

Two independent implementations were developed, both representing complete multi-domain academic networks for the “Facultad de Sistemas, Civil y Eléctrica” (Systems, Civil, and Electrical programs):

1. **Santiago’s Implementation**
   Filename: `campus-network-santiago-implementation.pkt`  
   A full deployment of a multi-domain network with configured DNS, HTTP, FTP, and Email services.
   The simulation includes dynamic testing through PDU inspection and protocol encapsulation tracking, ensuring correct operation across all OSI layers.

2. **Natalia’s Implementation**
   Filename: `campus-network-natalia-implementation.pkt`  
   A complementary implementation focusing on DNS resolution, HTTP and FTP service configuration, and email communication within and between domains.
   Includes visual verification using Simulation Mode, ICMP ping testing, and service validation via built-in browser and email client tools.

### Network Design Summary

Both network designs share a similar logical structure and domain hierarchy:

- **Domains configured:** `sistemas.com`, `civil.com`, `electrica.com`
- **Services included:**
  - **DNS** — Forward resolution for A, CNAME, and MX records.
  - **HTTP** — Custom HTML pages hosted in each department’s web server.
  - **Email (SMTP/POP3)** — Domain-specific accounts for intra- and inter-domain communication.
  - **FTP** — File transfer service with read/write permissions and user authentication.
  - **NTP** — Time synchronization simulated across Solaris and Slackware clients.
- **Connectivity testing:** Conducted via `ping`, `telnet`, and simulated PDU analysis to visualize the encapsulation sequence through all seven OSI layers.

### Physical Layer Integration

Each logical design also includes references to physical connectivity and structured cabling:

- **Straight-through and cross-over cables** (T568A/T568B) for LAN and inter-switch connections.
- **Patch panel mapping and verification** for switch interlinks.
- **Cabling simulation** using Copper Straight-Through and Copper Cross-Over in Packet Tracer.

This ensures a cohesive understanding of how physical standards interact with application-level configurations in real-world infrastructures.

### Results and Learning Outcomes

- Successful integration of **multi-service, multi-domain environments** within Packet Tracer.
- Demonstrated understanding of **application protocols (HTTP, DNS, FTP, Email, NTP)** and their interactions.
- Clear linkage between **logical network design** and **physical layer implementation.**
- Hands-on validation of **protocol encapsulation, service resolution, and inter-domain communication.**
- Reinforcement of **structured cabling knowledge** aligned with TIA/EIA standards.

## Integration and Operation of LAN/WLAN Infrastructures and Application Layer Services

This section documents the **Packet Tracer simulations** developed for the _Integration and Operation of LAN/WLAN Infrastructures and Application Layer Services_ lab. The goal was to implement **complex wired and wireless networks**, configure VLANs, DHCP services, and wireless security, and verify connectivity, traffic flow, and loop prevention across all devices.

### Spanning Tree and Switch Configuration

This phase focused on **building and managing larger networks with multiple switches**. Each setup included basic switch configuration, IP addressing, connectivity verification, and analysis of network behavior in simulation mode. Key protocols such as **Spanning Tree Protocol (STP)**, **Cisco Discovery Protocol (CDP)**, and **Dynamic Trunking Protocol (DTP)** were tested to understand loop prevention, topology discovery, and dynamic trunk negotiation.

#### Santiago Implementation

**File:** `santiago-spanning-tree.pkt`

- **Topology:** 5 switches, 1 multilayer switch, 3 hubs, 2 laptops, 3 servers, 11 PCs.
- **Subnet:** 65.148.77.0/24, gateway 65.148.77.1, IPs assigned 65.148.77.100-65.148.77.115.
- **Switch configuration:**

  - Enable privileged mode and configure terminal
  - Set hostname and disable domain lookup (`no ip domain-lookup`)
  - Enable PVST (`spanning-tree mode pvst`) and default PortFast (`spanning-tree portfast default`)
  - Password encryption (`service password-encryption`)
  - Banner and privileged password configuration (`enable secret class`)
  - Console and VTY access (`line console 0`, `line vty 0 4`, password `cisco`, `login`)

- **Multilayer switch:** VLAN 1 IP 65.148.77.1, subnet 255.255.255.0, `ip routing` enabled. Configuration saved (`copy running-config startup-config`).

**Testing and Results:**

- Pinging between devices (e.g., PC2 > PC3) showed 0% packet loss and low latency.
- Complex PDUs sent between multiple devices completed successfully.
- ARP broadcasts resolved MAC addresses dynamically.
- STP verified root, blocked, and designated ports to prevent loops.
- CDP allowed discovery of neighbor devices; DTP negotiated trunk links dynamically.
- PortFast used on host ports for rapid link activation.

#### Natalia Implementation

**File:** `natalia-spanning-tree.pkt`

- Focused on **connectivity verification, MAC table observation, and traffic optimization**.
- Devices assigned static IPs (e.g., 65.148.77.130).
- Ping tests confirmed ARP resolution and MAC address learning.
- Simulation mode verified STP operation and successful communication between PCs, laptops, and servers.

### Basic WiFi Configuration

This phase addressed **hybrid networks with wired and wireless connections**, including IP assignment, DHCP configuration, and wireless security.

#### Santiago Implementation

**File:** `santiago-basic-wifi-configuration.pkt`

- **Devices added:** 2 laptops, 2 PCs, 2 smartphones, 1 switch, 1 server, 1 wireless router WRT300N, 1 access point. Laptops included WPC300N WiFi modules.
- **IP addressing:** Wired devices 65.148.77.0/24, gateway 65.148.77.200.
- **Wireless router configuration:**

  - LAN IP 65.148.77.200, subnet 255.255.255.0, gateway 65.148.77.1, DNS 65.148.77.1
  - Mixed wireless mode, SSID `Santiago`, channel 6, auto bandwidth
  - WPA2-Personal AES security, passphrase `SECURITY_R`
  - DHCP enabled: 192.168.0.10-192.168.0.50

- **Access points:**

  - AP0: SSID `Botero`, channel 8, WPA2-PSK AES, range 140 m
  - AP1: SSID `Circle`, channel 8, WPA2-PSK AES, manually assigned IPs

- **Results:** Ping tests confirmed successful communication, correct NAT handling, and minimal latency.

#### Natalia Implementation

**File:** `natalia-basic-wifi-configuration.pkt`

- **Manual IP assignment** for PCs and servers.
- Wireless router configured with SSIDs `Laura` and `Rectangle`, DHCP for mobile clients (192.168.0.60-192.168.0.99), WPA2-PSK security.
- Access point `Perilla` on channel 6.
- Ping tests validated successful connectivity and correct DHCP assignment.

### Wired and Wireless LAN Configuration

This phase integrated wired and wireless devices into a single hybrid network and implemented **VLAN segmentation** to optimize traffic and isolate groups.

#### Santiago Implementation

**File:** `santiago-wired-and-wireless-lan.pkt`

- **Initial setup:** Six groups of devices connected without VLANs; wired IPs 171.18.100.50-171.18.100.80, subnet 255.0.0.0.
- **Access points & wireless routers:** WPA2-PSK AES security, DHCP ranges assigned for wireless clients.
- **VLANs configured:**

  - VLAN 10: Rectangle network
  - VLAN 20: Circle network
  - VLAN 30: Irregular network

- **Trunk ports:** Enabled on switches for all VLAN traffic.
- **Connectivity verification:**

  - Intra-VLAN communication: successful (0% packet loss, low latency)
  - Inter-VLAN communication: blocked (100% packet loss)

#### Natalia Implementation

**File:** `natalia-wired-and-wireless-lan.pkt`

- Manual IP configuration for wired PCs.
- Wireless networks `Rectangle` (green) and `Circle` (purple) configured with WPA2-PSK AES and DHCP.
- VLAN segmentation applied to isolate traffic per group.
- Ping tests confirmed:

  - Inter-VLAN blocked (100% packet loss)
  - Intra-VLAN successful (minimal latency)

### Results and Learning Outcomes

- Implemented **hybrid wired/wireless networks** with secure access points and DHCP services.
- VLANs provided **traffic segmentation** and inter-group isolation.
- STP, CDP, and DTP ensured **loop prevention, neighbor discovery, and trunk negotiation**.
- Connectivity verification via ping and simulation mode confirmed **proper network operation**.
- Hands-on experience reinforced **switch and router configuration, wireless network setup, VLAN management, and network security best practices**.

## Data link layer, network layer, and application layer

This section documents the **Packet Tracer simulations** developed for the _Data Link, Network, and Application Layer_ lab. The objective was to implement a **complex, multi-city network topology** with dynamic routing, DHCP configuration, and EIGRP operation, while verifying connectivity and proper IP allocation across all devices.

### Overview

Three implementations were developed, each representing a functional deployment of a city-wide network:

1. **Santiago’s DHCP and EIGRP Implementation**
   Filename: `santiago-dhcp-configuration.pkt`
   This file includes the complete configuration of Santiago’s network. It contains subnetting for multiple cities, DHCP pools and exclusions, router and switch configurations, and dynamic routing via EIGRP. Connectivity testing is performed using ping and traceroute to verify communication between all devices.

2. **Laura’s DHCP Implementation**
   Filename: `laura-dhcp-configuration.pkt`
   Laura’s configuration focuses on DHCP deployment across multiple LANs. Routers are configured to manage traffic between subnets and provide IP addresses dynamically to connected PCs. The simulation demonstrates automatic assignment of IP, subnet mask, and default gateway, validating the DHCP service.

3. **EIGRP Routing Configuration**
   Filename: `eigrp-configuration.pkt`
   This file documents the implementation of the **EIGRP routing protocol** across the network. Routers exchange dynamic routing information, maintain neighbor relationships, and calculate composite metrics based on bandwidth and delay. Verification commands such as `show ip route`, `show ip protocols`, and `show ip eigrp topology` confirm that all routes are learned and that inter-city connectivity is functional.

### Network Design Summary

Both Santiago and Laura’s implementations follow a structured subnetting plan based on host requirements for each city. Examples include:

- **Santiago Network:** 123.89.128.0/20

  - Sevilla SW0: 123.89.128.64/26
  - Toledo SW2: 123.89.130.0/24
  - Valencia SW6: 123.89.132.0/23
  - Madrid SW10: 123.89.135.128/25

- **Laura Network:** 173.15.160.0/20

  - Sevilla SW0: 173.15.160.0/22
  - Toledo SW2: 173.15.164.0/22
  - Valencia SW6: 173.15.172.0/24
  - Madrid SW10: 173.15.170.0/24

Each switch is assigned an IP address as the default gateway for its LAN. Routers are configured with DHCP pools, IP helper addresses, and EIGRP routing to ensure seamless communication between cities and subnets.

### Actions Performed

- **Topology Implementation:**
  Designed and deployed a multi-city network topology, interconnecting routers and switches to simulate a complete operational network.

- **Switch Configuration:**
  Hostnames, console and VTY passwords, banners, and security best practices were applied. Configurations were saved to startup memory to ensure persistence.

- **Router Configuration:**
  Hostnames, passwords, banners, CEF, DHCP services with exclusions, helper addresses, and EIGRP routing were configured. Subnetting information was applied to all interfaces, and configurations were saved for stability.

- **DHCP Verification:**
  PCs were configured to obtain IP addresses automatically. Example: PC0 received 173.15.160.3/22 with gateway 173.15.160.1, confirming correct DHCP operation.

- **EIGRP Validation:**
  Neighbor relationships and routing tables were verified using `show ip route`, `show ip protocols`, and `show ip eigrp topology`. Ping tests confirmed end-to-end connectivity across different subnets and cities.

### Results and Learning Outcomes

- Dynamic routing with **EIGRP** enables efficient communication between multiple cities and LANs.
- **DHCP deployment** ensures automated IP assignment, reducing configuration errors and improving network management.
- Verification commands demonstrate **full connectivity**, correct route propagation, and proper IP addressing.
- Hands-on implementation reinforced understanding of **Data Link, Network, and Application Layer functions**, including switch operation, router configuration, and DHCP service deployment.
