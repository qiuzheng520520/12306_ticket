#!/bin/bash

while true
do
curl -s -X GET http://140.143.49.31/api/ans2 -d "key=zscr&wdcallback=jQuery1124023602575832046568_1516879921673&_=1516879924064" -A "Mozilla/5.0 (Linux; Android 4.4.2; SM-G955N Build/NRD90M) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/30.0.0.0 Mobile Safari/537.36 SogouSearch Android1.0 version3.0 AppVersion/5909"  -e "http://nb.sa.sogou.com/" | sed "s/\\\//g" | sed "s/\"answers\"/\n\"answers\"/g" | cut -f12 -d":" | cut -f2 -d"\""
sleep 1
done
