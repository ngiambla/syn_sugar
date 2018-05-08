import os
import sys
import tempfile
import atexit
import readline
import inspect
import glob
import importlib
import time
import summ_to_syn as stos
import pdf2txt as pdf2txt

from time import localtime, strftime
from subprocess import call
from bcolors import bcolors
from parser import parser
from garnish import garnish
from rouge import Rouge



startup_message="+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\n"\
				"| * Syn Sugar: "+strftime("%Y-%m-%d %H:%M:%S", localtime())+"\n"\
				"| *--- Authors: Nicholas V. Giamblanco, 2018"\
				"\n+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"

help_msg="+ ~[help]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
		 "| 'bake' | 'b' --> extract information from text.\n"\
		 "|        +----> [-t] conducts a test. \n"\
         "|        +----> [-a] conducts an academic paper test.\n"\
		 "| 'help' | 'h' --> displays this. \n"\
		 "| 'info' | 'i' --> inspects a data file "+ bcolors.OKCYAN +"[opens vim]."+ bcolors.ENDC +"\n"\
		 "| 'ls'   | 'l' --> lists all text files.\n"\
		 "| 'quit' | 'q' --> quits this.\n"\
		 "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"\
		 "+ ~[utilities]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
		 "| 'clean' = cleans post baked items.\n"\
		 "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"

EDITOR = os.environ.get('EDITOR','vim') #that easy!
r = Rouge()

def load_modules_from_path(path):
	#Import all modules from the given directory
	# Check and fix the path
	if path[-1:] != '/':
		path += '/'
	# Get a list of files in the directory, if the directory exists
	if not os.path.exists(path):
		raise OSError("Directory does not exist: %s" % path)

	# Add path to the system path
	sys.path.append(path)
	# Load all the files in path
	for f in os.listdir(path):
		# Ignore anything that isn't a .py file
		if len(f) > 3 and f[-3:] == '.py':
			modname = f[:-3]
			# Import the module
			__import__(modname, globals(), locals(), ['*'])

def load_class_from_name(fqcn):
    # Break apart fqcn to get module and classname
    paths = fqcn.split('.')
    modulename = '.'.join(paths[:-1])
    classname = paths[-1]
    # Import the module
    __import__(modulename, globals(), locals(), ['*'])
    # Get the class
    cls = getattr(sys.modules[modulename], classname)
    # Check cls
    if not inspect.isclass(cls):
       raise TypeError("%s is not a class" % fqcn)
    # Return class
    return cls

def import_recipes():
	classes=[]
	load_modules_from_path("recipes")
	for file in glob.glob("recipes/*.py"):
		var=file.replace("recipes/","",1)
		var=var.replace(".py","",1)
		print(var)
		classes.append(load_class_from_name(var+"."+var))
	return classes

def disp_help():
	print(help_msg)

### Main Functionality...
def bake(file_ext=""):
	print("Getting Recipes: ")
	classes=import_recipes();

	print("~ Prepping Recipes.")
	_classes=garnish().prep_work(classes)
	

	print("\nChecking what we can cook: ")
	test_ghost=ls(file_ext)

	if file_ext == "":
		print("\n"+bcolors.FAIL+"Select a file to analyze:"+bcolors.ENDC)
		os.chdir("data/")
		what_to_cook = raw_input("$ ")
		what_to_cook = what_to_cook.replace("../", "")
		what_to_cook = what_to_cook.replace("/", "")
		os.chdir("../")
		start = time.time()

		_ingredients=parser().collect_ingredients("data/"+what_to_cook)

		if _ingredients == -1:
			return

		print(bcolors.BLUEBACK+"~ Baking. Please wait."+bcolors.ENDBACK)

		special_items=[]
		for rank in sorted(_classes.iterkeys()):
			_class=_classes[rank]
			print(bcolors.OKCYAN+"Baking: "+str(_class).split(".")[0])
			special_items = special_items + _class().bake(_ingredients)		

		print(bcolors.ENDC)

		garnish().final_touches(_ingredients, special_items)

		end = time.time()

		print(bcolors.GREENBACK+" Cooking Time: "+str(end-start)+bcolors.ENDC)

	elif(file_ext == "tests/"):
		p_avg 		= 	0
		r_avg 		= 	0
		f1_avg 		= 	0
		test_cases 	= 	0
		
		for ghost in test_ghost:

			start = time.time()

			if ghost != "data/tests/res" and ghost != "data/tests/summaries" and "MEM_ARCH" not in ghost:

				_ingredients=parser().collect_ingredients(ghost.replace("data/tests/", "data/tests/summaries/").lower()+".txt", True)
				if _ingredients != -1:
					special_items=[]
					for rank in sorted(_classes.iterkeys()):
						_class=_classes[rank]
						print(bcolors.OKCYAN+"Baking: "+str(_class).split(".")[0])
						special_items = special_items + _class().bake(_ingredients)				
					sys_summ=garnish().final_touches(_ingredients, special_items, ghost.replace("data/tests/", "data/tests/res/"))
					end = time.time()

					ref_summ=""
					if len(sys_summ) > 0:

						try:
							with open(ghost.replace("data/tests/", "data/tests/summaries/").lower()+".txt", "r") as f:
								for line in f:
									if line != "Abstract:\n":
										if line == "Introduction:\n":
											break;
										ref_summ = ref_summ + line
							if len(ref_summ) > 0:
								scores 		= stos.eval(ref_summ, sys_summ)
								print(scores[0]['rouge-l'])
								print(scores[0]['rouge-2'])
								print(scores[0]['rouge-1'])

								p_avg 		= p_avg + scores[0]['rouge-1']['p'] 
								r_avg 		= r_avg + scores[0]['rouge-1']['r'] 
								f1_avg 		= f1_avg+scores[0]['rouge-1']['f']
								test_cases 	= test_cases+1
								
								print(bcolors.GREENBACK+" Cooking Time: "+str(end-start)+bcolors.ENDC)
						except Exception as e:
							print(e)
		print(bcolors.GREENBACK+"~ Precision: "+str(p_avg/test_cases)+bcolors.ENDC)
		print(bcolors.GREENBACK+"~ Recall: "+str(r_avg/test_cases)+bcolors.ENDC)
		print(bcolors.GREENBACK+"~ F1 Average: "+str(f1_avg/test_cases)+" Tests: "+str(test_cases)+bcolors.ENDC)

        elif file_ext == "webscraper/docs/":
			f1_avg 		= 	0
			test_cases 	= 	0
			
			for ghost in test_ghost:

				start = time.time()

				if "pdf" == ghost.rsplit('.', 1)[1].lower(): 
					pdf2txt.convert(ghost)
					ghost=ghost.rsplit('.', 1)[0]+".txt"
					_ingredients=parser().collect_ingredients(ghost, False)
					print("Reading: "+ghost)
				else:
					continue
				if _ingredients != -1:
					special_items=[]
					for rank in sorted(_classes.iterkeys()):
						_class=_classes[rank]
						print(bcolors.OKCYAN+"Baking: "+str(_class).split(".")[0])
						special_items = special_items + _class().bake(_ingredients)				
					sys_summ=garnish().final_touches(_ingredients, special_items, ghost.replace("webscraper/docs/", "webscraper/res/"))
					end = time.time()

					ref_summ=""
					if len(sys_summ) > 0:

						try:
							with open(ghost.replace("webscraper/docs/", "webscraper/solns/").lower(), "r") as f:
								for line in f:
									ref_summ = ref_summ + line
							if len(ref_summ) > 0:
								scores 		= stos.eval(ref_summ, sys_summ)
								print(scores[0]['rouge-l'])
								print(scores[0]['rouge-2'])
								print(scores[0]['rouge-1'])

								f1_avg 		= f1_avg+scores[0]['rouge-1']['f']
								test_cases 	= test_cases+1
								
								print(bcolors.GREENBACK+" Cooking Time: "+str(end-start)+bcolors.ENDC)
						except Exception as e:
							print(e)
			print(bcolors.GREENBACK+"~ F1 Average: "+str(f1_avg/test_cases)+" Tests: "+str(test_cases)+bcolors.ENDC)
			

def info():

	print("~ What would you like to inspect?")

	ls()

	os.chdir("data/")
	what_to_cook = raw_input("$ ")
	what_to_cook = what_to_cook.replace("../", "")
	os.chdir("../")

	if what_to_cook != "":
		with open("data/"+what_to_cook, "r") as tf:

			call([EDITOR, tf.name])

			tf.seek(0)
			edited_message = tf.read()
	else:
		print(bcolors.FAIL+ "Aborting." + bcolors.ENDC)


def ls(file_ext=""):
	if file_ext == "webscraper/docs/":
		for file in glob.glob(file_ext + "*"):
			print(bcolors.OKCYAN + "[-] " + file +bcolors.ENDC)
		return glob.glob(file_ext + "*")	
	else:
		for file in glob.glob("data/" +file_ext + "*"):
			print(bcolors.OKCYAN + "[-] " + file.replace("data/"+file_ext, "",1) +bcolors.ENDC)
		return glob.glob("data/" +file_ext + "*")	


def fill_commands():
	commands={
		"help" : disp_help,
		"h" : disp_help,
		"quit" : exit,
		"q" : exit,
		"bake" : bake,
		"b": bake,
		"ls": ls,
		"l": ls,
		"i" : info,
		"info" : info,
		"clean" : garnish().clean,
	}
	return commands

def save(prev_h_len, histfile):
	new_h_len = readline.get_current_history_length()
	readline.set_history_length(1000)
	readline.write_history_file(histfile)

def main():

	readline.parse_and_bind("tab: complete")
	histfile = os.path.join(os.path.expanduser("~"), ".syn_sugar_hist")
	h_len = 0
	try:
		readline.read_history_file(histfile)
		h_len = readline.get_current_history_length()
	except Exception:
		open(histfile, 'wb').close()

	atexit.register(save, h_len, histfile)
	running 	=	True

	print(bcolors.OKGREEN + startup_message + bcolors.ENDC)
	disp_help()

	sys.path.append('~/recipes')	
	commands=fill_commands();
	while running:
		command=raw_input("$ ").lower()
		command=command.split()
		if command:
			if command[0] in commands:
				if len(command) == 1 :
					commands[command[0]]()
				if len(command) ==2:
					if command[1] == "-t":
						commands[command[0]]("tests/")
					elif command[1] == "-a":
						commands[command[0]]("webscraper/docs/")

		elif command != []:
			print(bcolors.FAIL+ "Unknown Command: "+str(command) + bcolors.ENDC)
		

if __name__ == "__main__":
	main()


