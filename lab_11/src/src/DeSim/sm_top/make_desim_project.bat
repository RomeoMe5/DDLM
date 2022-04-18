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
cd..
copy sm_top.v DeSim\sm_top\Project
copy sm_register.v DeSim\sm_top\Project
copy sm_cpu.v DeSim\sm_top\Project
copy sm_rom.v DeSim\sm_top\Project
copy sm_cpu.vh DeSim\sm_top\Project