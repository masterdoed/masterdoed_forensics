#!/usr/bin/python

import sys, os, time, subprocess, ConfigParser, io, shutil

menu_actions = {}

cfgFile = "dmaf_config.cfg"
config = ConfigParser.RawConfigParser()
config.read(cfgFile)

quickList = ['psxview','dlllist', 'ldrmodules', 'hivelist' ,'cmdscan', 'netscan',  'sockets', 'sockscan' , 'malfind', 'mutantscan']
fullList = []
timelineList = []

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
    	print "Please choose your analysis mode: \n"
    	print "     1. Memory Image Info"
	print "     2. Set KDBG -> will improve performance"
	print "     3. Quick Analysis (basic plugins only -> fast)"
    	print "     4. Full Analysis (structured analysis + carving -> slow)"
    	print "     5. Timeline Analysis"
	print "     6. TBD: Strings"
	print "     7. TBD: IOC scan"
	print "     ..."
	print "     99. Settings"
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

	imageInfo()        
	
	print "\n\nAll operations done ...\n\n"
	print "     9. Back"
        print "     0. Quit"

        choice = raw_input(" >>  ")
        exec_menu(choice)

        return

# Menu2 - Set KDBG
def menu2():
        print "2. Set KDBG\n"

        setKDBG()

        print "\n\nAll operations done ...\n\n"
        print "     9. Back"
        print "     0. Quit"

        choice = raw_input(" >>  ")
        exec_menu(choice)

        return


# Menu3 - Quick Analysis
def menu3():
    	print "3. Quick Memory Analysis\n"
	print "During this analysis the following plugins will be evoked:"
	
	for plugin in quickList:
		print plugin
	
	print "\n\n"
	print "     31. Start Quick Memory Analysis"	
	print "     9. Back"
    	print "     0. Quit"
    	
	choice = raw_input(" >>  ")
    	exec_menu(choice)
    	
	return

def menu31():
	print "Doing Quick Memory Analysis...\n"
	
	quickAnalysis()
	
	print "\n\nAll operations done ...\n\n"
        print "     9. Back"
	print "     0. Quit"        

        choice = raw_input(" >> ")
        exec_menu(choice)

	return
 
# Menu4 - Full Analysis
def menu4():
    	print "4. Full Memory Analysis\n"
    	print "     41. Start Full Memory Analysis"
	print "     9. Back"
    	print "     0. Quit" 
    	
	choice = raw_input(" >>  ")
    	exec_menu(choice)
    	
	return

def menu41():
	print "Doing Full Memory Analyis...TBD"
	
	fullAnalysis()
	
	print "\n\nAll operations done ...\n\n"
        print "     9. Back"
	print "     0. Quit"
        
        choice = raw_input(" >> ")
        exec_menu(choice)
	
	return


# Menu5 - Timeline Analyis
def menu5():
	print "5. Create Memory Timeline\n"
	print "     51. Start Timeline creation"
	print "     9. Back"
	print "     0. Quit"

	choice = raw_input(" >> ")
	exec_menu(choice)

	return

def menu51():
	print "Creating Memory Timeline...TBD"

	timeLine()

	print "\n\nAll operations done ...\n\n"
	print "     9. Back"
	print "     0. Quit"	
	
	choice = raw_input(" >> ")
	exec_menu(choice)

	return

# Menu99 - Settings
def menu99():
        print "99. Settings\n"
        
	for name, value in config.items('MEMORY'):
        	print '  %s = %s' % (name, value)	

	#print "Output_Path: " + config.get ('MEMORY', 'OUTPUT_PATH')
	#print "CaseName: " + config.get ('MEMORY', 'CASENAME')
	#print "MemoryFile: " + config.get ('MEMORY', 'MEMORY_FILE')
	#print "KDBG: " + config.get ('MEMORY', 'KDBG')
	
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
	with open(cfgFile, 'wb') as configfile:
    		config.write(configfile)
	sys.exit()

# Do Memory Image Info
def imageInfo ():
	createCase ("ImageInfo")

	os.system ( "vol.py -f " + config.get('MEMORY','MEMORY_FILE')  + " imageinfo >> " + config.get('MEMORY','OUTPUT_PATH').strip('"')  + "/ImageInfo.txt" )


	return

# Set KDBG
def setKDBG ():
	kdbg = subprocess.check_output ("vol.py -f " + config.get('MEMORY','MEMORY_FILE')  + " kdbgscan  | egrep -m 1 -E \"Offset \(V\)\" | cut -d \":\" -f 2 | sed -e \"s/\ //g\"", shell=True)
	
	print  "\n\n" + kdbg + "\n\n"
	
        config.set ('MEMORY', 'KDBG', kdbg)		
	
	return

# Do Quick Analysis
def quickAnalysis ():

	for plugin in quickList:
		cmd = "vol.py --profile=" + config.get('MEMORY','PROFILE').strip('"')  + " -f " + config.get('MEMORY','MEMORY_FILE').strip('"') + " " + plugin + " -g " + config.get('MEMORY', 'KDBG').strip('"') + " > " + createCase ("QuickAnalysis") + "/" + plugin + ".txt"
		print "\n" + cmd + "\n"
		os.system ( cmd )
		
	print "\n\nOutput can be found at:  " + config.get('MEMORY','OUTPUT_PATH').strip('"') 	

	time.sleep (5)

	return

# Do Full Analyis
def fullAnalysis ():
	createCase ("FullAnalysis")
	time.sleep (5)

	return

# Do Timeline
def timeLine ():
	createCase ("Timeline")
	
	os.system ( "ls -l" )
		
	return

# Create Case
def createCase (mode):

	selectedMode = mode
	
	datetime = time.strftime("%Y%m%d_")
	
	caseDate = datetime + config.get('MEMORY','CASENAME').strip('"') + "_" + mode
		
	caseOutput = config.get('MEMORY','OUTPUT_PATH').strip('"') + caseDate

	try:
    		os.stat(caseOutput)
	except:
    		os.makedirs(caseOutput) 
	
	#print "\n\nOutput can be found at: " + caseOutput + "\n\n"

	return caseOutput


# Menu definitions
menu_actions = {
        'main_menu': main_menu,
        '1': menu1,
	'2': menu2,
        '3':  menu3,
        '31': menu31,
	'4': menu4,
	'41': menu41,
	'5': menu5,
	'51': menu51,
	'99': menu99,
        '9': back,
        '0': exit,
}

 
# Main Program
if __name__ == "__main__":
	main_menu()

		
