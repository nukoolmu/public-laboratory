#!/bin/bash

# SET PORTABLE PATH
SCRIPT_PATH=$(readlink -f ${0})
SCRIPT_NAME=$(basename ${0})
SCRIPT_HOME=$(echo "${SCRIPT_PATH}"|sed "s|/${SCRIPT_NAME}||g")
PROCESS_ID="$$"

CONF_PATH=${SCRIPT_HOME}/etc
TMP_PATH=${SCRIPT_HOME}/tmp
REPORT_PATH=${SCRIPT_HOME}/report
INC_PATH=${SCRIPT_HOME}/inc
# Include all functions

for ifunc in $(find ${SCRIPT_HOME}/bin/  -type f) ;do
    . $ifunc
done

# program start here


banner
echo 'Json Response Compare via Curl...'
echo ''
if [ -z ${1} ];then
    filter "$CONF_PATH/default.csv"
else

    filter "$CONF_PATH/${1}.csv"
fi

echo ''
echo 'Done!'