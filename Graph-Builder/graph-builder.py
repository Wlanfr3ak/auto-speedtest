#!/usr/bin/env python3

# Written by @muellermartin
# License: Do What the Fuck You Want to Public License (WTFPL)

import matplotlib
# Use a non-interactive backend
# Note: Needs to be called before importing pyplot!
matplotlib.use("AGG")
import matplotlib.pylab as plt

import csv
import os
import sys
import datetime

csvFile = "test.csv"

if not os.path.exists(csvFile):
	# Write error message to stderr instead of stdout
	print("File \"{}\" does not exist.".format(csvFile), file=sys.stderr)
	# Return with non-zero exit status (error)
	sys.exit(1)

if not os.path.isfile(csvFile):
	# Write error message to stderr instead of stdout
	print("File \"{}\" is no regular file.".format(csvFile), file=sys.stderr)
	# Return with non-zero exit status (error)
	sys.exit(1)

# Will be used to hold data from CSV prepared for plotting
timestamps = []
ping = []
download = []
upload = []

# Process CSV file containing the data and prepare it for plotting
with open(csvFile, "r") as f:
	for line in f:
		# Remove newline character at end of string
		line = line.rstrip()
		# Split columns at ";" characters
		columns = line.split(";")

		# Create datetime object from 1st & 2nd column and add it to the list
		timestamps.append(datetime.datetime.strptime(columns[0] + columns[1], "%Y-%m-%d%H:%M:%S"))
		# Add 3rd column to ping list
		ping.append(columns[2])
		# Add 4th column to download list
		download.append(columns[3])
		# Add 5th column to upload list
		upload.append(columns[4])

#plt.style.use("fivethirtyeight")

fig, ax = plt.subplots()
ax.plot_date(timestamps, ping, fmt="r-", xdate=True, ydate=False)
fig.autofmt_xdate()
plt.savefig("ping.png")

fig, ax = plt.subplots()
ax.plot_date(timestamps, download, fmt="g-", xdate=True, ydate=False)
fig.autofmt_xdate()
plt.savefig("download.png")

fig, ax = plt.subplots()
ax.plot_date(timestamps, upload, fmt="b-", xdate=True, ydate=False)
fig.autofmt_xdate()
plt.savefig("upload.png")
