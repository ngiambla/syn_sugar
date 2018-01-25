from __future__ import division

import glob
import os
import sys
import operator 
import re

import matplotlib.pyplot as plt
import numpy as np
import math_utils as mutils 

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



	def check_quality(self, _ingredients, special_items):

		sentence_vec_map 		= 	{}
		sentence_map 			= 	{}

		sentence_stack 			= 	[]

		sentence_bad_map 		= 	{}
		sentence_length_map 	= 	{}
		sentence_entropy_map 	= 	{}

		ingredient_freq_map 	= 	{}
		ingredient_free_map 	= 	{}

		_ingredients_all		=	_ingredients.get_ingredients()
		_number_of_ingredients 	= 	len(_ingredients_all)
		_ingredient_mapping 	=	_ingredients.get_ingredient_mapping()	

		_special_item_dict 		= 	{}

		for special_item in special_items:
			_special_item_dict[special_item]=0

		for _label in _ingredients_all:

			item = _ingredients_all[_label]

			only_char_item = ''.join(e for e in _ingredients.get_unprepped_ingredients()[_label] if e.isalnum())
			ingredient_free_map[_label]=only_char_item

			if only_char_item not in ingredient_freq_map:
				ingredient_freq_map[only_char_item] = 1
			else:
				ingredient_freq_map[only_char_item] = ingredient_freq_map[only_char_item] +1

			if "~$[" in item:

				sentence_stack.append(_label)

			if "]$~" in item:
				try:
					start=sentence_stack.pop()
					sentence_length_map[start] 	= 	_label+1-start
					sentence_map[start] 			= 	_special_item_dict.copy()
					for special_item in _special_item_dict:
						_special_item_dict[special_item] = 0

				except Exception as e:
					print(str(e))
					pass

			if len(sentence_stack) > 0:
				for special_item in _special_item_dict:
					if special_item in item:
						_special_item_dict[special_item]=_special_item_dict[special_item]+1

		for _label in sentence_map:

			sfs=[]
			for i in range(_label, sentence_length_map[_label]+_label):
				sfs.append(ingredient_freq_map[ingredient_free_map[_label]])
			sentence_entropy_map[_label]=mutils.entropy(sfs)/(sentence_length_map[_label]+_label)


			vec=[]
			for special_item in sentence_map[_label]:
				vec = vec + [sentence_map[_label][special_item]]
			vec=vec + [sentence_length_map[_label], sentence_entropy_map[_label]]
			sentence_vec_map[_label]=vec

		seen_labels		=	{}
		sen_pairs 		=	{}

		for _i_label in sentence_vec_map:
			a=sentence_vec_map[_i_label]
			seen_labels[_i_label]=0

			for _j_label in sentence_vec_map:
				if  _j_label not in seen_labels:
					b=sentence_vec_map[_j_label]
					hamming_dis = mutils.hamming_distance(a, b)
					if hamming_dis not in sen_pairs: 
						sen_pairs[hamming_dis] = {}

					if _i_label not in sen_pairs[hamming_dis]:
						sen_pairs[hamming_dis][_i_label]=sentence_entropy_map[_i_label]

					if _j_label not in sen_pairs[hamming_dis]:
						sen_pairs[hamming_dis][_j_label]=sentence_entropy_map[_j_label]
					

		sorted_bins={}
		for _bin in sen_pairs:
			seen_again={}

			for il in sen_pairs[_bin]:
				if _bin not in sorted_bins:
					sorted_bins[_bin]={}
				a=[]
				for i in range(il, sentence_length_map[il]+il):
					a.append(ingredient_freq_map[ingredient_free_map[il]])
				seen_again[il]=0
				for jl in sen_pairs[_bin]:
					if jl not in seen_again:
						b=[]
						for i in range(jl, sentence_length_map[jl]+jl):
							b.append(ingredient_freq_map[ingredient_free_map[jl]])
						if sen_pairs[_bin][jl] < -1 and sen_pairs[_bin][il] < -1:
							lev_dis = mutils.levenshtein(a,b)
							if lev_dis < 20:
								if lev_dis not in sorted_bins[_bin]:
									sorted_bins[_bin][lev_dis]={}

								sorted_bins[_bin][lev_dis][il]=1
								sorted_bins[_bin][lev_dis][jl]=1

		for _bin in sen_pairs:

			print(bcolors.OKGREEN+"[Similarity] : "+str(_bin)+bcolors.ENDC)
			for lev_dis in sorted_bins[_bin]:

				print(bcolors.FAIL + " +[Distance] : "+str(lev_dis)+bcolors.ENDC)
				s1=""
				for label in sorted_bins[_bin][lev_dis]:
					s1=s1+"  +[Entropy: "+str(sen_pairs[_bin][label])+"]\n   "	
					for i in range(label, sentence_length_map[label]+label):
						s1=s1+" "+_ingredients.get_unprepped_ingredients()[i]						
					s1=s1+"\n\n"
				print(s1)


	def final_touches(self, _ingredients, special_items):
		print(bcolors.OKGREEN+"~ Applying final touches"+bcolors.ENDC)
		self.check_quality(_ingredients, special_items)


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