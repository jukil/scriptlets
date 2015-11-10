#!/usr/bin/env python
import time
import os
import re
import csv
import transposer
import pandas as pd

# Move _timelimit in string
def rename():
	for filename in os.listdir("."):
		if filename.startswith("timelimit_"):
			filenamearray = filename.split("_")
			newname = filenamearray[1] + "_" + filenamearray[2] + "_" + filenamearray[3] + "_" + filenamearray[0] + "_" + filenamearray[4]
			os.rename(filename, newname)

def natural_key(string_):
	"""See http://www.codinghorror.com/blog/archives/001018.html"""
	return [int(s) if s.isdigit() else s for s in re.split(r'(\d+)', string_)]

def sort():
	files = os.listdir(".")
	return sorted(files, key=natural_key)

def transpose():
	files = sort()
	for file in files:
		if file.endswith('.csv'):
			print file
			transposer.transpose(i=file, o=file)

def concatenate():
    files = sort() # input is an array of filenames
    df_list =[]
    #merged = pd.DataFrame()
    for file in files:
        print "concatinating" + file
        if file.endswith('FulltimeSimpleOpt.csv'): # only consider those filenames
            filenamearray = file.split("_")
            f = pd.read_csv(file, index_col=0)
            f.loc[:,'Vehicle'] = filenamearray[0].replace("veh", "")
            f.loc[:,'Year'] = filenamearray[1].replace("year", "")
            if "timelimit" in file:
                f.loc[:,'Timelimit'] = "1"
            else:
                f.loc[:,'Timelimit'] = "0"
            df_list.append(f)
    merged = pd.concat(df_list, axis=0)
    merged.to_csv('merged.csv')

if __name__ == "__main__":
	start_time = time.time()
	rename()
	sort()
	transpose()
	concatenate()
	print("--- %s seconds ---" % (time.time() - start_time))
