#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: masterdoed@doedspace.de

### NEEDED TOOLS: volatility

#This script will extract basic information from a memory dump
#results will be written in volatility_result_path


### VARS

############# NEEDS TO BE MODIFIED BY USER ################
#profile="--profile=Win7SP1x64"
#profile="--profile=WinXPSP2x86"
profile="--profile=Win2008R2SP1x64"

#working_path="/Users/doed/Downloads/Challenge/"

working_path="/home/masterdoed/Desktop/MemoryForensics/"

###########################################################
memory_image=$1
echo $memory_image
echo "test-----------------"

#forensic_image=$( cat image_file.txt )
#memory_image=$(cat memory_file.txt)
#casename=$( cat casename.txt  )
casename="CERES"
#date=$( date "+%Y_%m_%d_volatility" )
date=$( date "+%Y_%m_%d_" )
#forensic_user=$( whoami  )
#result_temp=$working_path"forensics_results_$forensic_user"
result_temp=$working_path
result_path=$result_temp$casename
#result_name=$(echo ${image//./"_"})
temp_image=$( echo $memory_image | awk -F/ '{print $NF}' )
image_output=$( echo $temp_image | cut -d "." -f1)
volatility_result_path="$result_path/$date$image_output"


### MAIN
echo "##################################################"
echo "###     EXTRACTING MEMORY INFORMATION          ###"
echo "##################################################"
echo ""

### DELETING OLD_FILES
echo "---> Cleaning up previous files: $volatility_result_path"
rm -rf $volatility_result_path

### CREATE RESULT PATH
if [ ! -d $result_temp ]; then mkdir $result_temp; fi
if [ ! -d $result_path ]; then mkdir $result_path; fi
if [ ! -d $volatility_result_path ]; then mkdir $volatility_result_path; fi

echo $profile
echo $volatility_result_path

### EXTRACTING INFORMATION WITH VOLATILITY

############# NEEDS TO BE MODIFIED BY USER ################

#echo "---> Using plugin apihooks"
#volatility $profile apihooks -f $memory_image >> $volatility_result_path/apihooks.txt

#echo "---> Using plugin atoms"
#volatility $profile atoms -f $memory_image >> $volatility_result_path/atoms.txt

#echo "---> Using plugin atomscan"
#volatility $profile atomscan -f $memory_image >> $volatility_result_path/atomscan.txt

#echo "---> Using plugin auditpol"
#volatility $profile auditpol -f $memory_image >> $volatility_result_path/auditpol.txt

#echo "---> Using plugin bigpools"
#volatility $profile bigpools -f $memory_image >> $volatility_result_path/bigpools.txt

#echo "---> Using plugin bioskbd"
#volatility $profile bioskbd -f $memory_image >> $volatility_result_path/bioskbd.txt

#echo "---> Using plugin cachedump"
#volatility $profile cachedump -f $memory_image >> $volatility_result_path/cachedump.txt

#echo "---> Using plugin callbacks"
volatility $profile callbacks -f $memory_image >> $volatility_result_path/callbacks.txt

#echo "---> Using plugin clipboard"
#volatility $profile clipboard -f $memory_image >> $volatility_result_path/clipboard.txt

echo "---> Using plugin cmdline"
volatility $profile cmdline -f $memory_image >> $volatility_result_path/cmdline.txt

echo "---> Using plugin cmdscan"
volatility $profile cmdscan -f $memory_image >> $volatility_result_path/cmdscan.txt

echo "---> Using plugin connections"
volatility $profile connections -f $memory_image >> $volatility_result_path/connections.txt

echo "---> Using plugin connscan"
volatility $profile connscan -f $memory_image >> $volatility_result_path/connscan.txt

echo "---> Using plugin netscan"
volatility $profile connscan -f $memory_image >> $volatility_result_path/netscan.txt

echo "---> Using plugin consoles"
volatility $profile consoles -f $memory_image >> $volatility_result_path/consoles.txt

#echo "---> Using plugin crashinfo"
#volatility $profile crashinfo -f $memory_image >> $volatility_result_path/crashinfo.txt

#echo "---> Using plugin deskscan"
#volatility $profile deskscan -f $memory_image >> $volatility_result_path/deskscan.txt

#echo "---> Using plugin devicetree"
#volatility $profile devicetree -f $memory_image >> $volatility_result_path/devicetree.txt

echo "---> Using plugin dlldump"
mkdir $volatility_result_path/dlldump
volatility $profile dlldump -f $memory_image --dump-dir $volatility_result_path/dlldump >> $volatility_result_path/dlldump.txt

echo "---> Using plugin dlllist"
volatility $profile dlllist -f $memory_image >> $volatility_result_path/dlllist.txt

#echo "---> Using plugin driverirp"
#volatility $profile driverirp -f $memory_image >> $volatility_result_path/driverirp.txt

#echo "---> Using plugin driverscan"
#volatility $profile driverscan -f $memory_image >> $volatility_result_path/driverscan.txt

#echo "---> Using plugin dumpcerts"
#volatility $profile dumpcerts -f $memory_image >> $volatility_result_path/dumpcerts.txt

#echo "---> Using plugin dumpfiles"
#volatility $profile dumpfiles -f $memory_image >> $volatility_result_path/dumpfiles.txt

echo "---> Using plugin envars"
volatility $profile envars -f $memory_image >> $volatility_result_path/envars.txt

#echo "---> Using plugin eventhooks"
#volatility $profile eventhooks -f $memory_image >> $volatility_result_path/eventhooks.txt

echo "---> Using plugin evtlogs"
volatility $profile evtlogs -f $memory_image --dump-dir $volatility_result_path

echo "---> Using plugin filescan"
volatility $profile filescan -f $memory_image >> $volatility_result_path/filescan.txt

#echo "---> Using plugin gahti"
#volatility $profile gahti -f $memory_image >> $volatility_result_path/gahti.txt

#echo "---> Using plugin gditimers"
#volatility $profile gditimers -f $memory_image >> $volatility_result_path/gditimers.txt

#echo "---> Using plugin gdt"
#volatility $profile gdt -f $memory_image >> $volatility_result_path/gdt.txt

echo "---> Using plugin getservicesids"
volatility $profile getservicesids -f $memory_image >> $volatility_result_path/getservicesids.txt

echo "---> Using plugin getsids"
volatility $profile getsids -f $memory_image >> $volatility_result_path/getsids.txt

echo "---> Using plugin handles"
volatility $profile handles -f $memory_image >> $volatility_result_path/handles.txt

#echo "---> Using plugin hashdump"
#volatility $profile hashdump -f $memory_image >> $volatility_result_path/hashdump.txt

#echo "---> Using plugin hibinfo"
#volatility $profile hibinfo -f $memory_image >> $volatility_result_path/hibinfo.txt

echo "---> Using plugin hivedump"
mkdir $volatility_result_path/hivedump
volatility $profile hivedump -f $memory_image --dump-dir $volatility_result_path/hivedump >> $volatility_result_path/hivedump.txt

echo "---> Using plugin hivelist"
volatility $profile hivelist -f $memory_image >> $volatility_result_path/hivelist.txt

echo "---> Using plugin hivescan"
volatility $profile hivescan -f $memory_image >> $volatility_result_path/hivescan.txt

#echo "---> Using plugin hpakextract"
#volatility $profile hpakextract -f $memory_image >> $volatility_result_path/hpakextract.txt

#echo "---> Using plugin hpakinfo"
#volatility $profile hpakinfo -f $memory_image >> $volatility_result_path/hpakinfo.txt

echo "---> Using plugin idt"
volatility $profile idt -f $memory_image >> $volatility_result_path/idt.txt

echo "---> Using plugin iehistory"
volatility $profile iehistory -f $memory_image >> $volatility_result_path/iehistory.txt

#echo "---> Using plugin imagecopy"
#volatility $profile imagecopy -f $memory_image >> $volatility_result_path/imagecopy.txt

#echo "---> Using plugin imageinfo"
#volatility $profile imageinfo -f $memory_image >> $volatility_result_path/imageinfo.txt

#echo "---> Using plugin impscan"
#volatility $profile impscan -f $memory_image >> $volatility_result_path/impscan.txt

#echo "---> Using plugin joblinks"
#volatility $profile joblinks -f $memory_image >> $volatility_result_path/joblinks.txt

#echo "---> Using plugin kdbgscan"
#volatility $profile kdbgscan -f $memory_image >> $volatility_result_path/kdbgscan.txt

#echo "---> Using plugin kpcrscan"
#volatility $profile kpcrscan -f $memory_image >> $volatility_result_path/kpcrscan.txt

echo "---> Using plugin ldrmodules"
volatility $profile ldrmodules -f $memory_image >> $volatility_result_path/ldrmodules.txt

#echo "---> Using plugin lsadump"
#volatility $profile lsadump -f $memory_image >> $volatility_result_path/lsadump.txt

#echo "---> Using plugin machoinfo"
#volatility $profile machoinfo -f $memory_image >> $volatility_result_path/machoinfo.txt

echo "---> Using plugin malfind"
mkdir $volatility_result_path/malfind
volatility $profile malfind -f $memory_image --dump-dir $volatility_result_path/malfind >> $volatility_result_path/malfind.txt

echo "---> Using plugin mbrparser"
volatility $profile mbrparser -f $memory_image >> $volatility_result_path/mbrparser.txt

#echo "---> Using plugin memdump"
#volatility $profile memdump -f $memory_image >> $volatility_result_path/memdump.txt

#echo "---> Using plugin memmap"
#volatility $profile memmap -f $memory_image >> $volatility_result_path/memmap.txt

#echo "---> Using plugin messagehooks"
#volatility $profile messagehooks -f $memory_image >> $volatility_result_path/messagehooks.txt

echo "---> Using plugin mftparser"
volatility $profile mftparser -f $memory_image --output=body --output-file=$volatility_result_path/mft.csv >> $volatility_result_path/mftparser.txt

#echo "---> Using plugin moddump"
#volatility $profile moddump -f $memory_image >> $volatility_result_path/moddump.txt

echo "---> Using plugin modscan"
volatility $profile modscan -f $memory_image >> $volatility_result_path/modscan.txt

echo "---> Using plugin modules"
volatility $profile modules -f $memory_image >> $volatility_result_path/modules.txt

echo "---> Using plugin multiscan"
volatility $profile multiscan -f $memory_image >> $volatility_result_path/multiscan.txt

echo "---> Using plugin mutantscan"
volatility $profile mutantscan -f $memory_image >> $volatility_result_path/mutantscan.txt

#echo "---> Using plugin notepad"
#volatility $profile notepad -f $memory_image >> $volatility_result_path/notepad.txt

#echo "---> Using plugin objtypescan"
#volatility $profile objtypescan -f $memory_image >> $volatility_result_path/objtypescan.txt

#echo "---> Using plugin patcher"
#volatility $profile patcher -f $memory_image >> $volatility_result_path/patcher.txt

#echo "---> Using plugin poolpeek"
#volatility $profile poolpeek -f $memory_image >> $volatility_result_path/poolpeek.txt

#echo "---> Using plugin printkey"
#volatility $profile printkey -f $memory_image >> $volatility_result_path/printkey.txt

#echo "---> Using plugin privs"
#volatility $profile privs -f $memory_image >> $volatility_result_path/privs.txt

echo "---> Using plugin procdump"
mkdir $volatility_result_path/procdump
volatility $profile procdump -f $memory_image --dump-dir $volatility_result_path/procdump >> $volatility_result_path/procdump.txt

#echo "---> Using plugin pslist"
#volatility $profile pslist -f $memory_image >> $volatility_result_path/pslist.txt

#echo "---> Using plugin psscan"
#volatility $profile psscan -f $memory_image >> $volatility_result_path/psscan.txt

echo "---> Using plugin pstree"
volatility $profile pstree -f $memory_image >> $volatility_result_path/pstree.txt

echo "---> Using plugin psxview"
volatility $profile psxview -f $memory_image >> $volatility_result_path/psxview.txt

#echo "---> Using plugin raw2dmp"
#volatility $profile raw2dmp -f $memory_image >> $volatility_result_path/raw2dmp.txt

#echo "---> Using plugin screenshot"
#volatility $profile screenshot -f $memory_image --dump-dir $volatility_result_path

echo "---> Using plugin sessions"
volatility $profile sessions -f $memory_image >> $volatility_result_path/sessions.txt

echo "---> Using plugin shellbags"
volatility $profile shellbags -f $memory_image >> $volatility_result_path/shellbags.txt

echo "---> Using plugin shimcache"
volatility $profile shimcache -f $memory_image >> $volatility_result_path/shimcache.txt

echo "---> Using plugin sockets"
volatility $profile sockets -f $memory_image >> $volatility_result_path/sockets.txt

echo "---> Using plugin sockscan"
volatility $profile sockscan -f $memory_image >> $volatility_result_path/sockscan.txt

#echo "---> Using plugin ssdt"
#volatility $profile ssdt -f $memory_image >> $volatility_result_path/ssdt.txt

#echo "---> Using plugin strings"
#volatility $profile strings -f $memory_image >> $volatility_result_path/strings.txt

echo "---> Using plugin svcscan"
volatility $profile svcscan -f $memory_image >> $volatility_result_path/svcscan.txt

#echo "---> Using plugin symlinkscan"
#volatility $profile symlinkscan -f $memory_image >> $volatility_result_path/symlinkscan.txt

echo "---> Using plugin thrdscan"
volatility $profile thrdscan -f $memory_image >> $volatility_result_path/thrdscan.txt

echo "---> Using plugin threads"
volatility $profile threads -f $memory_image >> $volatility_result_path/threads.txt

echo "---> Using plugin timeliner"
volatility $profile timeliner -f $memory_image --output-file $volatility_result_path/timeliner.csv >> $volatility_result_path/timeliner.txt

#echo "---> Using plugin timers"
#volatility $profile timers -f $memory_image >> $volatility_result_path/timers.txt

#echo "---> Using plugin truecryptmaster"
#volatility $profile truecryptmaster -f $memory_image >> $volatility_result_path/truecryptmaster.txt

#echo "---> Using plugin truecryptpassphrase"
#volatility $profile truecryptpassphrase -f $memory_image >> $volatility_result_path/truecryptpassphrase.txt

#echo "---> Using plugin truecryptsummary"
#volatility $profile truecryptsummary -f $memory_image >> $volatility_result_path/truecryptsummary.txt

echo "---> Using plugin unloadedmodules"
volatility $profile unloadedmodules -f $memory_image >> $volatility_result_path/unloadedmodules.txt

echo "---> Using plugin userassist"
volatility $profile userassist -f $memory_image >> $volatility_result_path/userassist.txt

echo "---> Using plugin userhandles"
volatility $profile userhandles -f $memory_image >> $volatility_result_path/userhandles.txt

#echo "---> Using plugin vaddump"
#volatility $profile vaddump -f $memory_image >> $volatility_result_path/vaddump.txt

echo "---> Using plugin vadinfo"
volatility $profile vadinfo -f $memory_image >> $volatility_result_path/vadinfo.txt

#echo "---> Using plugin vadtree"
#volatility $profile vadtree -f $memory_image >> $volatility_result_path/vadtree.txt

#echo "---> Using plugin vadwalk"
#volatility $profile vadwalk -f $memory_image >> $volatility_result_path/vadwalk.txt

#echo "---> Using plugin vboxinfo"
#volatility $profile vboxinfo -f $memory_image >> $volatility_result_path/vboxinfo.txt

echo "---> Using plugin verinfo"
volatility $profile verinfo -f $memory_image >> $volatility_result_path/verinfo.txt

#echo "---> Using plugin vmwareinfo"
#volatility $profile vmwareinfo -f $memory_image >> $volatility_result_path/vmwareinfo.txt

#echo "---> Using plugin volshell"
#volatility $profile volshell -f $memory_image >> $volatility_result_path/volshell.txt

#echo "---> Using plugin windows"
#volatility $profile windows -f $memory_image >> $volatility_result_path/windows.txt

#echo "---> Using plugin wintree"
#volatility $profile wintree -f $memory_image >> $volatility_result_path/wintree.txt

#echo "---> Using plugin wndscan"
#volatility $profile wndscan -f $memory_image >> $volatility_result_path/wndscan.txt

#echo "---> Using plugin yarascan"
#volatility $profile yarascan -f $memory_image >> $volatility_result_path/yarascan.txt

#echo "---> Creating PSTOTAL Graph"
#volatility $profile pstotal --output=dot --output-file=$volatility_result_path/pstotal.dot
#dot -Tpng $volatility_result_path/pstotal.dot > $colatility_result_path/pstotal.png

###########################################################


### FINISHED
echo "---> All operations finished. To access your results >> cd $volatility_result_path"
echo "---> Created files:"
ls -lha $volatility_result_path
