import os
import sys
import atexit
import readline
import inspect
import glob
import importlib
import time

from time import localtime, strftime
from bcolors import bcolors
from parser import parser
from garnish import garnish


startup_message="+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\n"\
				"| * Syn Sugar: "+strftime("%Y-%m-%d %H:%M:%S", localtime())+"\n"\
				"| *--- Author: Nicholas V. Giamblanco, 2018"\
				"\n+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"

help_msg="+ ~[help]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
		 "| 'bake' | 'b' --> extract information from text.\n"\
		 "| 'help' | 'h' --> displays this. \n"\
		 "| 'info' | 'i' --> does nothing. \n"\
		 "| 'ls'   | 'l' --> lists all text files.\n"\
		 "| 'quit' | 'q' --> quits this.\n"\
		 "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n\n"\
		 "+ ~[utilities]~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"\
		 "| 'clean' = cleans post baked items.\n"\
		 "+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n"




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
def bake():
	print("Getting Recipes: ")
	classes=import_recipes();

	print("~ Prepping Recipes.")
	_classes=garnish().prep_work(classes)
	

	print("\nChecking what we can cook: ")
	ls()

	print("\n"+bcolors.FAIL+"Select a file to analyze:"+bcolors.ENDC)
	os.chdir("data/")
	what_to_cook = raw_input("$ ")
	what_to_cook = what_to_cook.replace("../", "")
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

def info():
	print("--")

def ls():

	for file in glob.glob("data/*"):
		print(bcolors.OKCYAN + "[-] " + file.replace("data/", "",1) +bcolors.ENDC)

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
		if command in commands:
			commands[command]()
		elif command != "":
			print(bcolors.FAIL+ "Unknown Command: "+str(command) + bcolors.ENDC)
		

if __name__ == "__main__":
	main()


