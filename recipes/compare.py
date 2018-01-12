import sys
from ingredients import ingredients

class compare:

	def __init__(self):
		self.recipe 	=	"compare"

	def say_recipe(self):
		print(self.recipe)

	def bake(self, _ingredients):

		_ingredients_all = _ingredients.get_ingredients()
		_ingredient_mapping = _ingredients.get_ingredient_mapping()

		for _label in _ingredients_all:
			sys.stdout.write("\rChecking: ("+str(_label)+","+str(_ingredient_mapping[_label])+")")
			sys.stdout.flush()
			if "if" == _ingredients_all[_label]:
				_ingredients_all[_label]=_ingredients_all[_label].replace("if", "%%CMP%%")

			if "therefore" == _ingredients_all[_label]:
				_ingredients_all[_label]=_ingredients_all[_label].replace("therefore", "%%CMP%%")

		with open("post_bakes/"+self.recipe+".pb", "w+") as f:
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
		_ingredients.update(_ingredients_all, _ingredient_mapping)
		print("")	