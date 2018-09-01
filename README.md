

12306买火车票


方法一
1.查询余票
curl --insecure --user-agent "Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101 Firefox/38.0" "https://kyfw.12306.cn/otn/leftTicket/queryZ?leftTicketDTO.train_date=2018-02-12&leftTicketDTO.from_station=SZQ&leftTicketDTO.to_station=YTG&purpose_codes=ADULT" > 1.txt
2.过滤结果去掉双引号
sed "s/\"//g" 1.txt > 2.txt
3.过滤出发站点和目的站点
出发地：grep -o -E "SZQ:.*,YTG" 2.txt | sed "s/SZQ:\(.*\),YTG/\1/g"
目的地：grep -o -E "YTG:.*\},result" 2.txt | sed "s/YTG:\(.*\)\},result/\1/g"
4.过滤车次

方法二
1.查询余票
curl --insecure --user-agent "Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101 Firefox/38.0" "https://kyfw.12306.cn/otn/leftTicket/queryZ?leftTicketDTO.train_date=2018-02-12&leftTicketDTO.from_station=SZQ&leftTicketDTO.to_station=YTG&purpose_codes=ADULT" > 1.txt
2.过滤结果去掉双引号
sed "s/\"//g" 1.txt > 2.txt
3.过滤出发站点和目的站点
sed "s/,result:/\n/g" 2.txt | sed "s/{data.*SZQ://g" | sed "s/,YTG//g" | sed "s/\}//g"
4.过滤车次
sed "s/,result:/\n/g" 2.txt | sed "s/{data.*SZQ://g" | sed "s/,YTG//g" | sed "s/\}//g" | sed "s/httpstatus.*//g" | sed "s/,|/\n/g" | cut -f3,8,9,13,26,28,29 -d"|"



一句话命令:
curl --insecure --user-agent "Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101 Firefox/38.0" "https://kyfw.12306.cn/otn/leftTicket/queryZ?leftTicketDTO.train_date=2018-02-12&leftTicketDTO.from_station=SZQ&leftTicketDTO.to_station=YTG&purpose_codes=ADULT" | sed "s/\"//g" 1.txt | sed "s/,result:/\n/g" 2.txt | sed "s/{data.*SZQ://g" | sed "s/,YTG//g" | sed "s/\}//g" | sed "s/httpstatus.*//g" | sed "s/,|/\n/g" | cut -f3,8,9,13,26,28,29 -d"|"

脚本：
#!/bin/bash

while true
do
curl --insecure --user-agent "Mozilla/5.0 (X11; Linux i686; rv:38.0) Gecko/20100101 Firefox/38.0" "https://kyfw.12306.cn/otn/leftTicket/queryZ?leftTicketDTO.train_date=2018-02-12&leftTicketDTO.from_station=SZQ&leftTicketDTO.to_station=YTG&purpose_codes=ADULT" | sed "s/\"//g" | sed "s/,result:/\n/g" | sed "s/{data.*SZQ://g" | sed "s/,YTG//g" | sed "s/\}//g" | sed "s/httpstatus.*//g" | sed "s/,|/\n/g" | sed "s/\[|//g" | cut -f3,8,9,13,26,28,29 -d"|"
sleep 1
done





