


class Parser:

	def __init__(self):
		print("herro")

	def parse_file(self,filename):

		try:
			with open(filename, 'r') as f:
				for line in f:

		except Exception as e:
			print("Error occured while opening file: "+str(e))