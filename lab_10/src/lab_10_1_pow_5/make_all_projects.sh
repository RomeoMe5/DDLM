#!/bin/sh

for d in *syn*/*
do
    if [ -d $d ]
    then
        cd $d
        ./make_project.sh
        cd ../..
    fi
done
