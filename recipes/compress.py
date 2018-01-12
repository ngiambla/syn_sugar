import sys
import time

class compress:

	def __init__(self):
		self.recipe="compress"

	def say_recipe(self):
		print(self.recipe)

	def bake(self, _ingredients):
		print("Baking: "+_ingredients.which_cuisine() +"-"+self.recipe)
		ingredient_bin = {}
		_ingredients_all = _ingredients.get_ingredients()
		_ingredient_mapping = _ingredients.get_ingredient_mapping()

		for _label in _ingredients_all:
			sys.stdout.write("\rChecking: ("+str(_label)+","+str(_ingredient_mapping[_label])+")")
			#time.sleep(1)
			sys.stdout.flush()
			if _ingredients_all[_label] in ingredient_bin:
				ingredient_bin[_ingredients_all[_label]] = ingredient_bin[_ingredients_all[_label]] +1 
			else:
				ingredient_bin[_ingredients_all[_label]] = 1
		print("")