#!/bin/sh


### PREPARATION
#INPUT
#OUTPUT

### MOUNT ###
mount_path="/mnt/forensics"
ntfs_offset=2048

### INPUT ###
#raw_image=$1
raw_image="/home/masterdoed/Desktop/EVIDENCES/ffwsql03/ffwsql03_clone/ffwsql03_clone-flat.vmdk"

### OUTPUT ###
#output_path=$2
output_path="/home/masterdoed/Desktop/CASES/active_case/"
echo "OUTPUT PATH: " $output_path
echo ""
echo ""

### IOC ###
ioc_full="/home/masterdoed/Desktop/IOC/ioc_full.txt"
ioc_simple="/home/masterdoed/Desktop/IOC/ioc_simple.txt"

### FENRIR ###
fenrir="/home/masterdoed/Desktop/doed_GIT/Fenrir/"

### VOLATILITY ###
vol_bin="/home/masterdoed/Desktop/doed_GIT/volatility-master/vol.py"
vol_profile="Win2008SP2x64"

### IMAGE MOUNTING ###
echo "### IMAGE MOUNTING ###"
echo "Mount Point: " $mount_path
losetup -d /dev/loop5
losetup -d /dev/loop6
umount /mnt/forensics
mmls $raw_image > $output_path"raw_image_mmls.txt"
losetup /dev/loop5 $raw_image
losetup -o $(( 512*$ntfs_offset )) /dev/loop6 /dev/loop5
mount -t auto /dev/loop6 $mount_path
ls -l /mnt/forensics
echo ""
echo "-----> OUTPUT: MMLS written: " $output_path"raw_image_mmls.txt"
echo ""

### COPY REGISTRY ###
echo "### COPY REGISTRY ###"
mkdir $output_path"Registry"
cp -R $mount_path"/Windows/System32/config/" $output_path"Registry/"
echo "-----> OUTPUT: Registry copied: " $output_path"Registry/"
echo ""

### COPY WIN LOGS ###
echo "### COPY WIN LOGS ###"
mkdir $output_path"WinLogs"
cp -R $mount_path"/Windows/System32/winevt/Logs/" $output_path"WinLogs/"
echo "-----> OUTPUT: WinLogs copied: " $output_path"WinLogs/"
echo ""

### CALCULATE MD5 OF FILES ###
echo "### CALCULATE MD5 OF FILES ###"
find $mount_path -type f -exec md5sum "{}" + > $output_path"md5s.txt"
echo "-----> OUTPUT: MD5 written: " $output_path"md5.txt"
echo ""

### STRINGS EXTRACTION PAGEFILE.SYS ###
echo "### STRINGS EXTRACTION PAGEFILE.SYS ###"
strings -a -o  $mount_path"/pagefile.sys" > $output_path"pagefile_strings.txt"
echo "-----> OUTPUT: pagefile strings written: " $output_path"pagefile_strings.txt"
echo ""

### CONVERT HIBERFIL.SYS ###
echo "### CONVERT HIBERFIL.SYS ###"
python $vol_bin imagecopy --profile=$vol_profile -f $mount_path"/hiberfil.sys" -O $output_path"hiberfil.raw"
echo "-----> OUTPUT: hiberfil memdump written: " $output_path"hiberfil_raw"
echo ""

### STRINGS EXTRACTION HIBERFIL.SYS ###
echo "### STRINGS EXTRACTION HIBERFIL.SYS ###"
strings -a -o  $mount_path"/hiberfil.sys" > $output_path"hiberfil_strings.txt"
echo "-----> OUTPUT: hiberfil strings written: " $output_path"hiberfil_strings.txt"
echo ""

### STRINGS EXTRACTION RAW IMAGE ###
echo "### STRINGS EXTRACTION RAW IMAGE ###"
strings -a -o  $raw_image > $output_path"raw_image_strings.txt"
echo "-----> OUTPUT: raw image strings written: " $output_path"raw_image_strings.txt"
echo ""

### MFT EXTRACTION###
echo "### MFT EXTRACTION ###"
icat -o $ntfs_offset $raw_image 0 > $output_path"MFT.raw"
analyzeMFT.py -e -f $output_path"MFT.raw" -o $output_path"MFT.csv"
echo "-----> OUTPUT: MFT written: " $output_path"MFT.raw"
echo "-----> OUTPUT: MFT written: " $output_path"MFT.csv"
echo ""

### ANTIVIRUS SCAN ###
echo "### ANTI VIRUS SCAN ###"
clamscan -ir $mount_path >> $output_path"clamscan_out.txt"
echo "-----> OUTPUT: AV Scan Out written: " $output_path"clamscan_out.txt"
echo ""


echo ""
echo "##########################################################################"
echo ""
echo "### PAGEFILE ANALYSIS ###"
grep -i "^https?://"  $output_path"pagefile_strings.txt" | sort | uniq > $output_path"pagefile_strings_analysis_urls.txt"
grep -i "^[a-z]:\\\\" $output_path"pagefile_strings.txt" | sort | uniq > $output_path"pagefile_strings_analysis_paths.txt"
grep -iFf $ioc_full $output_path"pagefile_strings.txt" > $output_path"pagefile_strings_analysis_IOCfull.txt"
grep -iFf $ioc_simple $output_path"pagefile_strings.txt" > $output_path"pagefile_strings_analysis_IOCsimple.txt"
echo "-----> OUTPUT: Pagefile analysis written: " $output_path"pagefile_strings_analysis_urls.txt"
echo "-----> OUTPUT: Pagefile analysis written: " $output_path"pagefile_strings_analysis_paths.txt"
echo "-----> OUTPUT: Pagefile analysis written: " $output_path"pagefile_strings_analysis_IOCsimple.txt"
echo "-----> OUTPUT: Pagefile analysis written: " $output_path"pagefile_strings_analysis_IOCfull.txt"
echo ""

echo "### FENRIR IOC ANALYSIS ###"
$fenrir"fenrir.sh" $mount_path 2> $output_path"fenrir_IOCs.txt"
echo "-----> OUTPUT: Fenrir IOC analysis written: " $output_path"fenrir_IOCs.txt"
echo ""
