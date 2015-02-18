#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@masterdoed.eu

### NEEDED TOOLS: md5deep, hashdeep

#This script will create MD5 sums of all file in working_path
#results will be written in result_path
#hyperfil.sys file will be excluded


### VARS
date=$( date "+%Y_%m_%d" )
forensic_user=$( whoami  )
working_path="/bin/"
result_path="/home/$forensic_user/Desktop/doed_forensics_results/$date/"
files_output="all_files.txt"
md5_output="all_files_md5.txt"
sha1_output="all_files_sha1.txt"
out_files="$result_path$files_output"
out_md5="$result_path$md5_output"
out_sha1="$result_path$sha1_output"


echo "##################################################"
echo "###             GENERATING HASHES              ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Deleting today's files: $result_path"
rm -rf $result_path

### CREATE RESULT PATH
if [ ! -d $result_path ]; then mkdir $result_path; fi

### CHECK IF WORKING PATH EXISTS
if [ ! -d $working_path ]; then echo "Path=$working_path could not be found! Please check paramaters and try again ..."; 
else

### GET ALL FILES
echo "---> Getting all files >> $out_files"
find $working_path -type f | grep -v "hyberfil.sys" >> $out_files


### CALCULATE MD5 HASHES
echo "---> Calculating MD5 hashes >> $out_md5"
hashdeep -resbc md5 -f $out_files >> $out_md5

### CALCULATE SHA1 HASHES
echo "---> Calculating SHA1 hashes >> $out_sha1"
hashdeep -resbc sha1 -f $out_files >> $out_sha1

### FINISHED
echo "---> All operations finished. To access your results >> cd $result_path"
echo "---> Created files:"
ls -lha $result_path

fi

### DEBUGGING
#echo $forensic_user
#echo $working_path
#echo $result_path
#echo $files_output
#echo $md5_output
#echo $sha1_output
#echo $out_files
#echo $out_md5
#echo $out_sha1
