#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
import unicodedata
import time
from random import randint

verbs = ["être","avoir","pouvoir","faire","mettre","dire","devoir","prendre","donner","aller","vouloir","savoir","falloir","voir","demander","trouver","rendre","venir","passer","comprendre","rester","tenir","porter","parler","montrer","continuer","penser","suivre","connaître","croire","commencer","compter","entendre","attendre","remettre","appeler","permettre","occuper","devenir","partir","décider","arriver","servir","sembler","revenir","laisser","recevoir","répondre","vivre","rappeler","présenter","accepter","agir","poser","jouer","reconnaître","choisir","toucher","aimer","retrouver","perdre","expliquer","considérer","ouvrir","gagner","exister","refuser","lire","réussir","changer","travailler","représenter","assurer","essayer","empêcher","sortir","reprendre","mener","appartenir","risquer","concerner","apprendre","rencontrer","créer","obtenir","chercher","entrer","proposer","apporter","utiliser","atteindre","tenter","importer","ajouter","produire","préparer","relever","écrire","défendre","tirer"]
convertions = {u"ê": u"e", u"é" : u"e", u"è": u"e", u"à": u"a", u"ù": u"u", u"ù": u"u", u"ê": u"e", u"î": u"i", u"ô": u"o", u"û": u"u", u"ç": u"c", u"ä": u"a", u"ë": u"e", u"ï": u"i", u"u": u"u", u"œ": u"ae" }
waitInSecondsFrom = 3 #seconds
waitInSecondsTo = 10 #seconds

def remove_accents(input_str):
	result = u""
	global convertions
	unicode_string = input_str.decode("utf-8")
	for i in range(0, len(unicode_string)):
		c = unicode_string[i]
		corr = None
		try:
			corr = convertions[c]
		except:
			pass
		if corr is not None:
			c = corr
		result += c
	return result
	
def getVerbs():
	global waitInSecondsFrom
	global waitInSecondsTo
	for verb in verbs:
		verbWithoutAccent = remove_accents(verb)
		out = verbWithoutAccent + ".json"
		print "Getting verb " + verbWithoutAccent
		os.system("python python-scrap-verb-conjugation.py -v " + verbWithoutAccent + " -o " + out)
		waitInSeconds = randint(waitInSecondsFrom, waitInSecondsTo)
		print "Waiting " + str(waitInSeconds) + " seconds"
		time.sleep(waitInSeconds)
		pass
	pass

getVerbs()


