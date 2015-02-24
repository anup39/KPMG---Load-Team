import email, getpass, imaplib, os, sys
from datetime import datetime, date, timedelta
tempDate = sys.argv[1]
detach_dir = 'D:\Data Transfer\PSPCL\Consolidated Input file\Univariate\Email'
user = "pspclreports" #sys.argv[1]
pwd = "pcpatiala" #sys.argv[2] 
m = imaplib.IMAP4_SSL("imap.gmail.com")
m.login(user,pwd)
m.select("[Gmail]/All Mail", readonly=True)

os.chdir(detach_dir)

#month = datetime.now().strftime("%B")
#year = datetime.now().strftime("%Y")

date = datetime.strptime(tempDate, "%m/%d/%Y") + timedelta(days=2)
todaysDate = date.strftime("%d.%m.%Y")

month = date.strftime("%B")
year = date.strftime("%Y")

folderNameMonth = month + " " + year
folderNameEmail = "For " + todaysDate

if not os.path.exists(folderNameMonth):
    os.makedirs(folderNameMonth)

os.chdir(folderNameMonth)

if not os.path.exists(folderNameEmail):
    os.makedirs(folderNameEmail)

os.chdir(folderNameEmail)
print os.getcwd()

d = datetime.strptime(tempDate, "%m/%d/%Y") + timedelta(days=2)
downDate = datetime.strptime(tempDate, "%m/%d/%Y") + timedelta(days=1)
e = d.strftime("%d-%m-%y")
downDateOne = downDate.strftime("%d-%b-%Y")
isDate = d.strftime("%d-%b-%Y")
checkDate = downDate.strftime("%d %b %Y")
f = datetime.strptime(e, "%d-%m-%y")
g = f.strftime("%d-%b-%y")
#print g
x = '(SINCE "'+ downDateOne +'")'
#print x
resp, items = m.search(None, x) 
items = items[0].split()
print "Searching mails for date: " + x
print items, resp
print "Emails found"
print "Please wait while attachments are downloaded..."

for emailid in items:
    resp, data = m.fetch(emailid, "(RFC822)")
    #print resp, data
    email_body = data[0][1]
    #print email_body
    mail = email.message_from_string(email_body)
    #print mail

    if mail.get_content_maintype() != 'multipart':
        continue

    #print "["+mail["From"]+"] :" + mail["Subject"]
    compDate = mail["Date"].split(" ")[1] + " " +  mail["Date"].split(" ")[2] + " " + mail["Date"].split(" ")[3]
    print compDate
    print checkDate
    print mail["From"]
    if compDate == checkDate:
        if mail["From"] == "Powercontroller Patiala <pcpseb@gmail.com>":
            for part in mail.walk():
                if part.get_content_maintype() == 'multipart':
                    continue

                if part.get('Content-Disposition') is None:
                    continue

                filename = part.get_filename()
                print filename
                counter = 1

                if not filename:
                    filename = 'part-%03d%s' % (counter, 'bin')
                    counter += 1

                #print att_path
                if not os.path.isfile(filename):
                    fp = open(filename, 'wb')
                    fp.write(part.get_payload(decode=True))
                    fp.close()
    else:
        sys.exit()
