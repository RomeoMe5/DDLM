rd /q /s run
md run
cd run
gcc ../isqrt.c ../test.c -o isqrt_test
isqrt_test > ../run.log
