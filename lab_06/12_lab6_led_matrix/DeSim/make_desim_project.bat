if exist Project rmdir /S /Q Project
mkdir Project
cd Project

mkdir sim
mkdir tb

cd..

copy sim Project\sim
copy top.v Project
copy tb.v Project\tb
copy shift_reg.v Project

cd..
copy synthesis\*.v DeSim\Project

cd..
copy common\strobe_gen.v 12_lab6_led_matrix\DeSim\Project