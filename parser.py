import document


class Parser:

	def __init__(self):
		print("herro")

	def parse_file(self,filename):

		try:
			with open(filename, 'r') as f:
				for line in f:
					print(line)
		except Exception as e:
			print("Error occured while opening file: "+str(e))