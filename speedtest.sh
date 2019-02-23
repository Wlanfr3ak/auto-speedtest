#/bin/bash
#When you have Installed the speedtest-cli via apt use this code
#vf=$(speedtest --simple --server 4617)
#When you have use the binary like the Readme Discribe use this line of Code
work_dir="`pwd`"
script_dir="`dirname $0`"; cd "${script_dir}"; script_dir="`pwd`"
cd "${work_dir}"

# When no connection, this is practically equivalent to an infinite ping 
# and nul speeds
no_connection="999.0;0.0;0.0"

vf=$(speedtest-cli --simple --server 21506)
#ip=$(wget http://checkip.dyndns.org/ -q -O - | grep -Eo '\<[[:digit:]]{1,3}(\.[[:digit:]]{1,3}){3}\>')
echo $ip
DATE=$(date +"%Y-%m-%d")
TIME=$(date +"%H:%M:%S")
IN=$(echo $vf)
SPEED=$(echo $IN | tr "[:alpha:]+[/:]" "\n")
OUT="${DATE} ${TIME} ${SPEED}"
vf2=$(echo ${OUT} | tr ' ' ';')
ping=$(echo "${vf2}" | cut -d';' -f3)

# If this field is empty, assume no connection:
if [ "${ping}" = "" ]; then
	vf2="${vf2};${no_connection}"
fi
echo "${vf2}" >> "${script_dir}/speedtest-${DATE}.csv"
#DisplayOutpum
#mython3 display.py $OUT
