from __future__ import division

import glob
import os
import sys
import operator 
import re
import math

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

	def display_progress_check(self, stage, count, columns):

		try:
			how_many=int(math.floor(count/1000))	
			sys.stdout.write('\rProgress['+ str(stage) +']: ' + '.'*(how_many%(columns-30))+' '*(columns-(how_many%(columns-30))-30))
			sys.stdout.flush()
		except Exception as e:
			rows, cols = os.popen('stty size', 'r').read().split()
			columns = int(cols)
			print("\n")
			how_many=int(math.floor(count/1000))	
			sys.stdout.write('\rProgress['+ str(stage) +']: ' + '.'*(how_many%(columns-30))+' '*(columns-how_many-30))
			sys.stdout.flush()			
		

	def check_quality(self, _ingredients, special_items):
		rows, columns = os.popen('stty size', 'r').read().split()
		cols 					= int(columns)
		sentence_vec_map 		= 	{}
		sentence_map 			= 	{}

		sentence_stack 			= 	[]

		sentence_bad_map 		= 	{}
		sentence_length_map 	= 	{}
		sentence_entropy_map 	= 	{}
		freq_vec_map 			= 	{}
		sentence_low_map 		= 	{}

		max_entropy 			= 	0
		min_entropy 			= 	1000000
		avg_entropy 			= 	0

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

			sfs 	= 	[]
			sfs2 	= 	[]
			low_map = 	[]
			for i in range(_label, sentence_length_map[_label]+_label):
				low_map.append(ingredient_free_map[i].lower())
				if _ingredients_all[i] != "%%#%%":
					sfs.append(ingredient_freq_map[ingredient_free_map[i]]/len(ingredient_free_map))
					sfs2.append(ingredient_freq_map[ingredient_free_map[i]]/len(ingredient_free_map))
				else:
					sfs2.append(0)

			freq_vec_map[_label]  			=  	sfs2
			sentence_low_map[_label] 		= 	low_map
			sentence_entropy_map[_label] 	= 	100*mutils.entropy(sfs)/(sentence_length_map[_label]+_label)

			avg_entropy = avg_entropy + sentence_entropy_map[_label] 

			if sentence_entropy_map[_label] > max_entropy:
				max_entropy = sentence_entropy_map[_label]				

			if sentence_entropy_map[_label] < min_entropy:
				min_entropy = sentence_entropy_map[_label]

			vec=[]
			for special_item in sentence_map[_label]:
				vec = vec + [sentence_map[_label][special_item]]
			vec=vec + [sentence_length_map[_label], sentence_entropy_map[_label]]
			sentence_vec_map[_label]=vec



		avg_entropy = avg_entropy/len(sentence_vec_map)
		avg_wrd_snt = (_number_of_ingredients/len(sentence_vec_map))
		_scalar 	= ((avg_entropy)/min_entropy)**0.3

		print(bcolors.OKGREEN+ "\n\n> Stats" + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> MAX Entropy: " + str(max_entropy) + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> MIN Entropy: " + str(min_entropy) + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> AVG Entropy: " + str(avg_entropy) + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> AVG WRD/SNT: " + str(avg_wrd_snt) + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> AVG _scalar: " + str(_scalar)     + bcolors.ENDC)
		print("\n")
		seen_labels		=	{}
		sen_pairs 		=	{}
		count=0

		for _i_label in sentence_vec_map:
			a=sentence_vec_map[_i_label]
			seen_labels[_i_label]=0
			
			if sentence_entropy_map[_i_label] > _scalar*min_entropy: 	# filter out sentences with low entropy.

				for _j_label in sentence_vec_map:
					if sentence_entropy_map[_j_label] > _scalar*min_entropy: 

						if  _j_label not in seen_labels:
							b=sentence_vec_map[_j_label]
						

							hamming_sim = len(sentence_vec_map[_i_label])-mutils.hamming_distance(a,b)
							sim_i = int(math.floor(10*(hamming_sim)/len(sentence_vec_map[_i_label])) + math.floor(10*(mutils.get_cosine_sim(a,b))))

							if sim_i not in sen_pairs: 
								sen_pairs[sim_i] = {}

							if _i_label not in sen_pairs[sim_i]:
								sen_pairs[sim_i][_i_label]=sentence_entropy_map[_i_label]

							if _j_label not in sen_pairs[sim_i]:
								sen_pairs[sim_i][_j_label]=sentence_entropy_map[_j_label]
							count=count+1
							self.display_progress_check(1, count, cols)
					

		sorted_bins 	= 	{}
		ent_lim 		= 	avg_entropy
		miss_count 		=  	0

		for _bin in sen_pairs:
			seen_again={}

			for il in sen_pairs[_bin]:
				if _bin not in sorted_bins:
					sorted_bins[_bin]={}

				a = freq_vec_map[il]
				wa = sentence_low_map[il]

				seen_again[il]=0
				if sen_pairs[_bin][il] >= ent_lim:
					for jl in sen_pairs[_bin]:
						
						count=count+1
						self.display_progress_check(2, count, cols)
						if sen_pairs[_bin][jl] >= ent_lim:
							if jl not in seen_again:

								b = freq_vec_map[jl]
								wb = sentence_low_map[jl]

								if ent_lim <= 1.2*avg_entropy:
									ent_lim = ent_lim + ent_lim*(1/(2*avg_wrd_snt))
								else:
									miss_count = 0
								sim_j  = math.floor(10*(mutils.get_cosine_sim(a,b))) * math.floor(10*(mutils.jaccard_index(wa,wb)))

								if sim_j not in sorted_bins[_bin]:
									sorted_bins[_bin][sim_j]={}

								sorted_bins[_bin][sim_j][il]=1
								sorted_bins[_bin][sim_j][jl]=1
						else:
							miss_count=miss_count+1
							if miss_count >= int(0.7*len(sen_pairs[_bin])):
								ent_lim = (ent_lim*(0.05*avg_wrd_snt))
								miss_count = 0



		print("\n")

		summary_map={}

		for _bin in sen_pairs:
			if len(sorted_bins[_bin]) > 0:
				for sim_j in sorted_bins[_bin]:
					for label in sorted_bins[_bin][sim_j]:
						if label not in summary_map:
							summary_map[label] = 1
						else:
							summary_map[label] = summary_map[label] + 1
		k_summary_map = sorted(summary_map.items(), key=operator.itemgetter(1), reverse=True)


		l_summary_map = {}

		for _label in k_summary_map:
			if len(l_summary_map) < 20:
				l_summary_map[_label[0]]=_label[1]
			else:
				break

		s_summary_map = sorted(l_summary_map.items(), key=operator.itemgetter(0))			
		
		s1=""
		s2=[]
		for _label in s_summary_map:
			label=_label[0]
			s1="[+"+str(label)+"]  "
			for i in range (label, sentence_length_map[label]+label):
				s1=s1+" "+_ingredients.get_unprepped_ingredients()[i]						
			s1=s1 + "["+str(_label[1]) +"]" +"\n"
			s2.append(s1)
		print(bcolors.OKGREEN + s1 + bcolors.ENDC)

		return s2

	def final_touches(self, _ingredients, special_items):
		print(bcolors.OKGREEN+"~ Applying final touches"+bcolors.ENDC)
		return self.check_quality(_ingredients, special_items)


