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
			try: 
				sys.stdout.write("\rChecking: ("+str(_label)+","+str(_ingredient_mapping[_label])+")")
				sys.stdout.flush()
			except Exception as e:
				pass
				
			char = _ingredients_all[_label][len(_ingredients_all[_label])-1]
			if char == '.' or char == '?' or char == '!':
				if _label+1 in _ingredients_all:
					if ord(_ingredients_all[_label+1][0]) >=65 and ord(_ingredients_all[_label+1][0]) <=90:
						if char == '.':
							_ingredients_all[_label]=_ingredients_all[_label][:len(_ingredients_all[_label])-1]+"%%per%%"
						elif char == '?':
							_ingredients_all[_label]=_ingredients_all[_label][:len(_ingredients_all[_label])-1]+"%%qsn%%"
						elif char == '!':
							_ingredients_all[_label]=_ingredients_all[_label][:len(_ingredients_all[_label])-1]+"%%xcm%%"

						_ingredients_all[_label]=_ingredients_all[_label]+"]$~"
						_ingredients_all[_label+1]="~$["+_ingredients_all[_label+1]

			if char == ',' or char == ':' or char == ";":
				if char == ',':
					_ingredients_all[_label]=_ingredients_all[_label][:len(_ingredients_all[_label])-1]+"%%lst%%"
				elif char == ':':
					_ingredients_all[_label]=_ingredients_all[_label][:len(_ingredients_all[_label])-1]+"%%cln%%"
				elif char == ';':
					_ingredients_all[_label]=_ingredients_all[_label][:len(_ingredients_all[_label])-1]+"%%scn%%"

			if "." in _ingredients_all[_label]:
				_ingredients_all[_label]=_ingredients_all[_label].replace(".","%%per%%")
			if "\"" in _ingredients_all[_label]:
				_ingredients_all[_label]=_ingredients_all[_label].replace("\"","%%dqt%%")
			if "'" in _ingredients_all[_label]:
				_ingredients_all[_label]=_ingredients_all[_label].replace("'","%%sqt%%")
			if "-" in _ingredients_all[_label]:
				_ingredients_all[_label]=_ingredients_all[_label].replace("-","%%dsh%%")


		print("")
		_ingredients.update(_ingredients_all, _ingredient_mapping)

		return ["%%per%%", "%%qsn%%", "%%xcm%%", "%%lst%%", "%%cln%%", "%%dqt%%", "%%sqt%%", "%%dsh%%"]