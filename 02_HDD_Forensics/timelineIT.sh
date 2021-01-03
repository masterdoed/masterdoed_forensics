#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@doedspace.de

### NEEDED TOOLS: log2timeline

#This script will create a super timeline based on log2timeline
#results will be written in timeline_result_path


### VARS
### VARS
forensic_image=$( cat image_file.txt )
memory_file=$(cat memory_file.txt)
casename=$( cat casename.txt  )
date=$( date "+%Y_%m_%d_timeline" )
forensic_user=$( whoami  )
working_path="/media/forensik_hdd/"
result_temp="/home/$forensic_user/Desktop/forensics_results_$forensic_user/"
result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user/$casename"
timeline_result_path="$result_path/$date"
timeline_file="$timeline_result_path/timeline.csv"
target_os="win7"

echo "##################################################"
echo "###          CREATING SUPERTIMELINE            ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Deleting today's files: $timeline_result_path"
rm -rf $timeline_result_path

### CREATE RESULT PATH
if [ ! -d $result_temp ]; then mkdir $result_temp; fi
if [ ! -d $result_path ]; then mkdir $result_path; fi
if [ ! -d $timeline_result_path ]; then mkdir $timeline_result_path; fi

### CHECK IF WORKING PATH EXISTS
if [ ! -d $working_path ]; then echo "Path=$working_path could not be found! Please check paramaters and try again ..."; 
else

### CREATE TIMELINE
echo "---> Gathering information with timeline toolset..."
log2timeline.py $timeline_file $forensic_image

### FINISHED
echo "---> All operations finished. To access your results >> cd $timeline_result_path"
echo "---> Created files:"
ls -lha $timeline_result_path

fi

