# Network Intrusion Detection System (NIDS) with Snort 3
### CodeAlpha Cybersecurity Internship - Task 4

## 📌 Overview
A fully functional Network Intrusion Detection System implemented on Kali Linux using Snort 3.10.2.0. The system monitors network traffic, detects attacks in real-time, and generates security alerts.

## 🚀 Features
- Real-time network traffic monitoring on interface eth0
- 8 custom detection rules (ICMP, SSH, HTTP, Port Scans, etc.)
- Console alerts and file logging
- Attack visualization and reporting
- Automated testing scripts

## ⚡ Quick Start
```bash
# 1. Install Snort
sudo apt install snort -y

# 2. Copy configuration
sudo cp config/snort.lua /etc/snort/

# 3. Start monitoring
sudo snort -c /etc/snort/snort.lua -i eth0 -A alert_fast
