#!/usr/bin/python

import sys, os, time
import dmaf_config

menu_actions = {}

# Main menu
def main_menu():
    	os.system('clear')
   
	print "\n"	
	print ".########..##.....##....###....########"
	print ".##.....##.###...###...##.##...##......"
	print ".##.....##.####.####..##...##..##......"
	print ".##.....##.##.###.##.##.....##.######.."
	print ".##.....##.##.....##.#########.##......"
	print ".##.....##.##.....##.##.....##.##......"
	print ".########..##.....##.##.....##.##......"
 	print "\n"
    	print "Welcome to Doeds Memory Analysis Framework\n"
    	print "Please choose your analysis mode: "
    	print "     1. Memory Image Info"
	print "     2. Quick Analysis"
    	print "     3. Full Analysis"
    	print "     4. Timeline Analysis"
	print "     ..."
	print "     8. Settings"
    	print "\n     0. Quit"
    	
	choice = raw_input(" >>  ")
    	exec_menu(choice)
 
    	return
 
# Execute menu
def exec_menu(choice):
    	os.system('clear')
    	ch = choice.lower()
    	if ch == '':
    	    menu_actions['main_menu']()
    	else:
        	try:
            		menu_actions[ch]()
        	except KeyError:
            		print "Invalid selection, please try again.\n"
            	menu_actions['main_menu']()
    	return
 
# Menu1 - Memory Image Info
def menu1():
        print "1. Memory Image Info\n"
        
	os.system ( "vol.py -h" )
	
	print "\n\nAll operations done ...\n\n"
	print "     9. Back"
        print "     0. Quit"

        choice = raw_input(" >>  ")
        exec_menu(choice)

        return


# Menu2 - Quick Analysis
def menu2():
    	print "2. Quick Memory Analysis\n"
	print "     21. Start Quick Memory Analysis"	
	print "     9. Back"
    	print "     0. Quit"
    	
	choice = raw_input(" >>  ")
    	exec_menu(choice)
    	
	return

def menu21():
	print "Doing Quick Memory Analysis...TBD"
	
	quickAnalysis()
	
	print "\n\nAll operations done ...\n\n"
        print "9. Back"
        
        choice = raw_input(" >> ")
        exec_menu(choice)

	return
 
# Menu3 - Full Analysis
def menu3():
    	print "3. Full Memory Analysis\n"
    	print "     31. Start Full Memory Analysis"
	print "     9. Back"
    	print "     0. Quit" 
    	
	choice = raw_input(" >>  ")
    	exec_menu(choice)
    	
	return

def menu31():
	print "Doing Full Memory Analyis...TBD"
	
	fullAnalysis()
	
	print "\n\nAll operations done ...\n\n"
        print "9. Back"
        
        choice = raw_input(" >> ")
        exec_menu(choice)
	
	return


# Menu4 - Timeline Analyis
def menu4():
	print "4. Create Memory Timeline\n"
	print "     41. Start Timeline creation"
	print "     9. Back"
	print "     0. Quit"

	choice = raw_input(" >> ")
	exec_menu(choice)

	return

def menu41():
	print "Creating Memory Timeline...TBD"

	timeLine()

	print "\n\nAll operations done ...\n\n"
	print "9. Back"
	
	choice = raw_input(" >> ")
	exec_menu(choice)

	return

# Menu8 - Settings
def menu8():
        print "8. Settings\n"
        
	print "Output_Path: " + dmaf_config.OUTPUT_PATH
	print "CaseName: " + dmaf_config.CASENAME
	print "MemoryFile: " + dmaf_config.MEMORY_FILE
	print "\n\n"

	print "     9. Back"
        print "     0. Quit"

        choice = raw_input(" >> ")
        exec_menu(choice)

        return


# Menu - Back
def back():
    	menu_actions['main_menu']()
 
# Menu - Exit 
def exit():
    	sys.exit()


# Do Quick Analysis
def quickAnalysis ():
	time.sleep (5)

	return

# Do Full Analyis
def fullAnalysis ():
	time.sleep (5)

	return

# Do Timeline
def timeLine ():
	#time.sleep(5)	
	
	os.system ( "ls -l" )
		
	return


# Menu definitions
menu_actions = {
        'main_menu': main_menu,
        '1': menu1,
        '2':  menu2,
        '21': menu21,
	'3': menu3,
	'31': menu31,
	'4': menu4,
	'41': menu41,
	'8': menu8,
        '9': back,
        '0': exit,
}

 
# Main Program
if __name__ == "__main__":
	main_menu()


