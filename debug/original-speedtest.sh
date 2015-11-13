#/bin/bash
# Fabian Horst 2014
# ./speedtest-cli muss in diesem Ordner verfügbar sein und ausführbar
# Download: speedtest-cli
# wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
# chmod +x speedtest-cli
# angelehnt an: http://www.lteforum.at/f5-offtopic-geplauder/t1010-linux-automatischer-speedtest-net/

# Speedtest machen und Ausgabe
vf=$(./speedtest-cli --simple --server 4617)

# IP rausfinden für den Filenamen
ip=$(wget http://checkip.dyndns.org/ -q -O - | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>')
echo $ip

# DEBUG ON
#echo "##########"
#echo "#DEBUG ON#"
#echo "##########"
#echo $vf
#echo "###########"
#echo "#DEBUG OFF#"
#echo "###########"

# Debug Ausgabe des Speedtests
#echo "$vf" >> debug-vf.log
# DEBUG OFF

DATE=$(date +"%Y-%m-%d ")
TIME=$(date +"%H:%M:%S ")

#echo "##########"
#echo "#DEBUG ON#"
#echo "##########"
#echo "          "
#echo "###DATE###"
#echo $DATE
#echo "          "
#echo "###TIME###"
#echo $TIME
#echo "          "
#echo "###########"
#echo "#DEBUG OFF#"
#echo "###########"

# Test Formatierung
IN=$(echo $vf)
SPEED=$(echo $IN | tr "[:alpha:]+[/:]" "\n")
OUT=$DATE$TIME$SPEED
vf2=$(echo $OUT | tr ' ' ';')

echo "$vf2" >> speedtest-zebe-$ip.csv

#echo "##########"
#echo "#DEBUG ON#"
#echo "##########"
#echo "          "
#echo "###IN###"
#echo $IN
#echo "          "
#echo "###SPEED##"
#echo $SPEED
#echo "          "
#echo "###OUT####"
#echo $OUT
#echo "          "
#echo "###vf2####"
#echo $vf2
#echo "          "
#echo "###########"
#echo "#DEBUG OFF#"
#echo "###########"
