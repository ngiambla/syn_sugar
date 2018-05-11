from __future__ import division

import glob
import os
import sys
import operator 
import re
import math
import threading


import matplotlib.pyplot as plt
import numpy as np
import math_utils as mutils 

from ingredients import ingredients
from bcolors import bcolors
from random import randint


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
		sentence_vec_size 		= 	-1
		sentence_vec_map 		= 	{}
		sentence_map 			= 	{}

		sentence_stack 			= 	[]

		sentence_bad_map 		= 	{}
		sentence_length_map 	= 	{}
		sentence_entropy_map 	= 	{}
		
		freq_vec_map 			= 	{}
		freq_vec_map_gb 		= 	{}

		sentence_low_map 		= 	{}

		max_entropy 			= 	0
		min_entropy 			= 	1000000
		avg_entropy 			= 	0

		ingredient_freq_map 	= 	{}
		ingredient_free_map 	= 	{}
		max_ingredient_map		= 	{}

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
					sentence_map[start] 		= 	_special_item_dict.copy()

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

			sfs2 						= []
			sfs 						= []
			low_map 					= []
			max_ingredient_map[_label] 	= 0

			for i in range(_label, sentence_length_map[_label]+_label):
				low_map.append(ingredient_free_map[i].lower())
				if _ingredients_all[i] != "%%#%%":
					if len(ingredient_free_map[i]) > max_ingredient_map[_label]:
						max_ingredient_map[_label] = len(ingredient_free_map[i])
					sfs2.append(ingredient_freq_map[ingredient_free_map[i]]/len(ingredient_free_map))
					sfs.append(ingredient_freq_map[ingredient_free_map[i]]/len(ingredient_free_map))

				else:
					sfs2.append(0)

			freq_vec_map[_label]  				=  	sfs2
			freq_vec_map_gb[_label] 			= 	sfs
			sentence_low_map[_label] 			= 	low_map
			sentence_entropy_map[_label] 		= 	100*mutils.entropy(sfs)/(sentence_length_map[_label])


			vec=[]
			for special_item in sentence_map[_label]:
				vec = vec + [sentence_map[_label][special_item]]
			vec=vec + [sentence_length_map[_label], sentence_entropy_map[_label]]
			sentence_vec_map[_label]=vec
			if sentence_vec_size == -1:
				sentence_vec_size = len(vec)


		
		avg_wrd_snt = (_number_of_ingredients/len(sentence_vec_map))

		for item in sentence_length_map:

			lcompress=min(avg_wrd_snt/sentence_length_map[item], 0.65)
			rcompress=max((1-len(freq_vec_map_gb[item])/sentence_length_map[item])/100, 0.001)

			sentence_entropy_map[item]=sentence_entropy_map[item]*mutils.sig_filter((sentence_length_map[item]), lcompress, rcompress, avg_wrd_snt)

		for _label in sentence_entropy_map:

			avg_entropy = avg_entropy + sentence_entropy_map[_label] 

			if sentence_entropy_map[_label] > max_entropy:
				max_entropy = sentence_entropy_map[_label]				

			if sentence_entropy_map[_label] < min_entropy:
				min_entropy = sentence_entropy_map[_label]			
		
		avg_entropy = avg_entropy/len(sentence_vec_map)

		_scalar 	= (min_entropy/max_entropy)

		while _scalar < 0.1:
			_scalar=_scalar*2
		
		print(bcolors.OKGREEN+ "\n\n> Stats" + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> MAX Entropy: " + str(max_entropy) + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> MIN Entropy: " + str(min_entropy) + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> AVG Entropy: " + str(avg_entropy) + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> AVG WRD/SNT: " + str(avg_wrd_snt) + bcolors.ENDC)
		print(bcolors.OKGREEN+ ">> AVG _scalar: " + str(_scalar)     + bcolors.ENDC)
		print("\n")


		seen_labels		=	{}
		sen_pairs 		=	{}
		count 			= 	0

		curr_limit 		= 	_scalar
		miss_count 		= 	0



		for _i_label in sentence_vec_map:

			if sentence_entropy_map[_i_label] > _scalar:

				a = freq_vec_map[_i_label]
				wa = sentence_low_map[_i_label]
				va = sentence_vec_map[_i_label]

				seen_labels[_i_label]=0

				for _j_label in sentence_vec_map:
					if sentence_entropy_map[_j_label] > _scalar: 
						if  _j_label not in seen_labels:

							b = freq_vec_map[_j_label]
							wb = sentence_low_map[_j_label]
							vb = sentence_vec_map[_j_label]

							# hamming_sim = (mutils.hamming_distance(va,vb))/sentence_vec_size
							# struc_sim 	= 1-mutils.get_cosine_sim(va,vb)
							# sem_sim 	= 1-mutils.get_cosine_sim(a,b)
							wrd_sim 	= mutils.jaccard_index(wa,wb)
							sim_i 		= 100*wrd_sim


							if _i_label not in sen_pairs:
								sen_pairs[_i_label] = sim_i
							else:
								sen_pairs[_i_label] = sen_pairs[_i_label] + sim_i

							count=count+1
							self.display_progress_check(1, count, cols)

		print("\n")
		fields = {}
		for il in sentence_entropy_map:
			fields[il] = 0;
			for jl in sentence_entropy_map:
				if il in sen_pairs:
					if jl in sen_pairs:
						if il != jl:
							dist = jl-il
							ent_i = sentence_entropy_map[il]
							ent_j = sentence_entropy_map[jl]
							field = (sen_pairs[il]*sen_pairs[jl]*ent_i*ent_j)/((dist)**2)
							fields[il] = fields[il] + field


		k_summary_map = sorted(fields.items(), key=operator.itemgetter(1), reverse=True)
		l_summary_map = {}

		for _label in k_summary_map:
			if len(l_summary_map) < (10):
				l_summary_map[_label[0]]=_label[1]
			else:
				break

		s_summary_map = sorted(l_summary_map.items(), key=operator.itemgetter(0))			
		
		s1=""
		s2=""
		for _label in s_summary_map:
			label=_label[0]
			s1=s1 + "[+"+str(label)+"]  "
			for i in range (label, sentence_length_map[label]+label):
				s1=s1+" "+_ingredients.get_unprepped_ingredients()[i]
				s2=s2+" "+_ingredients.get_unprepped_ingredients()[i]						
			s1=s1 + "["+str(_label[1]) +"]" +"\n"
			s2=s2 +"\n"
		print(bcolors.OKGREEN + s1 + bcolors.ENDC)

		return [s1, s2]

	def final_touches(self, _ingredients, special_items, file_t=""):
		print(bcolors.OKGREEN+"~ Applying final touches"+bcolors.ENDC)
		summaries = self.check_quality(_ingredients, special_items)
		summary = summaries[0]

		_ingredients_all		=	_ingredients.get_ingredients()
		_ingredient_mapping 	=	_ingredients.get_ingredient_mapping()	

		if file_t != "":
			with open(file_t, "w+") as f2:
				f2.write(summaries[1])


		with open("post_bakes/result.baked", "w+") as f:
			title="~$[ Syntactic Sugar ]$~"\
				  "\n** Results **: \n\n"

			f.write(title)
			f.write(summary)
			f.write("\n Baked Goods: \n\n")
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
		return summaries[1]



