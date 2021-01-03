#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@doedspace.de

### NEEDED TOOLS: strings

#This script will create strings output of specified files in working_path, default is all
#results will be written in strings_result_path


### VARS
### VARS
forensic_image=$( cat image_file.txt )
memory_file=$(cat memory_file.txt)
casename=$( cat casename.txt  )
date=$( date "+%Y_%m_%d_strings" )
forensic_user=$( whoami  )
working_path="/media/forensik_hdd/"
result_temp="/home/$forensic_user/Desktop/forensics_results_$forensic_user/"
result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user/$casename"
strings_result_path="$result_path/$date"
strings_result_file="$strings_result_path/strings_image.unicode"

echo "##################################################"
echo "###          EXTRACTING STRINGS                ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Deleting today's files: $strings_result_path"
rm -rf $strings_result_path

### CREATE RESULT PATH
if [ ! -d $result_temp ]; then mkdir $result_temp; fi
if [ ! -d $result_path ]; then mkdir $result_path; fi
if [ ! -d $strings_result_path ]; then mkdir $strings_result_path; fi

### CHECK IF WORKING PATH EXISTS
if [ ! -d $working_path ]; then echo "Path=$working_path could not be found! Please check paramaters and try again ..."; 
else

### EXTRACTING STRINGS
echo "---> Gathering information with strings..."
strings -a -o $forensic_image >> $strings_result_file 

### FINISHED
echo "---> All operations finished. To access your results >> cd $strings_result_path"
echo "---> Created files:"
ls -lha $strings_result_path

fi

