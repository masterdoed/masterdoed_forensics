#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@masterdoed.eu

### NEEDED TOOLS: foremost

#This script will recover deleted files from an raw image
#results will be written in recover_result_path


### VARS
forensic_image="/media/F3BB-E820/_UNENCRYPTED/2015-02-09_16-09-31_20dt507061/20150209_20dt507061.001"

date=$( date "+%Y_%m_%d_recover" )
forensic_user=$( whoami  )
working_path="/media/forensik_hdd/"
result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user/"
recover_result_path="$result_path/$date/"
types="exe"

echo "##################################################"
echo "###           RECOVER DELETED FILEiS           ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Deleting today's files: $recover_result_path"
rm -rf $recover_result_path

### CREATE RESULT PATH
if [ ! -d $result_path ]; then mkdir $result_path; fi
if [ ! -d $recover_result_path ]; then mkdir $recover_result_path; fi

### CHECK IF WORKING PATH EXISTS
if [ ! -d $working_path ]; then echo "Path=$working_path could not be found! Please check paramaters and try again ..."; 
else

### RECOVER DELETED EXE FILES
echo "--> Recovering deleted exe files from $forensic_image"
foremost -v -i $forensic_image -t $types -o $recover_result_path

### FINISHED
echo "---> All operations finished. To access your results >> cd $hashes_result_path"
echo "---> Created files:"
ls -lha $recover_result_path

fi


