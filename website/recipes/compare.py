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
			try: 
				sys.stdout.write("\rChecking: ("+str(_label)+","+str(_ingredient_mapping[_label])+")")
				sys.stdout.flush()
			except Exception as e:
				pass

			if len(_ingredients_all[_label]) >= 2:
				if 'i' == _ingredients_all[_label][0].lower() and 'f' == _ingredients_all[_label][1].lower():
					_ingredients_all[_label]=_ingredients_all[_label].replace("if", "%%cmp%%")

			if "therefore" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("therefore", "%%cmp%%")

			if "because" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("because", "%%cmp%%")

			if "hence" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("hence", "%%cmp%%")

			if "else" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("else", "%%cmp%%")

			if "then" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("then", "%%cmp%%")

			if "than" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("than", "%%cmp%%")

			if "compare" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("compare", "%%cmp%%")

		print("")
		_ingredients.update(_ingredients_all, _ingredient_mapping)


		return ["%%cmp%%"]
