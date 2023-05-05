# Prometheus Github-Monitoring an IT-Tec Project
## Preface
## Setup steps
### Requirements
1. A Raspberry PI, connected to the internet
2. A MicroSD-Card to contain the bootable Raspian OS
3. A computer to flash the MicroSD-Card and connect to the PI via SSH
### Setup Walkthrough
1. Flash the MicroSD-Card with **Raspberry PI OS Lite (64-Bit)**  
![Screenshot of Raspberry Pi Imager](https://raw.githubusercontent.com/Shahondin1624/IT-Tec_Prometheus/main/screenshots/1_Imager_1.png)  
1.1 Remember to set a *.local* hostname  
1.1 Enable SSH-password-authentication  
![Screenshot of Raspberry Pi Imager showing options to set local hostname and ssh connection](https://raw.githubusercontent.com/Shahondin1624/IT-Tec_Prometheus/main/screenshots/1_Imager_2.png)  
1.2 Set a username and password for the PI  
1.3 If the PI is not connected via LAN, then configure the wireless connection  
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
```
./ configure_project.sh
```