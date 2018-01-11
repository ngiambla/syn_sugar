import os
import sys
import inspect
from time import localtime, strftime
from bcolors import bcolors
import parser
import glob
import importlib

startup_message="+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\n| * Syn Sugar: "+strftime("%Y-%m-%d %H:%M:%S", localtime())+"\n| *--- Author: Nicholas V. Giamblanco, 2018\n+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"

help_msg="[+] help\n"

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

def sprinkle_sugar():
	print("Getting Recipes: ")

	classes=import_recipes();

	for file in glob.glob("data/*"):
		print(bcolors.OKBLUE + "[-] " + file.replace("data/", "",1) +bcolors.ENDC)

	print(bcolors.FAIL+"Select a file to analyze:"+bcolors.ENDC)
	print("~ Baking. Please wait.")




def stats():
	print("--collect stats.")


def fill_commands():
	commands={
		"help" : disp_help,
		"exit" : exit,
		"e" : exit,
		"quit" : exit,
		"q" : exit,
		"sprinkle" : sprinkle_sugar,
		"stats" : stats,
	}

	return commands

def main():
	running 	=	True

	print(bcolors.OKGREEN + startup_message + bcolors.ENDC)
	sys.path.append('~/recipes')	
	commands=fill_commands();
	while running:
		command=raw_input("$ ").lower()
		if command in commands:
			commands[command]()
		


if __name__ == "__main__":
	main()