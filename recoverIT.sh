#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@masterdoed.eu

### NEEDED TOOLS: foremost

#This script will recover deleted files from an raw image
#results will be written in recover_result_path


### VARS
forensic_image=""

date=$( date "+%Y_%m_%d_recover" )
forensic_user=$( whoami  )
working_path="/media/forensik_hdd/"
result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user/"
recover_result_path="$result_path/$date/"
types="exe"
md5_output="recover_md5.txt"
sha1_output="recover_sha1.txt"
out_md5="$recover_result_path$md5_output"
out_sha1="$recover_result_path$sha1_output"

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

### CALCULATE HASHES OF ALL RECOVERED FILES
echo "--> Calculating hashes (MD5, SHA1) of all recoverd files."
hashdeep -resbc md5 $recover_result_path >> $out_md5
hashdeep -resbc sha1 $recover_result_path >> $out_sha1



### FINISHED
echo "---> All operations finished. To access your results >> cd $hashes_result_path"
echo "---> Created files:"
ls -lha $recover_result_path

fi


