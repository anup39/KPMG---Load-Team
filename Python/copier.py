import os
import shutil
from datetime import datetime, date, timedelta
import sys

path = "D:\Data Transfer\PSPCL\Consolidated Input file\Univariate"
tempDate = sys.argv[1]
files = [f for f in os.listdir(path) if f.lower().endswith(('.csv', '.xls', '.pdf', '.xlsx'))]
print files

#month = datetime.now().strftime("%B")
#year = datetime.now().strftime("%Y")

#date = date.today() + timedelta(days=1)
date = datetime.strptime(tempDate, "%m/%d/%Y") + timedelta(days=2)
todaysDate = date.strftime("%d.%m.%Y")

month = date.strftime("%B")
year = date.strftime("%Y")

folderNameMonth = month + " " + year
folderNameEmail = "For " + todaysDate

os.chdir(path)

if not os.path.exists(folderNameMonth):
	os.makedirs(folderNameMonth)

os.chdir(folderNameMonth)

if not os.path.exists(folderNameEmail):
    os.makedirs(folderNameEmail)

os.chdir(path)
newPath = os.getcwd() + "\\" + folderNameMonth + "\\" + folderNameEmail
print newPath

for i in files:
	#print os.path.abspath(i)
	shutil.copy(os.path.abspath(i), newPath)
