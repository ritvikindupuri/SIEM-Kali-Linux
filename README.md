# Live-Fire Cyber Attack Simulation & SIEM Analysis in Elastic

This project demonstrates an end-to-end "Purple Team" exercise, where I simulated real-world cyberattacks from a Kali Linux environment and then built and validated the detection capabilities within an Elastic Cloud SIEM.

The entire lifecycle of an attack is covered: from launching offensive tools like **Nmap** and **Hydra**, to engineering custom **KQL detection rules**, and finally analyzing the results in **Kibana** dashboards.

---
## Lab Setup & Log Ingestion

The environment consists of a Kali Linux virtual machine configured with an **Elastic Agent**. The agent was enrolled in a central Elastic Cloud fleet, allowing it to forward all system and security logs to the SIEM in real time.

The simulated attacks generated a massive spike in log data, as shown in the Kibana visualization below. This highlights the importance of monitoring ingestion volume as a potential indicator of malicious activity.

<img src="./assets/Logs Inflow Graph.png" width="800" alt="Graph showing a large spike in log ingestion during the attacks">
*<p align="center">Figure 1: A massive spike in log volume corresponding with the attack simulation times.</p>*

---
## Attack Scenario 1: Port Scanning with Nmap

### The Attack
The first simulation involved a common reconnaissance technique: a port scan. I used **Nmap** from the Kali VM to scan the local host for open ports, a typical first step for an attacker looking for entry points.

<img src="./assets/Kali Linux Nmap scan.png" width="800" alt="Terminal showing an Nmap scan being executed">
*<p align="center">Figure 2: Executing an Nmap service scan from the attacker's machine.</p>*

### The Detection Engineering
To detect this activity, I wrote a custom detection rule in Elastic SIEM using **Kusto Query Language (KQL)**. The rule is designed to fire when any event action related to "nmap_scanning" is logged by the Elastic Agent.

<img src="./assets/Nmap Detetcion Rule.png" width="800" alt="Screenshot of the custom KQL rule for Nmap detection">
*<p align="center">Figure 3: The custom KQL detection rule for Nmap activity.</p>*

### The Log Analysis
Drilling down into the raw logs in the Kibana "Discover" tab confirms that the Elastic Agent successfully captured the Nmap process execution, providing the necessary data for the detection rule to fire.

<img src="./assets/Nmap Rule detection.png" width="800" alt="Raw logs in Kibana showing Nmap process execution details">
*<p align="center">Figure 4: Raw log evidence of the Nmap scan captured by the Elastic Agent.</p>*

---
## Attack Scenario 2: SSH Brute-Force with Hydra

### The Attack & Real-Time Detection
The second simulation involved a credential access technique: an SSH brute-force attack using **Hydra**. As shown in the composite image below, the moment the Hydra attack was launched from the Kali terminal, Elastic SIEM's pre-built rule for "Potential Internal Linux SSH Brute Force Detected" triggered a high-severity alert. This demonstrates the power of a well-configured SIEM to provide real-time alerts on active threats.

<img src="./assets/SSH Brute Force Detection.png" width="800" alt="Composite image showing a Hydra attack and the corresponding Elastic SIEM alert">
*<p align="center">Figure 5: The Hydra attack (right) triggering a real-time brute-force detection alert (left).</p>*

---
## 🚀 Skills & Technologies

* **SIEM & Log Analysis:** Elastic SIEM (Elastic EDR), Kibana, Elastic Agent.
* **Detection Engineering:** Writing and testing custom detection rules using Kusto Query Language (KQL).
* **Offensive Security Tools:** Nmap (Reconnaissance), Hydra (Credential Access).
* **Threat Simulation:** Executing Red Team tactics in a controlled environment to validate Blue Team defenses.
* **Data Visualization:** Building Kibana dashboards to monitor and analyze security event data.
