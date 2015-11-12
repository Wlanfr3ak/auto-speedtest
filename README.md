# auto-speedtest
My ISP has a FTTH Network with Coaxial Cable into the Appartments. In the middle of the Day the Download Speed was so slow that i have lower than 1 % from the Bandwith from my agreement. I think they are stingy at the Peering Points... So i have decided to make Speedtest every 5 Minutes and Log the Speed to have a Overview (and make a lots of Traffic </>evilsmiley</>).

I hope you can use it too, please copy, share, fix and send me Feedback (im really bad at Coding).

How to use:
-----------
* First Download Python and Speedtest-CLI*
* Run speedtest.sh
* Make a Crontab Entry with your Time Wish (For Lower Connections use longer Times)
* Write a FrontEnd Website with Graph and Statistics and send me your Source Code ;-)

Crontab
* crontab -e
* "*/5 *    * * *   /home/username/speedtest.sh > /dev/null" for 5 Minute
 
LOG-Syntax:
-----------
* YEAR-MONTH-DAY;HOUR:MINUTE:SECOND;PING;DOWNLOAD;UPLOAD

Speedtest-CLI
-------------
* LINK >>> https://github.com/sivel/speedtest-cli/
* Download speedtest-cli in the same directory as speedtest.sh
* wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
* chmod +x speedtest-cli # Make it executable

GraphBuilder:
------------
* This Module is under Development for the automatically export to a Website
* sudo apt-get install python3 python3-mathplotlib
* python3 GraphBuilder.py
* At this Stage its read from test.csv and export in download.png, upload.png and ping.png
* Later we plan to export with filenames with the dates etc.
