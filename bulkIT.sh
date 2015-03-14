#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@masterdoed.eu

### NEEDED TOOLS: bulk_extractor

#This script will collect infos of an diskimage with bulk_extractor
#results will be written in bulk_result_path


### VARS
forensic_image=$( cat image_file.txt )
memory_file=$(cat memory_file.txt)
casename=$( cat casename.txt  )
date=$( date "+%Y_%m_%d_bulk" )
forensic_user=$( whoami  )
working_path="/media/forensik_hdd/"
result_temp="/Users/$forensic_user/Desktop/forensics_results_$forensic_user/"
result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user/$casename"
bulk_result_path="$result_path/$date/"


echo "##################################################"
echo "###    GATHERING BULk_EXTRACTOR INFOS          ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Deleting today's files: $bulk_result_path"
rm -rf $bulk_result_path

### CREATE RESULT PATH
if [ ! -d $result_temp ]; then mkdir $result_temp; fi
if [ ! -d $result_path ]; then mkdir $result_path; fi
if [ ! -d $bulk_result_path ]; then mkdir $bulk_result_path; fi

### CHECK IF WORKING PATH EXISTS
if [ ! -d $working_path ]; then echo "Path=$working_path could not be found! Please check paramaters and try again ..."; 
else

### DO BULK_EXTRACTOR
echo "---> Gathering information with bulk_extractor..."
bulk_extractor -o $bulk_result_path $forensic_image

### FINISHED
echo "---> All operations finished. To access your results >> cd $bulk_result_path"
echo "---> Created files:"
ls -lha $bulk_result_path

fi

