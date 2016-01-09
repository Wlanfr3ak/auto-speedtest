auto-speedtest
==============
My ISP has a FTTH network with coaxial cable running into appartments. In the middle of the day the download speed is so slow that I usually have about only 1% of the bandwith advertised in my agreement. I think they are stingy with adding more peering points... So I have decided to make speed tests every 5 minutes and log the results to have an overview (and make a lots of traffic `<evilsmiley />`).

[The Results you can see here](http://traffic.fabian-horst.com)

I hope you find it useful, too. Please copy, share, fix and send me feedback (I'm really bad at coding).

How to use
----------
1. First download Python and [speedtest-cli](#speedtest-cli)
2. Run `speedtest.sh`
3. Make a crontab entry with your desired time interval (for slower connections use greater time intervals)
4. Write a frontend website with graphs and statistics and send me your source code ;-)

Crontab
-------
1. Edit your contab with: `crontab -e`
2. Insert a new line line like `*/5 *    * * *   /home/username/speedtest.sh > /dev/null` to run every 5 minutes

Log-Syntax
----------
The generated log file contains a new line for each measurement in the following format:

	YEAR-MONTH-DAY;HOUR:MINUTE:SECOND;PING;DOWNLOAD;UPLOAD

The values for `PING`, `DOWNLOAD` and `UPLOAD` are all floating point numbers.

Speedtest-CLI<a name="speedtest-cli"></a>
-------------
[speedtest-cli](https://github.com/sivel/speedtest-cli/) is a:
> Command line interface for testing internet bandwidth using speedtest.net

1. Download `speedtest-cli` in the same directory as `speedtest.sh`:
   `wget -O speedtest-cli https://raw.github.com/sivel/speedtest-cli/master/speedtest_cli.py`
2. Make it executable: `chmod +x speedtest-cli`

Graph-Builder
-------------
This module is experimental.
It generates graphs from the log file which can be used on websites etc.

1. Install dependencies (Ubuntu): `sudo apt-get install python3 python3-matplotlib`
2. Run it: `python3 graph-builder.py`

This reads from `test.csv` and exports three images called `download.png`, `upload.png` and `ping.png` into the current directory.

Things that have to be fixed
----------------------------
* Some rows in the `*.csv` log file only contain the date and the time and must be "corrected" (e.g. by removing them) otherwise the graph script will fail on these lines.

Ideas for the Future
--------------------
* Export/Backup the data
* Export the graph images for specific date ranges (day, month, year, custom range)
* Write HTML code to show the graphs with selection of day, month, year etc.
* Traffic extension which calculates the traffic passed through the router and the part of the speed test traffic for a better overview
