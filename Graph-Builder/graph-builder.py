#!/usr/bin/env python3

# Written by @muellermartin
# License: Do What the Fuck You Want to Public License (WTFPL)

import matplotlib
# Use a non-interactive backend
# Note: Needs to be called before importing pyplot!
matplotlib.use("AGG")
import matplotlib.pylab as plt
import numpy as np

import csv
import os
import sys
import datetime

if len(sys.argv) > 1:
    csvFile = sys.argv[1]
else:
    csvFile = 'test.csv'

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

# Removes all incomplete lines
os.system('ex \'+v/\d\{4}-\d\{2}-\d\{2};\d\{2}:\d\{2}:\d\{2};\d\+\.\d*;\d\+\.\d*;\d\+\.\d*/d\' -cwq ' + csvFile)

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
		ping.append(float (columns[2]))
		# Add 4th column to download list
		download.append(float (columns[3]))
		# Add 5th column to upload list
		upload.append(float (columns[4]))

#plt.style.use("fivethirtyeight")

def plot (x_list, y_list, color, out_file, x_label, y_label, title, sft=None, slt=None, sftcond=False, sltcond=False):
    fig, ax = plt.subplots()
    ax.plot_date(x_list, y_list, fmt=color, xdate=True, ydate=False)
    yticks = list (np.linspace (0.0, max(y_list)*1.05, 10))
    ax.set_yticks (yticks)
    yticks = ["{:5.2f}".format (x) for x in yticks]
    if sftcond and sft != None:
        yticks [0] = sft
    if sltcond and slt != None:
        yticks [-1] = slt
    ax.set_yticklabels (yticks)
    ax.set_title(title)
    ax.set_xlabel (x_label)
    ax.set_ylabel (y_label)
    fig.autofmt_xdate()
    plt.savefig(out_file, transparent=True)

prefix = os.path.splitext(csvFile)[0] + "-"
today = '(' + str (timestamps[0])[:10] + ')'
plot (timestamps, ping, "r-", prefix + "ping.pdf", "Date/Heure", "Ping (ms)", "Durée de ping " + today, slt="infini", sltcond=max(ping) >= 999.0)
plot (timestamps, download, "g-", prefix + "download.pdf", "Date/Heure", "Down (Mbit/s)", "Vitesse de Téléchargement " + today)
plot (timestamps, upload, "b-", prefix + "upload.pdf", "Date/Heure", "UP (Mbit/s)", "Vitesse de Téléversement " + today)

