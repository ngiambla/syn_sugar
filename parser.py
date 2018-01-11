from ingredients import ingredients


class parser:

	def collect_ingredients(self,filename):

		try:
			_ingredients 			=	{}
			_ingredient_mapping 	=	{}
			_label 					=	0
			_line_label 			= 	0

			with open(filename, 'r') as f:
				for line in f:
					words=line.split()
					for word in words:
						_ingredients[_label] = word
						_ingredient_mapping[_label] = _line_label
						_label = _label + 1
					_line_label = _line_label +1
			return ingredients(_ingredients, _ingredient_mapping, filename)
		except Exception as e:
			print("Error occured while opening file: "+str(e))

