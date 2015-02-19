#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@masterdoed.eu

### NEEDED TOOLS: mmls

#This script will identify some infos about the forensic image


### VARS
forensic_image=""
date=$( date "+%Y_%m_%d_infos" )
forensic_user=$( whoami  )
working_path="/media/forensik_hdd/"
result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user"
info_result_path="$result_path/$date"
mmls_info_out="$info_result_path/mmls_info.txt"
imgstat_info_out="$info_result_path/imgstat_info.txt"


echo "##################################################"
echo "###           RECOVER DELETED FILEiS           ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Deleting today's files: $info_result_path"
rm -rf $info_result_path

### CREATE RESULT PATH
if [ ! -d $result_path ]; then mkdir $result_path; fi
if [ ! -d $info_result_path ]; then mkdir $info_result_path; fi

### CHECK IF WORKING PATH EXISTS
if [ ! -d $working_path ]; then echo "Path=$working_path could not be found! Please check paramaters and try again ..."; 
else

### GET IMG_SAT
echo "---> Getting img_stat"
img_stat $forensic_image >> $imgstat_info_out

### GET MMLS INFO
echo "--> Getting mmls info"
mmls $forensic_image >> $mmls_info_out

### GET SIGFIND DOSPART
echo "--> Getting SigFind for dos partitions"
sigfind -t dospart $forensic_image


### FINISHED
echo "---> All operations finished. To access your results >> cd $info_result_path"
echo "---> Created files:"
ls -lha $info_result_path

fi


