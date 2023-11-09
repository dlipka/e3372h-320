#!/bin/bash
MODEM_IP="192.168.8.1"
curl -s -X GET "http://$MODEM_IP/api/webserver/SesTokInfo" > ses_tok.xml
grep -oP "<SesInfo>(.*)</SesInfo" ses_tok.xml | cut -d ">" -f 2 | cut -d "<" -f 1 > session.txt
grep -oP "<TokInfo>(.*)</TokInfo" ses_tok.xml | cut -d ">" -f 2 | cut -d "<" -f 1 > token.txt
COOKIE=$(cat session.txt)
echo $COOKIE
TOKEN=$(cat token.txt)
echo $TOKEN
curl -X POST "http://$MODEM_IP/api/dhcp/settings" \
-H "Cookie: $COOKIE" \
-H "__RequestVerificationToken: $TOKEN" --data \
"<?xml version="1.0" encoding="UTF-8"?> \
<request> \
    <DhcpIPAddress>10.10.1.1</DhcpIPAddress> \
    <DhcpLanNetmask>255.255.255.0</DhcpLanNetmask> \
    <DhcpStatus>1</DhcpStatus> \
    <DhcpStartIPAddress>10.10.1.2</DhcpStartIPAddress> \
    <DhcpEndIPAddress>10.10.1.2</DhcpEndIPAddress> \
    <PrimaryDns>10.10.1.1</PrimaryDns> \
    <SecondaryDns>10.10.1.1</SecondaryDns> \
</request>"
