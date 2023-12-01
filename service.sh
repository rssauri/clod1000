#!/bin/bash

###Code by Ponni Sajeevan

##CHECKING SERVICE STATUS
systemctl status nginx > output.txt

if grep -q "running" output.txt; then
##IF SERVICE IS RUNNING    
echo "The Nginx service is running" > info.txt
##IF SERVICE IS NOT RUNNING

else

##CALL API
strStatus=$(curl -X POST 'https://kqltmgbquc.execute-api.us-east-1.amazonaws.com/SpawnEC2')
echo "$strStatus" >> info.txt
echo "The Nginx service was stopped, errored, or inactive. A new VM deployment in progress !!!"

fi
