from ingredients import ingredients

class conjunctions:

	def __init__(self):
		self.recipe 	=	"conjunctions"

	def say_recipe(self):
		print(self.recipe)

	def bake(self, _ingredients):
		print("Baking: "+_ingredients.which_cuisine() +"-"+self.recipe)