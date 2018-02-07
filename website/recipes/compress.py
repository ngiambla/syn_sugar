import sys
import time

class compress():

	def __init__(self,):
		self.recipe="compress"

	def say_recipe(self):
		print(self.recipe)	

	def load_red_words(self):
		red_dict={}

		with open("bad_ingredients/bad_ingredients.pb", "r") as f:
			for line in f:
				bad_things = line.split()
				for bad_thing in bad_things:
					red_dict[bad_thing] = "%%#%%"
		return red_dict

	def bake(self, _ingredients):

		ingredient_bin = {}
		_ingredients_all = _ingredients.get_ingredients()
		_ingredient_mapping = _ingredients.get_ingredient_mapping()

		red_dict = self.load_red_words()
		for _label in _ingredients_all:
			try: 
				sys.stdout.write("\rChecking: ("+str(_label)+","+str(_ingredient_mapping[_label])+")")
				sys.stdout.flush()
			except Exception as e:
				pass
			
			_ingredients_all[_label] = _ingredients_all[_label].lower()
			if _ingredients_all[_label] in red_dict:
				_ingredients_all[_label] = red_dict[_ingredients_all[_label]]

		print("")
		print("")

		return ["%%#%%"]