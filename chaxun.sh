#!/bin/bash

date_train=2018-02-10

yingtan=YTG
shenzhen=SZQ
hangzhou=HZH
shanghai=SHH
guangzhou=GZQ
nanchan=NCG


from=$shenzhen
to=$yingtan

while true
do
	echo ----`date +"%Y/%m/%d %H:%M.%S"`----
	curl -s --insecure --user-agent "Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101 Firefox/38.0" "https://kyfw.12306.cn/otn/leftTicket/queryA?leftTicketDTO.train_date=2018-09-28&leftTicketDTO.from_station=SZQ&leftTicketDTO.to_station=YTG&purpose_codes=ADULT" | grep -E "预订[^,]*" -o | awk -F\| '{print "深圳-鹰潭 20180928 车次 "$3" |","出发时间 "$8" |"," 到达时间"$9" |","硬卧 "$28" |","硬座 "$29" |","无座 "$26" |"}'
	sleep 1
done
