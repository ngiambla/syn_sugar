from time import localtime, strftime
from bcolors import bcolors
import parser
import glob

startup_message="+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\n| * Syn Sugar: "+strftime("%Y-%m-%d %H:%M:%S", localtime())+"\n| *--- Author: Nicholas V. Giamblanco, 2018\n+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"

help_msg="[+] help\n"

def disp_help():
	print(help_msg)

def sprinkle_sugar():
	print("Synthesizing Sugar: ")
	for file in glob.glob("data/*"):
		print(bcolors.OKBLUE + "[-] " + file.replace("data/", "",1) +bcolors.ENDC)

	print(bcolors.FAIL+"Select a file to analyze:"+bcolors.ENDC)


def stats():
	print("--collect stats.")\

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
	commands=fill_commands();
	while running:
		command=raw_input("$ ").lower()
		if command in commands:
			commands[command]()
		


if __name__ == "__main__":
	main()