#!/bin/sh

rm -rf run
mkdir run
cd run
gcc ../isqrt.c ../test.c -o isqrt_test
./isqrt_test > ../run.log
