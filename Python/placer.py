import os
import shutil
from datetime import datetime, date, timedelta
import sys

tempDate = sys.argv[1]
path = "D:\Data Transfer\PSPCL\Consolidated Input file\Univariate"

#month = datetime.now().strftime("%B")
#year = datetime.now().strftime("%Y")

#date = date.today() + timedelta(days=1)
date = datetime.strptime(tempDate, "%m/%d/%Y") + timedelta(days=1)
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

print os.getcwd()
print newPath

files = [f for f in os.listdir(newPath) if f.lower()]
#print files

for i in files:
	copyPath = newPath + "\\" + i
	shutil.copy(copyPath, os.getcwd())
