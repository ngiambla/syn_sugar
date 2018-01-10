from time import gmtime, strftime
from bcolors import bcolors

startup_message="+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\n| * Syn Sugar: "+strftime("%Y-%m-%d %H:%M:%S", gmtime())+"\n| *--- Author: Nicholas V. Giamblanco, 2018\n+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+"

help_msg="[+] help\n"

def disp_help():
	print(help_msg)

def fill_commands():
	commands={
		"help" : disp_help,
		"exit" : exit,
		"e" : exit,
		"quit" : exit,
		"q" : exit,
	}
	return commands

def main():
	running 	=	True

	print(bcolors.OKGREEN + startup_message + bcolors.ENDC)
	commands=fill_commands();
	while running:
		command=raw_input("$ ")
		if command in commands:
			commands[command]()
		


if __name__ == "__main__":
	main()