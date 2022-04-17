if exist Project rmdir /S /Q Project
mkdir Project
cd Project

mkdir sim
mkdir tb

cd..

copy sim Project\sim
copy top.v Project
copy tb.v Project\tb

cd..
copy *.v DeSim\Project
 
cd..
copy common\*.v  16_syn_pow_5_en_pipe_struct\DeSim\Project