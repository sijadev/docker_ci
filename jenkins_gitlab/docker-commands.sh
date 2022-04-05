#!/bin/bash

SCRIPT_DIR=$(cd "$(dirname "${BASH_SOURCE[0]}")" &> /dev/null && pwd)

# import docker command function
source "$SCRIPT_DIR"/docker-script.sh


# arguments
# ------------------------
arg_start='-start'
arg_stop='-stop'
arg_i_l='-il'
arg_c_l='-cl'
arg_n_l='-nl'
arg_help="--h"
# -----------------------

# help function
help() {
if [ "$1" = "$arg_help" ]; then
cat << EOF
Docker Command Script
---------------------
usage:  -start              [start gitlab and jenkins container]
        -stop               [stop  gitlab and jenkins container]
        -il                 [print image      list]
        -cl                 [print container  list]
        -nl                 [print network    list]
        -h                  [print            help]
EOF
else
    echo "no arguments found! use: [dcs --h] for help"
fi
}
# -----------------------------------------------------------------------

if [ "$1" = "$arg_start" ]; then
    start "$1"
elif [ "$1" = "$arg_stop" ]; then
    stop "$1"
elif [ "$1" = "$arg_i_l" ] || [ "$1" = "$arg_c_l" ] || [ "$1" = "$arg_n_l" ]; then
    list "$1"
elif [ "$1" = "$arg_help" ]; then
    help "$1"
else
    echo 'argument is not valid ! use: [dcs --h ]'
fi