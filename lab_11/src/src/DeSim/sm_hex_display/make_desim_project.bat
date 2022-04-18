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
copy sm_hex_display.v DeSim\sm_hex_display\Project