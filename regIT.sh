#/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@masterdoed.eu

### NEEDED TOOLS: regripper, auto_rip.pl

#This script will extract registry information


RS
forensic_image=$( cat image_file.txt )
memory_file=$(cat memory_file.txt)
casename=$( cat casename.txt  )
date=$( date "+%Y_%m_%d_bulk" )
forensic_user=$( whoami  )
working_path="/media/forensik_hdd/"
result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user/$casename"
regHive_config="Windows/System32/config"
registry_result_path="$result_path/$date"
registry_ntuserdat_path="$registry_result_path/ntuser"
reg_user_out="registry_ntuserdat_files.txt"

echo "##################################################"
echo "###         EXTRACT REGISTRY INFORMTION        ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Deleting today's files: $registry_result_path"
rm -rf $registry_result_path

### CREATE RESULT PATH
if [ ! -d $result_path ]; then mkdir $result_path; fi
if [ ! -d $registry_result_path ]; then mkdir $registry_result_path; fi
if [ ! -d $registry_ntuserdat_path ]; then mkdir $registry_ntuserdat_path; fi 

### CHECK IF WORKING PATH EXISTS
if [ ! -d $working_path ]; then echo "Path=$working_path could not be found! Please check paramaters and try again ..."; 
else

### FIND ALL NTUSER.DAT
echo "---> Searching for all NTUSER.DAT"
find $working_path -type f -name "NTUSER.DAT" -exec dirname {} \; >> $registry_ntuserdat_path/$reg_user_out

### EXTRACT CONFIG REGISTRY INFORMATION
echo "---> Extracting config registry information from $working_path$regHive_config."
/usr/local/bin/auto_rip.pl -c all -s $working_path$regHive_config -r $registry_result_path/config

### EXTRACT NTUSER.DAT REGISTRY INFORMATION
echo "---> Extracting ntuser.dat registry information."
while read line
	do 
		line2=$( echo $line|sed -e "s/\/media\/forensik_hdd\///g" )
		line3=$( echo $line2|sed -e "s/\//_/g" )
		line4=$( echo $line3|sed -e "s/\\$/DOLLAR_/g" )
	 	
		/usr/local/bin/auto_rip.pl -n $line -r $registry_ntuserdat_path/$line4/
 
done < $registry_ntuserdat_path/$reg_user_out

### FINISHED
echo "---> All operations finished. To access your results >> cd $registry_result_path"
echo "---> Created files:"
ls -lha $registry_result_path

fi
