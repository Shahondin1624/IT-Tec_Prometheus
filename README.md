# Prometheus Github-Monitoring an IT-Tec Project
## Preface
Our goal is to monitor the github-page of [Klara Oppenheimer Schule](https://github.com/KlaraOppenheimerSchule).
For this we use [github-exporter-arm64](https://github.com/Shahondin1624/github-exporter-arm64), a fork of
[infinityworks/github-exporter](https://github.com/infinityworks/github-exporter) we created for arm64-based
CPU-architectures such as the Raspberry Pi. Furthermore, we use [prom/prometheus](https://hub.docker.com/r/prom/prometheus)
to pull metrics such as commits from github-exporter-arm64. We aim to provide an automated deployment
script that requires as few user interactions as possible.  
The prometheus web interface can be accessed at http://<ip_of_your_raspberry>:9000

## Setup steps
### Requirements
1. A Raspberry PI, connected to the internet
2. A MicroSD-Card to contain the bootable Raspian OS
3. A computer to flash the MicroSD-Card and connect to the PI via SSH

### Setup Walkthrough
1. Flash the MicroSD-Card with **Raspberry PI OS Lite (64-Bit)**  
   ![Screenshot of Raspberry Pi Imager](https://raw.githubusercontent.com/Shahondin1624/IT-Tec_Prometheus/main/screenshots/1_Imager_1.png)

   1.1 Remember to set a *.local* hostname  
   1.2 Enable SSH-password-authentication  
![Screenshot of Raspberry Pi Imager showing options to set local hostname and ssh connection](https://raw.githubusercontent.com/Shahondin1624/IT-Tec_Prometheus/main/screenshots/1_Imager_2.png)

   1.3 Set a username and password for the PI  
   1.4 If the PI is not connected via LAN, then configure the wireless connection  
![Screenshot of Raspberry Pi Imager showing options to set local hostname and ssh connection](https://raw.githubusercontent.com/Shahondin1624/IT-Tec_Prometheus/main/screenshots/1_Imager_3.png)

   1.5 Remember to change the keyboard layout to yours  
![Screenshot of Raspberry Pi Imager showing options to set local hostname and ssh connection](https://raw.githubusercontent.com/Shahondin1624/IT-Tec_Prometheus/main/screenshots/1_Imager_4.png)

2. Insert the MicroSD-Card into the PI and connect it to a power outlet  
   2.1 Wait until it has booted up completely

3. Now connect to the PI via SSH  
   3.1 Your computer has to be in the same network as the PI for this  
   3.2 Connect to your Pi with ssh command  
