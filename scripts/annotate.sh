#!/bin/bash

# Taken from https://github.com/xournalpp/xournalpp/issues/268

if [ "$1" == "" ]
  then  xournalpp
  exit
fi

pdfFile=$1
baseNameFile=`basename "${pdfFile}"`
xoppFile="/home/$USER/tmp/xopp/${baseNameFile}.xopp"

mkdir -p /home/$USER/tmp/xopp

cp "${pdfFile}" "/home/$USER/tmp/xopp/${baseNameFile}"

o=$IFS
IFS=$(echo -en "\n\b")
inotifywait -m /home/$USER/tmp/xopp/ -e create -e moved_to |
    while true
    do
        for f in `ls "/home/$USER/tmp/xopp"`;
        do
            if [[ ${f} == "${baseNameFile}.xopp"  ]]
            then
                echo "Monitoring ${f}"
                inotifywait -e modify "${xoppFile}" | xournalpp ${xoppFile} -p ${pdfFile}
            fi;
        done
        break       #stop the program when user exits xournalpp
    done &

IFS=${o}
echo "Launching the app now: $IFS"
xournalpp "/home/$USER/tmp/xopp/${baseNameFile}" || rm "/home/$USER/tmp/xopp/${baseNameFile}"  "/home/$USER/tmp/xopp/${baseNameFile}.xopp"

