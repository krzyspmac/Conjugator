#!/usr/bin/python
# -*- coding: utf-8 -*-

# install pip: curl https://bootstrap.pypa.io/ez_setup.py -o - | sudo python
# install xcode command line tools: xcode-select --install
# install pip: sudo easy_install pip
# pip install lxml
# pip install requests

from lxml import html
from lxml import etree
import requests
import json
import sys, getopt

##########################################################################################

# Persons
Persons = ["je ", "tu ", "il ", "nous ", "vous ", "ils ", "j'"]

# Get a person and conjugation from string
def GetStringIndex(str1, str2):
	result = -1
	try:
		result = str1.index(str2)
	except:
		pass
	return result
	
def GetPersonAndConjugatedVerb(conjugatedPhrase):
	resultPerson = None
	resultConjugated = None
	
	global Persons
	for person in Persons:
		personIndex = GetStringIndex(conjugatedPhrase, person)
		if personIndex == 0:
			resultPerson = person.strip()
			farIndex = personIndex + len(person)
			resultConjugated = conjugatedPhrase[farIndex:].strip()
			pass
		pass
	
	if resultPerson == "j'":
		resultPerson = "je"
		pass
	
	return [resultPerson, resultConjugated]
	pass

def CreateConjugFile(verb):
	websiteURL = "http://la-conjugaison.nouvelobs.com/du/verbe/" + verb + ".php"
	page = requests.get(websiteURL)
	tree = html.fromstring(page.content)
	tabPresent = tree.xpath('//div[@class="tempstab"][1]/div[@class="tempscorps"]/node()')
	
	conjugatedDictionary = {}
	
	conjugated = ""
	
	for child in tabPresent:

		if isinstance(child, etree._Element):
			if child.tag == "b":
				conjugated += child.text
				pass
			if child.tag == "br":
				array = GetPersonAndConjugatedVerb(conjugated);
				if array[0] is not None and array[1] is not None:
					conjugatedDictionary[array[0]] = array[1]
					pass
				conjugated = ""
				pass
			pass
		elif isinstance(child, etree._ElementStringResult):
			conjugated += child
			pass
			
		pass
	pass

	if len(conjugatedDictionary) > 0:
		return conjugatedDictionary
	else:
		return None
	pass

##########################################################################################

def usage():
	print 'python-scrap-verb-conjugation.py -v <verb> -o <outputfile>'
	sys.exit(2)
	pass

def main(argv):
	verb = ''
	outputfile = ''
	try:
		opts, args = getopt.getopt(argv,"v:o:",["verb=","output="])
	except:
		usage()
		pass
	for opt, arg in opts:
		if opt in ("-v", "--verb"):
			verb = arg
		elif opt in ("-o", "--output"):
			outputfile = arg
		pass
	if len(verb) < 1 or len(outputfile) < 1:
		usage()
		pass
		
	jsonDictionary = CreateConjugFile(verb)
	if jsonDictionary is not None:
		with open(outputfile, 'w') as outfile:
			json.dump(jsonDictionary, outfile)
		pass
	pass
	
##########################################################################################
			
if __name__ == "__main__":
	main(sys.argv[1:])
