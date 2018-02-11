from ingredients import ingredients
from bcolors import bcolors
import re

TAG_RE = re.compile(r'<[^>]+>')



class parser:


	def prepare_stuffing(self):
		stuffing = {
			"~~~" 	: "%%ESC%%",
			"]^[" 	: "%%AND%%",
			"]v[" 	: "%%OR%%",
			"]b[" 	: "%%BUT%%",
			"~$[" 	: "%%BEG%%",
			"]$~" 	: "%%END%%",
			"%%#%%"	: "%%BAD%%"
		}
		return stuffing

	def remove_tags(self, text):
		return TAG_RE.sub('', text)

	def collect_ingredients(self,filename):

		try:
			_ingredients 			=	{}
			_ingredient_mapping 	=	{}
			_label 					=	0
			_line_label 			= 	0

			stuffing=self.prepare_stuffing()

			with open(filename, 'r') as f:
				for line in f:
					line = self.remove_tags(line)
					words=line.split()
					for word in words:
						if word in stuffing:
							word = "~~~"+stuffing[word]
						_ingredients[_label] = word
						_ingredient_mapping[_label] = _line_label
						_label = _label + 1
					if len(words) > 0:
						_line_label = _line_label +1
			return ingredients(_ingredients, _ingredient_mapping, filename)
		except Exception as e:
			print(bcolors.REDBACK+"Error occured while opening file: "+str(e)+bcolors.ENDC)
			return -1

