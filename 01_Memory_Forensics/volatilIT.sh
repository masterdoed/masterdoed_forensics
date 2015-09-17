#!/bin/sh

### AUTHOR: Matthias Doetterl
### EMAIL: forensic_script@masterdoed.eu

### NEEDED TOOLS: volatility

#This script will extract basic information from a memory dump
#results will be written in volatility_result_path


### VARS

############# NEEDS TO BE MODIFIED BY USER ################
profile="--profile=Win7SP1x64"
working_path="/home/doed/Desktop/"
###########################################################

#forensic_image=$( cat image_file.txt )
memory_image=$(cat memory_file.txt)
casename=$( cat casename.txt  )
date=$( date "+%Y_%m_%d_volatility" )
forensic_user=$( whoami  )
result_temp=$working_path"forensics_results_$forensic_user"
result_path=$result_temp"/"$casename
volatility_result_path="$result_path/$date"


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
echo $memory_image
echo $volatility_result_path

### EXTRACTING INFORMATION WITH VOLATILITY

############# NEEDS TO BE MODIFIED BY USER ################

echo "---> Using plugin apihooks"
vol.py $profile apihooks -f $memory_image >> $volatility_result_path/apihooks.txt

#echo "---> Using plugin atoms"
#vol.py $profile atoms -f $memory_image >> $volatility_result_path/atoms.txt

#echo "---> Using plugin atomscan"
#vol.py $profile atomscan -f $memory_image >> $volatility_result_path/atomscan.txt

#echo "---> Using plugin auditpol"
#vol.py $profile auditpol -f $memory_image >> $volatility_result_path/auditpol.txt

#echo "---> Using plugin bigpools"
#vol.py $profile bigpools -f $memory_image >> $volatility_result_path/bigpools.txt

#echo "---> Using plugin bioskbd"
#vol.py $profile bioskbd -f $memory_image >> $volatility_result_path/bioskbd.txt

#echo "---> Using plugin cachedump"
#vol.py $profile cachedump -f $memory_image >> $volatility_result_path/cachedump.txt

echo "---> Using plugin callbacks"
vol.py $profile callbacks -f $memory_image >> $volatility_result_path/callbacks.txt

#echo "---> Using plugin clipboard"
#vol.py $profile clipboard -f $memory_image >> $volatility_result_path/clipboard.txt

echo "---> Using plugin cmdline"
vol.py $profile cmdline -f $memory_image >> $volatility_result_path/cmdline.txt

echo "---> Using plugin cmdscan"
vol.py $profile cmdscan -f $memory_image >> $volatility_result_path/cmdscan.txt

echo "---> Using plugin connections"
vol.py $profile connections -f $memory_image >> $volatility_result_path/connections.txt

echo "---> Using plugin connscan"
vol.py $profile connscan -f $memory_image >> $volatility_result_path/connscan.txt

echo "---> Using plugin netscan"
vol.py $profile connscan -f $memory_image >> $volatility_result_path/netscan.txt

echo "---> Using plugin consoles"
vol.py $profile consoles -f $memory_image >> $volatility_result_path/consoles.txt

#echo "---> Using plugin crashinfo"
#vol.py $profile crashinfo -f $memory_image >> $volatility_result_path/crashinfo.txt

#echo "---> Using plugin deskscan"
#vol.py $profile deskscan -f $memory_image >> $volatility_result_path/deskscan.txt

#echo "---> Using plugin devicetree"
#vol.py $profile devicetree -f $memory_image >> $volatility_result_path/devicetree.txt

echo "---> Using plugin dlldump"
mkdir $volatility_result_path/dlldump
vol.py $profile dlldump -f $memory_image --dump-dir $volatility_result_path/dlldump >> $volatility_result_path/dlldump.txt

echo "---> Using plugin dlllist"
vol.py $profile dlllist -f $memory_image >> $volatility_result_path/dlllist.txt

#echo "---> Using plugin driverirp"
#vol.py $profile driverirp -f $memory_image >> $volatility_result_path/driverirp.txt

#echo "---> Using plugin driverscan"
#vol.py $profile driverscan -f $memory_image >> $volatility_result_path/driverscan.txt

#echo "---> Using plugin dumpcerts"
#vol.py $profile dumpcerts -f $memory_image >> $volatility_result_path/dumpcerts.txt

#echo "---> Using plugin dumpfiles"
#vol.py $profile dumpfiles -f $memory_image >> $volatility_result_path/dumpfiles.txt

echo "---> Using plugin envars"
vol.py $profile envars -f $memory_image >> $volatility_result_path/envars.txt

#echo "---> Using plugin eventhooks"
#vol.py $profile eventhooks -f $memory_image >> $volatility_result_path/eventhooks.txt

#echo "---> Using plugin evtlogs"
#vol.py $profile evtlogs -f $memory_image --dump-dir $volatility_result_path

#echo "---> Using plugin filescan"
#vol.py $profile filescan -f $memory_image >> $volatility_result_path/filescan.txt

#echo "---> Using plugin gahti"
#vol.py $profile gahti -f $memory_image >> $volatility_result_path/gahti.txt

#echo "---> Using plugin gditimers"
#vol.py $profile gditimers -f $memory_image >> $volatility_result_path/gditimers.txt

#echo "---> Using plugin gdt"
#vol.py $profile gdt -f $memory_image >> $volatility_result_path/gdt.txt

echo "---> Using plugin getservicesids"
vol.py $profile getservicesids -f $memory_image >> $volatility_result_path/getservicesids.txt

echo "---> Using plugin getsids"
vol.py $profile getsids -f $memory_image >> $volatility_result_path/getsids.txt

echo "---> Using plugin handles"
vol.py $profile handles -f $memory_image >> $volatility_result_path/handles.txt

#echo "---> Using plugin hashdump"
#vol.py $profile hashdump -f $memory_image >> $volatility_result_path/hashdump.txt

#echo "---> Using plugin hibinfo"
#vol.py $profile hibinfo -f $memory_image >> $volatility_result_path/hibinfo.txt

echo "---> Using plugin hivedump"
mkdir $volatility_result_path/hivedump
vol.py $profile hivedump -f $memory_image --dump-dir $volatility_result_path/hivedump >> $volatility_result_path/hivedump.txt

#echo "---> Using plugin hivelist"
#vol.py $profile hivelist -f $memory_image >> $volatility_result_path/hivelist.txt

#echo "---> Using plugin hivescan"
#vol.py $profile hivescan -f $memory_image >> $volatility_result_path/hivescan.txt

#echo "---> Using plugin hpakextract"
#vol.py $profile hpakextract -f $memory_image >> $volatility_result_path/hpakextract.txt

#echo "---> Using plugin hpakinfo"
#vol.py $profile hpakinfo -f $memory_image >> $volatility_result_path/hpakinfo.txt

echo "---> Using plugin idt"
vol.py $profile idt -f $memory_image >> $volatility_result_path/idt.txt

echo "---> Using plugin iehistory"
vol.py $profile iehistory -f $memory_image >> $volatility_result_path/iehistory.txt

#echo "---> Using plugin imagecopy"
#vol.py $profile imagecopy -f $memory_image >> $volatility_result_path/imagecopy.txt

#echo "---> Using plugin imageinfo"
#vol.py $profile imageinfo -f $memory_image >> $volatility_result_path/imageinfo.txt

#echo "---> Using plugin impscan"
#vol.py $profile impscan -f $memory_image >> $volatility_result_path/impscan.txt

#echo "---> Using plugin joblinks"
#vol.py $profile joblinks -f $memory_image >> $volatility_result_path/joblinks.txt

#echo "---> Using plugin kdbgscan"
#vol.py $profile kdbgscan -f $memory_image >> $volatility_result_path/kdbgscan.txt

#echo "---> Using plugin kpcrscan"
#vol.py $profile kpcrscan -f $memory_image >> $volatility_result_path/kpcrscan.txt

echo "---> Using plugin ldrmodules"
vol.py $profile ldrmodules -f $memory_image >> $volatility_result_path/ldrmodules.txt

#echo "---> Using plugin lsadump"
#vol.py $profile lsadump -f $memory_image >> $volatility_result_path/lsadump.txt

#echo "---> Using plugin machoinfo"
#vol.py $profile machoinfo -f $memory_image >> $volatility_result_path/machoinfo.txt

echo "---> Using plugin malfind"
mkdir $volatility_result_path/malfind
vol.py $profile malfind -f $memory_image --dump-dir $volatility_result_path/malfind >> $volatility_result_path/malfind.txt

echo "---> Using plugin mbrparser"
vol.py $profile mbrparser -f $memory_image >> $volatility_result_path/mbrparser.txt

#echo "---> Using plugin memdump"
#vol.py $profile memdump -f $memory_image >> $volatility_result_path/memdump.txt

#echo "---> Using plugin memmap"
#vol.py $profile memmap -f $memory_image >> $volatility_result_path/memmap.txt

#echo "---> Using plugin messagehooks"
#vol.py $profile messagehooks -f $memory_image >> $volatility_result_path/messagehooks.txt

echo "---> Using plugin mftparser"
vol.py $profile mftparser -f $memory_image --output=body --output-file=mft.csv >> $volatility_result_path/mftparser.txt

#echo "---> Using plugin moddump"
#vol.py $profile moddump -f $memory_image >> $volatility_result_path/moddump.txt

echo "---> Using plugin modscan"
vol.py $profile modscan -f $memory_image >> $volatility_result_path/modscan.txt

echo "---> Using plugin modules"
vol.py $profile modules -f $memory_image >> $volatility_result_path/modules.txt

echo "---> Using plugin multiscan"
vol.py $profile multiscan -f $memory_image >> $volatility_result_path/multiscan.txt

echo "---> Using plugin mutantscan"
vol.py $profile mutantscan -f $memory_image >> $volatility_result_path/mutantscan.txt

#echo "---> Using plugin notepad"
#vol.py $profile notepad -f $memory_image >> $volatility_result_path/notepad.txt

#echo "---> Using plugin objtypescan"
#vol.py $profile objtypescan -f $memory_image >> $volatility_result_path/objtypescan.txt

#echo "---> Using plugin patcher"
#vol.py $profile patcher -f $memory_image >> $volatility_result_path/patcher.txt

#echo "---> Using plugin poolpeek"
#vol.py $profile poolpeek -f $memory_image >> $volatility_result_path/poolpeek.txt

#echo "---> Using plugin printkey"
#vol.py $profile printkey -f $memory_image >> $volatility_result_path/printkey.txt

#echo "---> Using plugin privs"
#vol.py $profile privs -f $memory_image >> $volatility_result_path/privs.txt

echo "---> Using plugin procdump"
mkdir $volatility_result_path/procdump
vol.py $profile procdump -f $memory_image --dump-dir $volatility_result_path/procdump >> $volatility_result_path/procdump.txt

echo "---> Using plugin pslist"
vol.py $profile pslist -f $memory_image >> $volatility_result_path/pslist.txt

echo "---> Using plugin psscan"
vol.py $profile psscan -f $memory_image >> $volatility_result_path/psscan.txt

echo "---> Using plugin pstree"
vol.py $profile pstree -f $memory_image >> $volatility_result_path/pstree.txt

echo "---> Using plugin psxview"
vol.py $profile psxview -f $memory_image >> $volatility_result_path/psxview.txt

#echo "---> Using plugin raw2dmp"
#vol.py $profile raw2dmp -f $memory_image >> $volatility_result_path/raw2dmp.txt

#echo "---> Using plugin screenshot"
#vol.py $profile screenshot -f $memory_image --dump-dir $volatility_result_path

echo "---> Using plugin sessions"
vol.py $profile sessions -f $memory_image >> $volatility_result_path/sessions.txt

echo "---> Using plugin shellbags"
vol.py $profile shellbags -f $memory_image >> $volatility_result_path/shellbags.txt

#echo "---> Using plugin shimcache"
#vol.py $profile shimcache -f $memory_image >> $volatility_result_path/shimcache.txt

echo "---> Using plugin sockets"
vol.py $profile sockets -f $memory_image >> $volatility_result_path/sockets.txt

echo "---> Using plugin sockscan"
vol.py $profile sockscan -f $memory_image >> $volatility_result_path/sockscan.txt

#echo "---> Using plugin ssdt"
#vol.py $profile ssdt -f $memory_image >> $volatility_result_path/ssdt.txt

#echo "---> Using plugin strings"
#vol.py $profile strings -f $memory_image >> $volatility_result_path/strings.txt

echo "---> Using plugin svcscan"
vol.py $profile svcscan -f $memory_image >> $volatility_result_path/svcscan.txt

#echo "---> Using plugin symlinkscan"
#vol.py $profile symlinkscan -f $memory_image >> $volatility_result_path/symlinkscan.txt

echo "---> Using plugin thrdscan"
vol.py $profile thrdscan -f $memory_image >> $volatility_result_path/thrdscan.txt

echo "---> Using plugin threads"
vol.py $profile threads -f $memory_image >> $volatility_result_path/threads.txt

echo "---> Using plugin timeliner"
vol.py $profile timeliner -f $memory_image --ouput-file timeliner.csv >> $volatility_result_path/timeliner.txt

#echo "---> Using plugin timers"
#vol.py $profile timers -f $memory_image >> $volatility_result_path/timers.txt

#echo "---> Using plugin truecryptmaster"
#vol.py $profile truecryptmaster -f $memory_image >> $volatility_result_path/truecryptmaster.txt

#echo "---> Using plugin truecryptpassphrase"
#vol.py $profile truecryptpassphrase -f $memory_image >> $volatility_result_path/truecryptpassphrase.txt

#echo "---> Using plugin truecryptsummary"
#vol.py $profile truecryptsummary -f $memory_image >> $volatility_result_path/truecryptsummary.txt

echo "---> Using plugin unloadedmodules"
vol.py $profile unloadedmodules -f $memory_image >> $volatility_result_path/unloadedmodules.txt

echo "---> Using plugin userassist"
vol.py $profile userassist -f $memory_image >> $volatility_result_path/userassist.txt

echo "---> Using plugin userhandles"
vol.py $profile userhandles -f $memory_image >> $volatility_result_path/userhandles.txt

#echo "---> Using plugin vaddump"
#vol.py $profile vaddump -f $memory_image >> $volatility_result_path/vaddump.txt

#echo "---> Using plugin vadinfo"
#vol.py $profile vadinfo -f $memory_image >> $volatility_result_path/vadinfo.txt

echo "---> Using plugin vadtree"
vol.py $profile vadtree -f $memory_image >> $volatility_result_path/vadtree.txt

#echo "---> Using plugin vadwalk"
#vol.py $profile vadwalk -f $memory_image >> $volatility_result_path/vadwalk.txt

#echo "---> Using plugin vboxinfo"
#vol.py $profile vboxinfo -f $memory_image >> $volatility_result_path/vboxinfo.txt

echo "---> Using plugin verinfo"
vol.py $profile verinfo -f $memory_image >> $volatility_result_path/verinfo.txt

#echo "---> Using plugin vmwareinfo"
#vol.py $profile vmwareinfo -f $memory_image >> $volatility_result_path/vmwareinfo.txt

#echo "---> Using plugin volshell"
#vol.py $profile volshell -f $memory_image >> $volatility_result_path/volshell.txt

#echo "---> Using plugin windows"
#vol.py $profile windows -f $memory_image >> $volatility_result_path/windows.txt

#echo "---> Using plugin wintree"
#vol.py $profile wintree -f $memory_image >> $volatility_result_path/wintree.txt

#echo "---> Using plugin wndscan"
#vol.py $profile wndscan -f $memory_image >> $volatility_result_path/wndscan.txt

#echo "---> Using plugin yarascan"
#vol.py $profile yarascan -f $memory_image >> $volatility_result_path/yarascan.txt

###########################################################


### FINISHED
echo "---> All operations finished. To access your results >> cd $volatility_result_path"
echo "---> Created files:"
ls -lha $volatility_result_path





