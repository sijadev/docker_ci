#!/bin/bash

arg_i_l='-il'
arg_c_l='-cl'
arg_n_l='-nl'

start() {
if [ "$1" == '-start' ]; then
    docker start gitlab jenkins
    docker network disconnect  docker_default jenkins
    docker network disconnect docker_default gitlab
    docker network connect --ip '172.19.0.2' --alias 'gitlab'  docker_default gitlab
    docker network connect --ip '172.19.0.3' --alias 'jenkins' docker_default jenkins
fi
return
}

function stop() {
if [ "$1" == '-stop' ]; then
    docker stop gitlab jenkins
fi
return
}

function list() {
if [ "$1" = "$arg_c_l"  ]; then
    docker ps -a
elif [ "$1" = "$arg_i_l" ]; then
    docker images
elif [ "$1" = "$arg_n_l" ]; then
    docker network ls
fi
return
}
