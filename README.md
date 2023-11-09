# e3372h-320
Bash script for Huawei E3372-H-320 - updating DHCP section of the device with POST API method

Script POST request API method to update IP addresses.
It will enforce any IPv4 IP address with just one API limitation.
Developers in firmware limited a network mask to only /24 mask, therefore changing to anything else is not accepted. 
In proxy networks we wont be able to enforce /30 (255.255.255.252) for example.
If you change <DhcpLanNetmask>**255.255.255.0**</DhcpLanNetmask> to something else - API will refuse to make a change with ERROR code 9003.

Script works on Huawei E3372H-320 from British Telecom - product known as BT 4G Assure soft version WEBUI 10.0.3.1.
