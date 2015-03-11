#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@masterdoed.eu

### NEEDED TOOLS: volatility

#This script will extract basic information from a memory dump
#results will be written in volatility_result_path


### VARS
memory_image=$( cat memory_file.txt )
date=$( date "+%Y_%m_%d_volatility" )
forensic_user=$( whoami  )
working_path="/media/forensik_hdd/"
result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user"
volatility_result_path="$result_path/$date"
profile="Win7SP1x64"


echo "##################################################"
echo "###     EXTRACTING MEMORY INFORMATION          ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Deleting today's files: $volatility_result_path"
rm -rf $volatility_result_path

### CREATE RESULT PATH
if [ ! -d $result_path ]; then mkdir $result_path; fi
if [ ! -d $volatility_result_path ]; then mkdir $volatility_result_path; fi


### EXTRACTING INFORMATION WITH VOLATILITY
echo "---> executing userassist"
vol.py -f $memory_image --profile=$profile userassist >> $volatility_result_path/userassist.txt
echo "---> executing malfind"
vol.py -f $memory_image --profile=$profile malfind >> $volatility_result_path/malfing.txt
echo "---> executing ldrmodules"
vol.py -f $memory_image --profile=$profile ldrmodules >> $volatility_result_path/ldrmodules.txt
echo "---> executing psxview"
vol.py -f $memory_image --profile=$profile psxview >> $volatility_result_path/psxview.txt
echo "---> executing filescan"
vol.py -f $memory_image --profile=$profile filescan >> $volatility_result_path/filescan.txt
echo "---> executing hivelist"
vol.py -f $memory_image --profile=$profile hivelist >> $volatility_result_path/hivelist.txt



### FINISHED
echo "---> All operations finished. To access your results >> cd $volatility_result_path"
echo "---> Created files:"
ls -lha $volatility_result_path


