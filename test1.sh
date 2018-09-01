#!/bin/bash

date_train=2018-03-15

yingtan=YTG
shenzhen=SZQ
hangzhou=HZH
shanghai=SHH
guangzhou=GZQ


from=$yingtan
to=$shenzhen

while true
do
	echo ----`date +"%Y/%m/%d %H:%M.%S"`----
	curl -s --insecure --user-agent "Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101 Firefox/38.0" "https://kyfw.12306.cn/otn/leftTicket/queryZ?leftTicketDTO.train_date=$date_train&leftTicketDTO.from_station=$from&leftTicketDTO.to_station=$to&purpose_codes=ADULT" | sed "s/\"//g" | sed "s/,result:/\n/g" | sed "s/{data.*SZQ://g" | sed "s/,YTG//g" | sed "s/\}//g" | sed "s/httpstatus.*//g" | sed "s/,|/\n/g" | sed "s/\[|//g" | cut -f3,8,9,13,26,28,29 -d"|"
	sleep 1
done
