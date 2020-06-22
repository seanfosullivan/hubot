import sys
import os
import urllib2
from bs4 import BeautifulSoup

suffix = sys.argv[1:]
suffix = '_'.join(suffix)
try:
	url=urllib2.urlopen('https://en.wikipedia.org/wiki/' + suffix)
	html = url.read()
	parsed_html = BeautifulSoup(html)
	x = parsed_html.p.get_text()
	print x 
except:
	print "I am unable to locate that information"
