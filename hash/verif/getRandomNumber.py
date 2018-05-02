import urllib
import urllib.request
site = "https://www.random.org/cgi-bin/randbyte?nbytes=64&format=h"
with urllib.request.urlopen(site) as url:
    s = url.read()

# parse s now
str = s.decode("utf-8")
str = str.rstrip("\n\r")
str = str.replace(' ','')
str = str.replace('\n','')
#send to text file 
text_file = open("sample_input.vh", "w")
text_file.write("`define input 512'h" + str + '\n')
text_file.close()
print(str)
