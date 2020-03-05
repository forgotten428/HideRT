# HideRT
Hide Red Team Activity
### Currently skips **root** user
- This must be manually changed prior to running setup in "HideRT.sh" on line #24

# Setup
After cloning this repo, run:

`sudo ./setup.sh`

Sit back relax and pwn Blue Team now that they can't see connections or activity

# Script Summary
This script was built for the GDDC (Great Dane Defense Competition), specifically to be used by the Red Team players.

The idea is to "hide" activity from the Blue Team, this is accomplished by mounting processes to a temporary directory.

Processes mounted can no longer be seen with 'ps aux', 'top', etc..

This will also hide from 'w', not showing what tty or pts Red Team is on!
