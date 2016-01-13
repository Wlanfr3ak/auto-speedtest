#!/bin/bash
# Script for manual Date Input and Graph & HTML export
#Show Year for Typeerrors Debug
year="2016"
#Ask for the Day to Generate the Graph and Data
read -p "Please give in YYYY-MM-DD:" date
echo "You use: "$date" for Export! In the Year "$year" !"

#Import from YOUR File ! You have to edit them manual!
cat speedtestausgabe.csv | grep $date > $date".csv"
mv $date.csv /home/pi/auto-speedtest/Graph-Builder/test.csv
cd /home/pi/auto-speedtest/Graph-Builder/
python3 graph-builder.py
mv download.png $date"-download.png"
mv upload.png $date"-upload.png"
mv ping.png $date"-ping.png"
mv test.csv $date".csv"

#Todo: File Upload on SFTP in Folder
#Todo: HTML input after SFTP Transfer (PHP Include via Text Document ?)

#Sort 4 HTML Export
html1="<tr><th><h2>Wochentag<br>"$date"</h2></th>"
html2='<th><a href="/'
html3=$year"/"$date"-download.png"
html4='"><img src="/'
html5=$year"/"$date"-download.png"
html6='" width="300" height="200" alt="DownloadGraphic"></a></th>'
html7='<th><a href="/'
html8=$year"/"$date"-upload.png"
html9='"><img src="/'
html10=$year"/"$date"-upload.png"
html11='" width="300" height="200" alt="UploadGraphic"></a></th>'
html12='<th><a href="/'
html13=$year"/"$date"-ping.png"
html14='"><img src="/'
html15=$year"/"$date-"ping.png"
html16='" width="300" height="200" alt="PingGraphic"></a></th>'
html17='<th><a href="/'
html18=$year"/"$date".csv"
html19='">CSV-Link</a></th></tr>'

#Export HTML to put in in a Website
echo $html1$html2$html3$html4$html5$html6$html7$html8$html9$html10$html11$html12$html13$html14$html15$html16$html17$html18$html19
