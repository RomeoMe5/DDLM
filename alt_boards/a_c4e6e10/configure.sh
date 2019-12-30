#!/bin/sh
# configure.sh

. ./setup.sh

if [ ! -d "$SYN_DIR" ]
then
    echo "Synthesis directory ${SYN_DIR} does not exist. Run synthesis first."
    exit 1
fi

cd $SYN_DIR

quartus_pgm -l > cable_list

CABLE_NAME_1=`grep "1) " cable_list | sed 's/1) //'`
CABLE_NAME_2=`grep "2) " cable_list | sed 's/2) //'`

if [ "$CABLE_NAME_1" ]
then
    if [ "$CABLE_NAME_2" ]
    then
        echo "Warning: more than one cable is connected: ${CABLE_NAME_1} and ${CABLE_NAME_2}"
    fi

    echo "Using cable ${CABLE_NAME_1}"
    quartus_pgm --no_banner -c "$CABLE_NAME_1" --mode=jtag -o "P;top.sof"
else
    echo "Cannot detect a USB-Blaster cable connected"
    exit 1
fi
