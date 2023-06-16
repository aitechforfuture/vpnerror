#!/bin/bash

# Check if VPN connection is successful
vpn_status=$(curl -s -o /dev/null -w "%{http_code}" http://www.gstatic.com/generate_204)

if [ "$vpn_status" != "204" ]; then
    # VPN connection failed, switch to direct mode
    curl -X PUT -d 'DIRECT' http://127.0.0.1:9090/proxies/APP%20CLONER
    curl -X PUT -d 'DIRECT' http://127.0.0.1:9090/proxies/WHATSAPP
fi
