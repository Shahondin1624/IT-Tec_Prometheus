# Prometheus Github-Monitoring an IT-Tec Project

## Preface

Our goal is to monitor the github-page of [Klara Oppenheimer Schule](https://github.com/KlaraOppenheimerSchule). For
this we wanted to use [github-exporter-arm64](https://github.com/Shahondin1624/github-exporter-arm64) a fork
of [infinityworks/github-exporter](https://github.com/infinityworks/github-exporter) we created for arm64-based
CPU-architectures such as the Raspberry Pi. However this tool was not able to provide the full functionality we required. 
This lead us to create our own simple (and pretty limited) [exporter](https://github.com/Shahondin1624/github-exporter-arm64-rs).
This exporter is able to retrieve all commits since a given date. Furthermore we
use [prom/prometheus](https://hub.docker.com/r/prom/prometheus) to pull metrics such as commits from
github-exporter-arm64-rs. We aim to provide an automated deployment script that requires as few user interactions as
possible.  
The prometheus web interface can be accessed at ```http://<ip_of_your_raspberry>:9000```

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
   1.4 Remember to change the keyboard layout to yours  
   ![Screenshot of Raspberry Pi Imager showing options to set local hostname and ssh connection](https://raw.githubusercontent.com/Shahondin1624/IT-Tec_Prometheus/main/screenshots/1_Imager_4.png)

2. Insert the MicroSD-Card into the PI and connect it to an power outlet  
   2.1 Wait until it has booted up completely

3. Now connect to the PI via SSH  
   3.1 Your computer has to be in the same network as the PI for this  
   3.2 Connect to your Pi with ssh command

```
ssh <pi_username>@<pi_local_address>
```  

3.3 copy the setup script to the PI and run it

```
scp <path_to_the_setup_script> <pi_username>@<pi_local_address>:<remote_path_for_setup_script>
```  

3.4 make it executable

```
chmod +x <setup_script_name>
```  

4. Run the setup script

```
./ project_setup.sh
```  

5. Resolve any errors that *might* pop up during installation


6. Reboot your PI

```
sudo reboot now
```

7. Run the project configuration script  
   7.1 Change into /scripts

```
cd scripts/
```  

7.2 run the script  
You need to pass your Github Access Token as the first parameter to the configuration script to get access to the Github API. This is because we don't want a Access Token in a public Repository.
```
./ configure_project.sh TOKEN=<your Github Access Token>
```


## Github exporter structure

An exporter is an application that exposes data via a http endpoint for Prometheus. Prometheus pulls this so called metrics periodically.  
Our exporter calls the Github REST API to get information about the [Klara Oppenheimer Schule](https://github.com/KlaraOppenheimerSchule) organisation. This json data is then processed to expose metrics in OpenMetrics format. This format is required for Prometheus.
### Github-exporter-arm64-rs

To fetch exactly the data we want, we created our own simple (and pretty limited) exporter for Github in Rust. The exporter is able to export metrics of a specific Github Organization, in our case [Klara Oppenheimer Schule](https://github.com/KlaraOppenheimerSchule).  
The exporter provides metrics such as total number of commits, total number of insertions, total number of delition over all repositories of the organisation. In addition it provides metrics for number of commits, number of insertions and number of deletions per repository.
