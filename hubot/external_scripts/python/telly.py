import sys
import os
import urllib2
from HTMLParser import HTMLParser
from bs4 import BeautifulSoup

url=urllib2.urlopen('http://www.imdb.com/chart/toptv/')
html = url.read()

parsed_html = BeautifulSoup(html)

orig_stdout = sys.stdout
f = file('/home/hedge/mybot/hubot/database/telly.txt', 'w')
sys.stdout = f
print parsed_html.body.div.tbody.find_all('a')
sys.stdout = orig_stdout
f.close()

#orig_stdout = sys.stdout
#f = file('ratings.txt', 'w')
#sys.stdout = f
#print parsed_html.body.div.tbody.find_all('strong')
#sys.stdout = orig_stdout
#f.close()

titles=[]
#results=[]

with open("/home/hedge/mybot/hubot/database/telly.txt") as f:
	content = [x.strip('\n') for x in f.readlines()]
	for x in content:
		names = x.split('">')[1].split('</a>')[0]
		titles.append(names)
titles.pop(0)

#with open("/home/hedge/mybot/hubot/external_scripts/python/ratings.txt") as f:
#	content = [x.strip('\n') for x in f.readlines()]
#	print content
#	for x in content:
#		answer = x.split('>')[1].split('<')[0]
#		print answer
#		results.append(answer)
#print results

from random import randint
num = randint(0,249)
text = "Watch this TV Show -> " + titles[num] #+ "\n" + "IMDb Rating: " + results[num]
print text

