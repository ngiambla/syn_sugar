

class ingredients:

	def __init__(self, _ingredients, _ingredient_mapping, _cuisine):
		self._ingredients			=	_ingredients
		self._ingredient_mapping 	= 	_ingredient_mapping
		self._cuisine				=	_cuisine


	def get_ingredients(self):
		return self._ingredients

	def get_ingredient_mapping(self):
		return self._ingredient_mapping

	def update(self, _ingredients, _ingredient_mapping):
		self._ingredients=_ingredients
		self._ingredient_mapping=_ingredient_mapping

	def which_cuisine(self):
		return self._cuisine