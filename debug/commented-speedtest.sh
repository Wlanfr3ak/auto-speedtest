#/bin/bash 
vf=$(./speedtest-cli --simple --server 4617)
# Makes the Speedtest with the "4617" ADDIX Internet Services GMBH Server in Kiel <3 and write in a Variable

ip=$(wget http://checkip.dyndns.org/ -q -O - | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>')
# Read the External IP-Adress and grep the Address only and write in a Variable

echo $ip
# Print the IP-Address / Debug

DATE=$(date +"%Y-%m-%d ")
TIME=$(date +"%H:%M:%S ")
# Format the Date and the Time in Variable

IN=$(echo $vf)
# Print Variable in a new Variable

SPEED=$(echo $IN | tr "[:alpha:]+[/:]" "\n")
# Print and Format Variable in a new Variable

OUT=$DATE$TIME$SPEED
# Print Date, Time, and Speed in a new Variable

vf2=$(echo $OUT | tr ' ' ';')
# Formating and Edit and then print in new Variable

echo "$vf2" >> speedtestausgabe-$ip.csv
# Print Variable and write as a new Line in the File with the IP Adress as Variable
