# e3372h-320
Bash script for Huawei E3372-H-320 - updating DHCP section of the device with POST API method

Script POST req API method to update IP addresses.
It can enforce any IPv4 IP address with just one API limitation.
Developers in firmware accepted only /24 mask, therefore changing to anything else is not accepted. 
We wont be able to enforce /30 so 255.255.255.252 for example.
If you change <DhcpLanNetmask>255.255.255.0</DhcpLanNetmask> to something else - API will refuse to make change with ERROR code 9003.
