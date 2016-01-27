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
import unicodedata

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

def GetDictionaryOfTense(tab, name):	
	conjugatedDictionary = {}
	conjugated = ""
	
	for child in tab:
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

	return conjugatedDictionary

def CreateConjugFile(verb):
	websiteURL = "http://la-conjugaison.nouvelobs.com/du/verbe/" + verb + ".php"
	page = requests.get(websiteURL)
	tree = html.fromstring(page.content)
	
	tabPresent = tree.xpath('//div[@class="tempstab"][1]/div[@class="tempscorps"]/node()')
	dicPresent = GetDictionaryOfTense(tabPresent, "present")

	tabImparfait = tree.xpath('//div[@class="tempstab"][3]/div[@class="tempscorps"]/node()')
	dicImparfait = GetDictionaryOfTense(tabImparfait, "imparfait")

	tabPasseSimple = tree.xpath('//div[@class="tempstab"][5]/div[@class="tempscorps"]/node()')
	dicPasseSimple = GetDictionaryOfTense(tabPasseSimple, "passeSimple")

	tabFutureSimple = tree.xpath('//div[@class="tempstab"][7]/div[@class="tempscorps"]/node()')
	dicFutureSimple = GetDictionaryOfTense(tabFutureSimple, "futureSimple")

	tabPasseCompose = tree.xpath('//div[@class="tempstab"][2]/div[@class="tempscorps"]/node()')
	dicPasseCompose = GetDictionaryOfTense(tabPasseCompose, "passeCompose")

	tabPlusqueParfait = tree.xpath('//div[@class="tempstab"][4]/div[@class="tempscorps"]/node()')
	dicPlusqueParfait = GetDictionaryOfTense(tabPlusqueParfait, "plusqueParfait")


	resultDictionary = {"present": dicPresent, "imparfait": dicImparfait, "passeSimple": dicPasseSimple, "futureSimple": dicFutureSimple, "passeCompose": dicPasseCompose, "plusqueParfait": dicPlusqueParfait}

	if len(resultDictionary) > 0:
		return resultDictionary
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
			json.dump(jsonDictionary, outfile, ensure_ascii=True)
		pass
	pass
	
##########################################################################################
			
if __name__ == "__main__":
	main(sys.argv[1:])
