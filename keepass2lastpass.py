'''
Author: Andy D
Email: mindovermiles262@gmail.com
Date: 2019-02-23

Using KeepassXC's Export to CSV Feature, this
  script will massage the data into an importable
  csv that Lastpass will read.

Change 'open(inputfile.csv)' to the name of your
  exported-from-KeepassXC csv

Run 'python keepass2lastpass.py' then
  copy and paste the 'output.txt' file
  into the import option inside your
  keepass vault.

Any errors while processing (ex: a comma
  in your password) will be exported into
  the file 'errors.txt' and you will have
  to import these passwords manually.
'''

outfile = open("output.txt", "w")
outfile.write("url,type,username,password,hostname,extra,name,grouping\n")
errorlog = open("errors.txt", "w")

with open('singleoutput.csv') as f:
    for line in f:
        outlist = []
        inlist = line.split(",")

        # Comma in password casuing error splitting by ,
        if len(inlist) != 6:
            errorlog.write(line)
            print("[!] Error Importing %s" % line)
            pass
        else:
            # Lastpass requires URL for "Password", otherwise imported
            # as a note
            if len(inlist[4]) == 2:
                inlist[4] = '\"https://web.com\"'

            # If there is no username, copy name as username
            if len(inlist[2]) == 2:
                inlist[2] = inlist[1]

            # Format output for Keepass CSV import
            outlist.append(inlist[4])               # url
            outlist.append('""')                    # type
            outlist.append(inlist[2])               # username
            outlist.append(inlist[3])               # password
            outlist.append('""')                    # hostname
            outlist.append(inlist[5].rstrip())      # extra/notes
            outlist.append(inlist[1])               # Name in Lastpass
            outlist.append(inlist[0] + "\n")        # grouping

            outline = ",".join(outlist)
            outfile.write(outline)

f.close()
outfile.close()
errorlog.close()

