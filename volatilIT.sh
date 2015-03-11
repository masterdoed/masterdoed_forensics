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
#result_path="/home/$forensic_user/Desktop/forensics_results_$forensic_user"
result_path="/Users/$forensic_user/Desktop/forensics_results_$forensic_user"
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
#while read line;do echo "echo \"---> executing $line\""; echo "vol.py -f \$memory_image --profile=\$profile $line >> \$volatility_result_path/$line.txt";done < test.txt 

echo "---> executing apihooks"
vol.py -f $memory_image apihooks >> $volatility_result_path/apihooks.txt
echo "---> executing atoms"
vol.py -f $memory_image atoms >> $volatility_result_path/atoms.txt
echo "---> executing atomscan"
vol.py -f $memory_image atomscan >> $volatility_result_path/atomscan.txt
echo "---> executing auditpol"
vol.py -f $memory_image auditpol >> $volatility_result_path/auditpol.txt
echo "---> executing bigpools"
vol.py -f $memory_image bigpools >> $volatility_result_path/bigpools.txt
echo "---> executing bioskbd"
vol.py -f $memory_image bioskbd >> $volatility_result_path/bioskbd.txt
echo "---> executing cachedump"
vol.py -f $memory_image cachedump >> $volatility_result_path/cachedump.txt
echo "---> executing callbacks"
vol.py -f $memory_image callbacks >> $volatility_result_path/callbacks.txt
echo "---> executing clipboard"
vol.py -f $memory_image clipboard >> $volatility_result_path/clipboard.txt
echo "---> executing cmdline"
vol.py -f $memory_image cmdline >> $volatility_result_path/cmdline.txt
echo "---> executing cmdscan"
vol.py -f $memory_image cmdscan >> $volatility_result_path/cmdscan.txt
echo "---> executing connections"
vol.py -f $memory_image connections >> $volatility_result_path/connections.txt
echo "---> executing connscan"
vol.py -f $memory_image connscan >> $volatility_result_path/connscan.txt
echo "---> executing consoles"
vol.py -f $memory_image consoles >> $volatility_result_path/consoles.txt
echo "---> executing crashinfo"
vol.py -f $memory_image crashinfo >> $volatility_result_path/crashinfo.txt
echo "---> executing deskscan"
vol.py -f $memory_image deskscan >> $volatility_result_path/deskscan.txt
echo "---> executing devicetree"
vol.py -f $memory_image devicetree >> $volatility_result_path/devicetree.txt
echo "---> executing dlldump"
vol.py -f $memory_image dlldump >> $volatility_result_path/dlldump.txt
echo "---> executing dlllist"
vol.py -f $memory_image dlllist >> $volatility_result_path/dlllist.txt
echo "---> executing driverirp"
vol.py -f $memory_image driverirp >> $volatility_result_path/driverirp.txt
echo "---> executing driverscan"
vol.py -f $memory_image driverscan >> $volatility_result_path/driverscan.txt
echo "---> executing dumpcerts"
vol.py -f $memory_image dumpcerts >> $volatility_result_path/dumpcerts.txt
echo "---> executing dumpfiles"
vol.py -f $memory_image dumpfiles >> $volatility_result_path/dumpfiles.txt
echo "---> executing envars"
vol.py -f $memory_image envars >> $volatility_result_path/envars.txt
echo "---> executing eventhooks"
vol.py -f $memory_image eventhooks >> $volatility_result_path/eventhooks.txt
echo "---> executing evtlogs"
vol.py -f $memory_image evtlogs >> $volatility_result_path/evtlogs.txt
echo "---> executing filescan"
vol.py -f $memory_image filescan >> $volatility_result_path/filescan.txt
echo "---> executing gahti"
vol.py -f $memory_image gahti >> $volatility_result_path/gahti.txt
echo "---> executing gditimers"
vol.py -f $memory_image gditimers >> $volatility_result_path/gditimers.txt
echo "---> executing gdt"
vol.py -f $memory_image gdt >> $volatility_result_path/gdt.txt
echo "---> executing getservicesids"
vol.py -f $memory_image getservicesids >> $volatility_result_path/getservicesids.txt
echo "---> executing getsids"
vol.py -f $memory_image getsids >> $volatility_result_path/getsids.txt
echo "---> executing handles"
vol.py -f $memory_image handles >> $volatility_result_path/handles.txt
echo "---> executing hashdump"
vol.py -f $memory_image hashdump >> $volatility_result_path/hashdump.txt
echo "---> executing hibinfo"
vol.py -f $memory_image hibinfo >> $volatility_result_path/hibinfo.txt
echo "---> executing hivedump"
vol.py -f $memory_image hivedump >> $volatility_result_path/hivedump.txt
echo "---> executing hivelist"
vol.py -f $memory_image hivelist >> $volatility_result_path/hivelist.txt
echo "---> executing hivescan"
vol.py -f $memory_image hivescan >> $volatility_result_path/hivescan.txt
echo "---> executing hpakextract"
vol.py -f $memory_image hpakextract >> $volatility_result_path/hpakextract.txt
echo "---> executing hpakinfo"
vol.py -f $memory_image hpakinfo >> $volatility_result_path/hpakinfo.txt
echo "---> executing idt"
vol.py -f $memory_image idt >> $volatility_result_path/idt.txt
echo "---> executing iehistory"
vol.py -f $memory_image iehistory >> $volatility_result_path/iehistory.txt
echo "---> executing imagecopy"
vol.py -f $memory_image imagecopy >> $volatility_result_path/imagecopy.txt
echo "---> executing imageinfo"
vol.py -f $memory_image imageinfo >> $volatility_result_path/imageinfo.txt
echo "---> executing impscan"
vol.py -f $memory_image impscan >> $volatility_result_path/impscan.txt
echo "---> executing joblinks"
vol.py -f $memory_image joblinks >> $volatility_result_path/joblinks.txt
echo "---> executing kdbgscan"
vol.py -f $memory_image kdbgscan >> $volatility_result_path/kdbgscan.txt
echo "---> executing kpcrscan"
vol.py -f $memory_image kpcrscan >> $volatility_result_path/kpcrscan.txt
echo "---> executing ldrmodules"
vol.py -f $memory_image ldrmodules >> $volatility_result_path/ldrmodules.txt
echo "---> executing lsadump"
vol.py -f $memory_image lsadump >> $volatility_result_path/lsadump.txt
echo "---> executing machoinfo"
vol.py -f $memory_image machoinfo >> $volatility_result_path/machoinfo.txt
echo "---> executing malfind"
vol.py -f $memory_image malfind >> $volatility_result_path/malfind.txt
echo "---> executing mbrparser"
vol.py -f $memory_image mbrparser >> $volatility_result_path/mbrparser.txt
echo "---> executing memdump"
vol.py -f $memory_image memdump >> $volatility_result_path/memdump.txt
echo "---> executing memmap"
vol.py -f $memory_image memmap >> $volatility_result_path/memmap.txt
echo "---> executing messagehooks"
vol.py -f $memory_image messagehooks >> $volatility_result_path/messagehooks.txt
echo "---> executing mftparser"
vol.py -f $memory_image mftparser >> $volatility_result_path/mftparser.txt
echo "---> executing moddump"
vol.py -f $memory_image moddump >> $volatility_result_path/moddump.txt
echo "---> executing modscan"
vol.py -f $memory_image modscan >> $volatility_result_path/modscan.txt
echo "---> executing modules"
vol.py -f $memory_image modules >> $volatility_result_path/modules.txt
echo "---> executing multiscan"
vol.py -f $memory_image multiscan >> $volatility_result_path/multiscan.txt
echo "---> executing mutantscan"
vol.py -f $memory_image mutantscan >> $volatility_result_path/mutantscan.txt
echo "---> executing notepad"
vol.py -f $memory_image notepad >> $volatility_result_path/notepad.txt
echo "---> executing objtypescan"
vol.py -f $memory_image objtypescan >> $volatility_result_path/objtypescan.txt
echo "---> executing patcher"
vol.py -f $memory_image patcher >> $volatility_result_path/patcher.txt
echo "---> executing poolpeek"
vol.py -f $memory_image poolpeek >> $volatility_result_path/poolpeek.txt
echo "---> executing printkey"
vol.py -f $memory_image printkey >> $volatility_result_path/printkey.txt
echo "---> executing privs"
vol.py -f $memory_image privs >> $volatility_result_path/privs.txt
echo "---> executing procdump"
vol.py -f $memory_image procdump >> $volatility_result_path/procdump.txt
echo "---> executing pslist"
vol.py -f $memory_image pslist >> $volatility_result_path/pslist.txt
echo "---> executing psscan"
vol.py -f $memory_image psscan >> $volatility_result_path/psscan.txt
echo "---> executing pstree"
vol.py -f $memory_image pstree >> $volatility_result_path/pstree.txt
echo "---> executing psxview"
vol.py -f $memory_image psxview >> $volatility_result_path/psxview.txt
echo "---> executing raw2dmp"
vol.py -f $memory_image raw2dmp >> $volatility_result_path/raw2dmp.txt
echo "---> executing screenshot"
vol.py -f $memory_image screenshot >> $volatility_result_path/screenshot.txt
echo "---> executing sessions"
vol.py -f $memory_image sessions >> $volatility_result_path/sessions.txt
echo "---> executing shellbags"
vol.py -f $memory_image shellbags >> $volatility_result_path/shellbags.txt
echo "---> executing shimcache"
vol.py -f $memory_image shimcache >> $volatility_result_path/shimcache.txt
echo "---> executing sockets"
vol.py -f $memory_image sockets >> $volatility_result_path/sockets.txt
echo "---> executing sockscan"
vol.py -f $memory_image sockscan >> $volatility_result_path/sockscan.txt
echo "---> executing ssdt"
vol.py -f $memory_image ssdt >> $volatility_result_path/ssdt.txt
echo "---> executing strings"
vol.py -f $memory_image strings >> $volatility_result_path/strings.txt
echo "---> executing svcscan"
vol.py -f $memory_image svcscan >> $volatility_result_path/svcscan.txt
echo "---> executing symlinkscan"
vol.py -f $memory_image symlinkscan >> $volatility_result_path/symlinkscan.txt
echo "---> executing thrdscan"
vol.py -f $memory_image thrdscan >> $volatility_result_path/thrdscan.txt
echo "---> executing threads"
vol.py -f $memory_image threads >> $volatility_result_path/threads.txt
echo "---> executing timeliner"
vol.py -f $memory_image timeliner >> $volatility_result_path/timeliner.txt
echo "---> executing timers"
vol.py -f $memory_image timers >> $volatility_result_path/timers.txt
echo "---> executing truecryptmaster"
vol.py -f $memory_image truecryptmaster >> $volatility_result_path/truecryptmaster.txt
echo "---> executing truecryptpassphrase"
vol.py -f $memory_image truecryptpassphrase >> $volatility_result_path/truecryptpassphrase.txt
echo "---> executing truecryptsummary"
vol.py -f $memory_image truecryptsummary >> $volatility_result_path/truecryptsummary.txt
echo "---> executing unloadedmodules"
vol.py -f $memory_image unloadedmodules >> $volatility_result_path/unloadedmodules.txt
echo "---> executing userassist"
vol.py -f $memory_image userassist >> $volatility_result_path/userassist.txt
echo "---> executing userhandles"
vol.py -f $memory_image userhandles >> $volatility_result_path/userhandles.txt
echo "---> executing vaddump"
vol.py -f $memory_image vaddump >> $volatility_result_path/vaddump.txt
echo "---> executing vadinfo"
vol.py -f $memory_image vadinfo >> $volatility_result_path/vadinfo.txt
echo "---> executing vadtree"
vol.py -f $memory_image vadtree >> $volatility_result_path/vadtree.txt
echo "---> executing vadwalk"
vol.py -f $memory_image vadwalk >> $volatility_result_path/vadwalk.txt
echo "---> executing vboxinfo"
vol.py -f $memory_image vboxinfo >> $volatility_result_path/vboxinfo.txt
echo "---> executing verinfo"
vol.py -f $memory_image verinfo >> $volatility_result_path/verinfo.txt
echo "---> executing vmwareinfo"
vol.py -f $memory_image vmwareinfo >> $volatility_result_path/vmwareinfo.txt
echo "---> executing volshell"
vol.py -f $memory_image volshell >> $volatility_result_path/volshell.txt
echo "---> executing windows"
vol.py -f $memory_image windows >> $volatility_result_path/windows.txt
echo "---> executing wintree"
vol.py -f $memory_image wintree >> $volatility_result_path/wintree.txt
echo "---> executing wndscan"
vol.py -f $memory_image wndscan >> $volatility_result_path/wndscan.txt
echo "---> executing yarascan"
vol.py -f $memory_image yarascan >> $volatility_result_path/yarascan.txt


### FINISHED
echo "---> All operations finished. To access your results >> cd $volatility_result_path"
echo "---> Created files:"
ls -lha $volatility_result_path


