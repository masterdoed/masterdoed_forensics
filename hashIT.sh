#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@masterdoed.eu

### NEEDED TOOLS: md5deep, hashdeep

#This script will create MD5 sums of all file in working_path
#results will be written in result_path
#hyperfil.sys file will be excluded


### VARS
forensic_image=$( cat image_file.txt )
memory_file=$(cat memory_file.txt)
casename=$( cat casename.txt  )
date=$( date "+%Y_%m_%d_bulk" )
forensic_user=$( whoami  )
working_path="/media/forensik_hdd/"
result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user/$casename"
hashes_result_path="$result_path/$date/"
files_output="all_files.txt"
md5_output="all_files_md5.txt"
sha1_output="all_files_sha1.txt"
out_files="$hashes_result_path$files_output"
out_md5="$hashes_result_path$md5_output"
out_sha1="$hashes_result_path$sha1_output"


echo "##################################################"
echo "###             GENERATING HASHES              ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Deleting today's files: $hashes_result_path"
rm -rf $hashes_result_path

### CREATE RESULT PATH
if [ ! -d $result_path ]; then mkdir $result_path; fi
if [ ! -d $hashes_result_path ]; then mkdir $hashes_result_path; fi

### CHECK IF WORKING PATH EXISTS
if [ ! -d $working_path ]; then echo "Path=$working_path could not be found! Please check paramaters and try again ..."; 
else

### GET ALL FILES
echo "---> Getting all files >> $out_files"
find $working_path -type f | grep -v "hiberfil.sys" | grep -v "pagefile.sys" >> $out_files


### CALCULATE MD5 HASHES
echo "---> Calculating MD5 hashes >> $out_md5"
hashdeep -resbc md5 -f $out_files >> $out_md5

### CALCULATE SHA1 HASHES
echo "---> Calculating SHA1 hashes >> $out_sha1"
hashdeep -resbc sha1 -f $out_files >> $out_sha1

### FINISHED
echo "---> All operations finished. To access your results >> cd $hashes_result_path"
echo "---> Created files:"
ls -lha $hashes_result_path

fi

