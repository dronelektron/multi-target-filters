#!/bin/bash

PLUGIN_NAME="multi-target-filters"

cd scripting
spcomp $PLUGIN_NAME.sp -i include -o ../plugins/$PLUGIN_NAME.smx
