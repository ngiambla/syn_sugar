import os
import sys
import tempfile
import atexit
import readline
import inspect
import glob
import importlib
import time

from time import localtime, strftime
from subprocess import call
from bcolors import bcolors
from parser import parser
from garnish import garnish



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


### Main Functionality...
def bake():
	print("Getting Recipes: ")
	classes=import_recipes();

	print("~ Prepping Recipes.")
	_classes=garnish().prep_work(classes)
	

	print("\nChecking what to cook: ")

	os.chdir("uploads/")
	what_to_cook=""
	for file in glob.glob("*"):
		if "__1_" == file[:4]:
			what_to_cook = file
	if what_to_cook == "":
		return "ERR"
	print(what_to_cook)
	os.chdir("../")
	start = time.time()

	_ingredients=parser().collect_ingredients("uploads/"+what_to_cook)

	if _ingredients == -1:
		return

	print(bcolors.BLUEBACK+"~ Baking. Please wait."+bcolors.ENDBACK)

	special_items=[]
	for rank in sorted(_classes.iterkeys()):
		_class=_classes[rank]
		print(bcolors.OKCYAN+"Baking: "+str(_class).split(".")[0])
		special_items = special_items + _class().bake(_ingredients)		

	print(bcolors.ENDC)

	summary=garnish().final_touches(_ingredients, special_items)

	end = time.time()

	print(bcolors.GREENBACK+" Cooking Time: "+str(end-start)+bcolors.ENDC)

	return summary

