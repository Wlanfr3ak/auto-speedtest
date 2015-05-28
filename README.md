# auto-speedtest
My ISP has a FTTH Network with Coaxial Cable into the Appartments. In the middle of the Day the Download Speed was so slow that i have lower than 1 % from the Bandwith from my agreement. I think they are stingy at the Peering Points... So i have decided to make Speedtest every 5 Minutes and Log the Speed to have a Overview (and make a lots of Traffic *evilsmiley*)

I hope you can use it too, please copy, share, fix and send me Feedback im not good at Coding.

How to use:
-----------
* First Download Python and Speedtest-CLI*
* Run speedtest.sh
* Make a Crontab Entry with your Time Wish (For Lower Connections use longer Times)
* Write a FrontEnd Website with Graph and Statistics and send me your Source Code ;-)

Speedtest-CLI
-------------
* LINK >>> https://github.com/sivel/speedtest-cli/
* Download speedtest-cli in the same directory as speedtest.sh
* wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py
* chmod +x speedtest-cli # Make it executable
