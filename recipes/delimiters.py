import sys
from ingredients import ingredients

class delimiters:

	def __init__(self):
		self.recipe 	=	"delimiters"

	def say_recipe(self):
		print(self.recipe)

	def bake(self, _ingredients):

		_ingredients_all = _ingredients.get_ingredients()
		_ingredient_mapping = _ingredients.get_ingredient_mapping()


		# begin each doc with our syntactical check.
		_ingredients_all[0]="~$["+_ingredients_all[0]

		for _label in _ingredients_all:
			sys.stdout.write("\rChecking: ("+str(_label)+","+str(_ingredient_mapping[_label])+")")
			sys.stdout.flush()
			if _ingredients_all[_label][len(_ingredients_all[_label])-1] == '.':
				if _label+1 in _ingredients_all:
					if ord(_ingredients_all[_label+1][0]) >=65 and ord(_ingredients_all[_label+1][0]) <=90:
						_ingredients_all[_label]=_ingredients_all[_label]+"]$~"
						_ingredients_all[_label+1]="~$["+_ingredients_all[_label+1]

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