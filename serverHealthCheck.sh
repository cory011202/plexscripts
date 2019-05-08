#!/bin/bash

#ping server and check if it is alive. If not send email and wol command.

SERVER=xxx.xxx.xxx.xxx

MACADDRESS=xx:xx:xx:xx:xx:xx

#echo $SERVER

if  ping -c 10 $SERVER >/dev/null
then
        echo `date` " -- Its Alive">> /scripts/serverHealth.log
else
        echo `date` " -- Server is down. Trying to start" | mail -s "Server IS DOWN" user@mail.com
        echo `date` " -- Sent email as server is down" >> /scripts/serverHealth.log
#       echo "Waking up $SERVER"
        /usr/bin/wakeonlan $MACADDRESS

fi
