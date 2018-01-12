import sys
from ingredients import ingredients

class capitals:

	def __init__(self):
		self.recipe 	=	"capitals"

	def say_recipe(self):
		print(self.recipe)

	def bake(self, _ingredients):
		print("Baking: "+_ingredients.which_cuisine() +"-"+self.recipe)

		_ingredients_all = _ingredients.get_ingredients()
		_ingredient_mapping = _ingredients.get_ingredient_mapping()

		print("")