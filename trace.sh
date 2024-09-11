#!/bin/bash

export EXTRAE_HOME=/home/trochana/app/bsc-tools/extrae

source $EXTRAE_HOME/etc/extrae.sh
export EXTRAE_CONFIG_FILE=./extrae.xml
export LD_PRELOAD=$EXTRAE_HOME/lib/libmpitrace.so
export EXTRAE_ON=1

$@
