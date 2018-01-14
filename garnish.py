from __future__ import division

import glob
import os
import sys
import operator 

from ingredients import ingredients
from bcolors import bcolors

class garnish:

	def clean(self):
		print(bcolors.REDBACK+"Cleaning Post-Bake Mess. Proceed? [Y|n]" + bcolors.ENDC)
		ans=raw_input("? ")
		if ans == "" or ans.lower() == "y":
			os.chdir("post_bakes/")
			if len(glob.glob("*.pb")) == 0:
				print(bcolors.OKGREEN + "Nothing to Clean."+ bcolors.ENDC)				
			else: 
				for file in glob.glob("*.pb"):
					os.remove(file)
				for file in glob.glob("*.baked"):
					os.remove(file)
				print(bcolors.OKGREEN + "All Clean."+ bcolors.ENDC)
			os.chdir("../")
		else:
			print(bcolors.OKGREEN + "Not Cleaning."+ bcolors.ENDC)

	def prep_work(self, _classes):
		_classes_out={}
		with open("recipes/recipe.conf", "r") as f:
			for line in f:
				if line[0] != '#':
					ordering=line.split()
					if len(ordering) == 3:
						for _class in _classes:
							if str(_class).split(".")[0] == ordering[0]:
								_classes_out[ordering[2]]=_class
		if len(_classes_out) != len(_classes):
			print(bcolors.FAIL+"Error: no sugar can be made. 'recipe.conf' is syntatically wrong. Please check it."+bcolors.ENDC)
			exit()
		return _classes_out

	def check_quality(self, _ingredients):
		sentence_stack 			= 	[]

		sentence_bad_map 		= 	{}
		sentence_length_map 	= 	{}


		_ingredients_all		=	_ingredients.get_ingredients()
		_ingredient_mapping 	=	_ingredients.get_ingredient_mapping()	

		for _label in _ingredients_all:

			item = _ingredients_all[_label]
			if "~$[" in item:
				sentence_stack.append(_label)
			if "]$~" in item:
				try:
					start=sentence_stack.pop()
					sentence_length_map[start] = _label+1
					bad_things_per_sentence = 	0

					for labels in range(start, _label+1):
						if "%%#%%" in _ingredients_all[labels]:
							bad_things_per_sentence = bad_things_per_sentence + 1
					sentence_bad_map[start]=bad_things_per_sentence/(_label+1-start)
				except Exception as e:
					pass

		sorted_sentence_bad_map = sorted(sentence_bad_map.items(), key=operator.itemgetter(1))
		for thing in sorted_sentence_bad_map:
			print(bcolors.OKGREEN+"Sentence: "+str(thing[0])+" Rating: "+str(thing[1])+" Length: "+str(sentence_length_map[thing[0]]-thing[0])+ bcolors.ENDC)
			sentence = ""
			for s_label in range(thing[0], sentence_length_map[thing[0]]):
				sentence = sentence + _ingredients_all[s_label] + " "
			print(bcolors.OKCYAN+"--> "+sentence+bcolors.ENDC)


	def final_touches(self, _ingredients):
		print(bcolors.OKGREEN+"~ Applying final touches"+bcolors.ENDC)
		self.check_quality(_ingredients)


		_ingredients_all		=	_ingredients.get_ingredients()
		_ingredient_mapping 	=	_ingredients.get_ingredient_mapping()	

		with open("post_bakes/result.baked", "w+") as f:
			title="~$[ Syntatic Sugar ]$~"\
				  "\nLast Post Baked: "
			f.write(title)
			line 	= 	0
			out 	= 	""
			for _label in _ingredients_all:
				if _ingredient_mapping[_label] == line:
					out=out+_ingredients_all[_label]+" "
				else:
					f.write(out+"\n")
					out=_ingredients_all[_label]+" "
					line=line+1
			f.write(out+"\n")
		print(bcolors.OKGREEN+"~ Voila."+bcolors.ENDC)