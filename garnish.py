from __future__ import division

import glob
import os
import sys
import operator 
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

	def check_quality(self, _ingredients):

		sentence_vec_map 		= 	{}

		sentence_stack 			= 	[]

		sentence_bad_map 		= 	{}
		sentence_length_map 	= 	{}
		sentence_and_map		= 	{}
		sentence_but_map 		=	{}
		sentence_or_map 		= 	{}

		sentence_and_loc 		= 	{}
		sentence_but_loc 		= 	{}
		sentence_or_loc 		= 	{}

		sentence_xcm_map 		= 	{}
		sentence_per_map 		= 	{}
		sentence_qsn_map 		= 	{}
		sentence_lst_map 		= 	{}
		sentence_cln_map 		= 	{}
		sentence_scn_map 		= 	{}
		sentence_dqt_map 		= 	{}
		sentence_sqt_map 		= 	{}
		sentence_dsh_map 		= 	{}

		sentence_compare_map 	= 	{}

		ingredient_freq_map 	= 	{}
		ingredient_free_map 	= 	{}

		_ingredients_all		=	_ingredients.get_ingredients()
		_ingredient_mapping 	=	_ingredients.get_ingredient_mapping()	

		for _label in _ingredients_all:

			item = _ingredients_all[_label]

			only_char_item = ''.join(e for e in item if e.isalnum())
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
					sentence_length_map[start] 	= 	_label+1
					bad_things_per_sentence 	= 	0
					
					sentence_and_map[start]		= 	0
					sentence_or_map[start] 		= 	0
					sentence_but_map[start] 	= 	0
					sentence_and_loc[start]		= 	[]
					sentence_but_loc[start] 	= 	[]
					sentence_or_loc[start]	 	= 	[]

					sentence_xcm_map[start]		= 	0
					sentence_per_map[start] 	= 	0
					sentence_qsn_map[start] 	= 	0
					sentence_lst_map[start] 	= 	0
					sentence_cln_map[start] 	= 	0
					sentence_scn_map[start] 	= 	0
					sentence_dqt_map[start] 	= 	0
					sentence_sqt_map[start] 	= 	0
					sentence_dsh_map[start] 	= 	0

					sentence_compare_map[start] = 	0


					for labels in range(start, _label+1):
						if "%%#%%" in _ingredients_all[labels]:
							bad_things_per_sentence = bad_things_per_sentence + 1
						if "]^[" in _ingredients_all[labels]:
							sentence_and_loc[start].append(labels)
							sentence_and_map[start] = sentence_and_map[start] +1
						if "]b[" in _ingredients_all[labels]:
							sentence_but_loc[start].append(labels)
							sentence_but_map[start] = sentence_but_map[start] +1
						if "]v[" in _ingredients_all[labels]:
							sentence_or_loc[start].append(labels)
							sentence_or_map[start] = sentence_or_map[start] +1
						if "%%cmp%%" in _ingredients_all[labels]:
							sentence_compare_map[start] = sentence_compare_map[start] +1
						if "%%xcm%%" in _ingredients_all[labels]:
							sentence_xcm_map[start] = sentence_xcm_map[start] +1
						if "%%per%%" in _ingredients_all[labels]:
							sentence_per_map[start] = sentence_per_map[start] +1
						if "%%qsn%%" in _ingredients_all[labels]:
							sentence_qsn_map[start] = sentence_qsn_map[start] +1
						if "%%lst%%" in _ingredients_all[labels]:
							sentence_lst_map[start] = sentence_lst_map[start] +1
						if "%%cln%%" in _ingredients_all[labels]:
							sentence_cln_map[start] = sentence_cln_map[start] +1
						if "%%scn%%" in _ingredients_all[labels]:
							sentence_scn_map[start] = sentence_scn_map[start] +1
						if "%%dqt%%" in _ingredients_all[labels]:
							sentence_dqt_map[start] = sentence_dqt_map[start] +1
						if "%%sqt%%" in _ingredients_all[labels]:
							sentence_sqt_map[start] = sentence_sqt_map[start] +1
						if "%%dsh%%" in _ingredients_all[labels]:
							sentence_dsh_map[start] = sentence_dsh_map[start] +1

					#sentence_bad_map[start]=bad_things_per_sentence/(_label+1-start)
					sentence_bad_map[start]=bad_things_per_sentence

				except Exception as e:
					print(str(e))
					pass

		
		for s_label in sentence_bad_map:
			sentence_vec_map[s_label]=[sentence_bad_map[s_label], sentence_length_map[s_label]-s_label, _ingredient_mapping[s_label], sentence_and_map[s_label], sentence_but_map[s_label], sentence_or_map[s_label], sentence_compare_map[s_label]]
			sentence_vec_map[s_label]=sentence_vec_map[s_label] + [sentence_xcm_map[s_label], sentence_per_map[s_label], sentence_qsn_map[s_label], sentence_lst_map[s_label], sentence_cln_map[s_label], sentence_scn_map[s_label]]
			sentence_vec_map[s_label]=sentence_vec_map[s_label] + [sentence_dqt_map[s_label], sentence_sqt_map[s_label], sentence_dsh_map[s_label]]
			# print(bcolors.OKGREEN+"[+]"+str(sentence_vec_map[s_label])+bcolors.ENDC)
			# sentence = ""
			# for s_label in range(s_label, sentence_length_map[s_label]):
			# 	sentence = sentence + _ingredients_all[s_label]+ bcolors.FAIL+":" +str(ingredient_freq_map[ingredient_free_map[s_label]]) +bcolors.OKCYAN+ " "
			# print(bcolors.OKGREEN+" |-> "+bcolors.OKCYAN+sentence+bcolors.ENDC+"\n")

		i_to_j_map 		= 	{}
		i_label_map		=	{}
		ham_sim			=	[]
		i 				= 	0

		for i_label in sentence_vec_map:
			i_label_map[i] = i_label
			i_item = sentence_vec_map[i_label]
			ham_sim.append([])

			j 			=	0
			j_label_map = 	{}
			
			for j_label in sentence_vec_map:
				j_label_map[j]=j_label
				if i_label != j_label: 
					j_item = sentence_vec_map[j_label]
					val=mutils.hamming_distance(i_item,j_item)
					ham_sim[i].append(val)
				else:
					ham_sim[i].append(1000)
				j=j+1
			i_to_j_map[i_label]=j_label_map
			i=i+1


		for i in i_label_map:
			min_index, min_value 	=  	min(enumerate(ham_sim[i]), key=operator.itemgetter(1))
			print("Similarity: "+str(min_value))
			s_label 			=	i_label_map[i]
			sentence=""
			for s_label in range(s_label, sentence_length_map[s_label]):
				if _ingredients_all[s_label] != "%%#%%":
					sentence = sentence + _ingredients_all[s_label]+ bcolors.FAIL+":" +str(ingredient_freq_map[ingredient_free_map[s_label]]) +bcolors.OKCYAN+ " "
			print(bcolors.OKGREEN+" |-> "+bcolors.OKCYAN+sentence+bcolors.ENDC)	
				
			s_label 	 		= 	j_label_map[min_index]
			sentence=""
			for s_label in range(s_label, sentence_length_map[s_label]):
				if _ingredients_all[s_label] != "%%#%%":
					sentence = sentence + _ingredients_all[s_label]+ bcolors.FAIL+":" +str(ingredient_freq_map[ingredient_free_map[s_label]]) +bcolors.OKCYAN+ " "
			print(bcolors.OKGREEN+" |-> "+bcolors.OKCYAN+sentence+bcolors.ENDC+"\n\n")

		# plt.imshow(ham_sim, cmap='cool', interpolation='nearest')
		# plt.show()

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