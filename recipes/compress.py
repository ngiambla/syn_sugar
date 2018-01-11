


class compress:

	def __init__(self):
		self.recipe="compress"

	def say_recipe(self):
		print(self.recipe)

	def bake(self, item):
		print("Baking: "+item.get_name() +"-"+self.recipe)