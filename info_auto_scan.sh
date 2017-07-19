#!/bin/bash
echo "plz rename your txtfile of urllist to test_url.txt,push any Keys to continue!"
read nothing

function URL_to_IP(){
cat test_url.txt | while read LINE
do
echo $LINE
ping $LINE -c 1 | grep "bytes from" | cut -d " " -f 4 | cut -d ":" -f 1 >> URL2IP.txt
done
}
function IP_NMAP_REPORT(){

     while read TARGETIP
     do
     echo scaning $TARGETIP ...
     #nmap查
     nmap -T4 -sV -A -O $TARGETIP >> $TARGETIP.txt
     wait
     done < URL2IP.txt

}

URL_to_IP && wait && IP_NMAP_REPORT



test
