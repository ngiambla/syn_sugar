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
					_ingredients_all[_label]=_ingredients_all[_label].replace("if", "%%cmp_if%%")

			if "therefore" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("therefore", "%%cmp_tf%%")

			if "because" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("because", "%%cmp_b%%")

			if "hence" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("hence", "%%cmp_h%%")

			if "else" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("else", "%%cmp_e%%")

			if "then" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("then", "%%cmp_t%%")

			if "than" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("than", "%%cmp_ta%%")

			if "compare" in _ingredients_all[_label].lower():
				_ingredients_all[_label]=_ingredients_all[_label].replace("compare", "%%cmp%%")


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

		return ["%%cmp_if%%","%%cmp_tf%%","%%cmp_b%%","%%cmp_h%%","%%cmp_e%%","%%cmp_t%%","%%cmp_ta%%","%%cmp%%"]
