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

	def display_progress_check(self, count, columns):

		how_many=int(math.floor(count/1000))	
		sys.stdout.write('\rProgress: ' + '.'*(how_many%(columns-30))+' '*(columns-how_many-30))
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
		max_entropy 			= 	0
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

			sfs=[]
			for i in range(_label, sentence_length_map[_label]+_label):
				sfs.append(ingredient_freq_map[ingredient_free_map[_label]]/len(ingredient_free_map))
			sentence_entropy_map[_label]=100*mutils.entropy(sfs)/(sentence_length_map[_label]+_label)
			avg_entropy = avg_entropy + sentence_entropy_map[_label] 
			if sentence_entropy_map[_label] > max_entropy:
				max_entropy = sentence_entropy_map[_label]				

			vec=[]
			for special_item in sentence_map[_label]:
				vec = vec + [sentence_map[_label][special_item]]
			vec=vec + [sentence_length_map[_label], sentence_entropy_map[_label]]
			sentence_vec_map[_label]=vec

		avg_entropy = avg_entropy/len(sentence_vec_map)

		print(bcolors.FAIL+ "MAX Entropy: " + str(max_entropy) + bcolors.ENDC)
		print(bcolors.FAIL+ "AVG Entropy: " + str(avg_entropy) + bcolors.ENDC)

		seen_labels		=	{}
		sen_pairs 		=	{}
		count=0

		for _i_label in sentence_vec_map:
			a=sentence_vec_map[_i_label]
			seen_labels[_i_label]=0
			
			for _j_label in sentence_vec_map:
				if  _j_label not in seen_labels:
					b=sentence_vec_map[_j_label]
				
					hamming_sim = len(sentence_vec_map[_i_label])-mutils.hamming_distance(a,b)

					sim_i = math.floor(10*(hamming_sim)/len(sentence_vec_map[_i_label]))/10 + math.floor(10*(mutils.get_cosine_sim(a,b)))/10
					if sim_i not in sen_pairs: 
						sen_pairs[sim_i] = {}

					if _i_label not in sen_pairs[sim_i]:
						sen_pairs[sim_i][_i_label]=sentence_entropy_map[_i_label]

					if _j_label not in sen_pairs[sim_i]:
						sen_pairs[sim_i][_j_label]=sentence_entropy_map[_j_label]
					count=count+1
					self.display_progress_check(count, cols)
					

		sorted_bins 	= 	{}
		ent_lim 		= 	avg_entropy
		miss_count 		=  	0

		for _bin in sen_pairs:
			seen_again={}

			for il in sen_pairs[_bin]:
				if _bin not in sorted_bins:
					sorted_bins[_bin]={}

				a=[]
				wa=[]
				for i in range(il, sentence_length_map[il]+il):
					a.append(ingredient_freq_map[ingredient_free_map[i]])
					wa.append(ingredient_free_map[i].lower())

				seen_again[il]=0
				if sen_pairs[_bin][il] >= ent_lim:
					for jl in sen_pairs[_bin]:
						
						count=count+1
						self.display_progress_check(count, cols)
						if sen_pairs[_bin][jl] >= ent_lim:
							if jl not in seen_again:
								b=[]
								wb=[]
								for i in range(jl, sentence_length_map[jl]+jl):
									b.append(ingredient_freq_map[ingredient_free_map[i]])
									wb.append(ingredient_free_map[i].lower())

								ent_lim = ent_lim + ent_lim*0.05

								sim_j  = math.floor(10*(mutils.get_cosine_sim(a,b))) + math.floor(10*(mutils.jaccard_index(wa,wb)))

								if sim_j not in sorted_bins[_bin]:
									sorted_bins[_bin][sim_j]={}

								sorted_bins[_bin][sim_j][il]=1
								sorted_bins[_bin][sim_j][jl]=1
						else:
							miss_count=miss_count+1
							if miss_count == int(len(sen_pairs[_bin])/2):
								ent_lim = ent_lim*0.9
								miss_count = 0


		print("\n")
		for _bin in sen_pairs:
			if len(sorted_bins[_bin]) > 0:
				print(bcolors.OKGREEN+"[Similarity] : "+str(_bin)+bcolors.ENDC)
				for sim_j in sorted(sorted_bins[_bin].iterkeys(), reverse=True):
					print(bcolors.FAIL + " +[Distance] : "+str(sim_j)+bcolors.ENDC)
					s1=""
					for label in sorted(sorted_bins[_bin][sim_j].iterkeys(), reverse=True):
						s1=s1+"  +[Entropy: "+str(sen_pairs[_bin][label])+"]\n   "	
						for i in range(label, sentence_length_map[label]+label):
							s1=s1+" "+_ingredients.get_unprepped_ingredients()[i]						
						s1=s1+"\n\n"
					print(s1)
					
				print(bcolors.GREENBACK + "Press [c] to exit. [return] contiues. " +bcolors.ENDC)
				ans=raw_input("~ ")
				if ans == "c":
					break

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

