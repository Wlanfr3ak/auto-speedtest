#/bin/bash
vf=$(./speedtest-cli --simple --server 4617)
ip=$(wget http://checkip.dyndns.org/ -q -O - | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>')
echo $ip
DATE=$(date +"%Y-%m-%d ")
TIME=$(date +"%H:%M:%S ")
IN=$(echo $vf)
SPEED=$(echo $IN | tr "[:alpha:]+[/:]" "\n")
OUT=$DATE$TIME$SPEED
vf2=$(echo $OUT | tr ' ' ';')
echo "$vf2" >> speedtestausgabe-$ip.csv
