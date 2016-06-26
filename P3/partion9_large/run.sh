sudo java -jar ../../JRThrash.jar *.java
cp ../../result/sub00.v ../../../sim_cfd_P3_JRT
cp ../../result/sub01.v ../../../sim_cfd_P3_JRT
cp ../../result/sub02.v ../../../sim_cfd_P3_JRT
cp ../../result/sub03.v ../../../sim_cfd_P3_JRT
cp ../../result/sub04.v ../../../sim_cfd_P3_JRT
cp ../../result/sub05.v ../../../sim_cfd_P3_JRT
cp ../../result/sub06.v ../../../sim_cfd_P3_JRT
cp ../../result/sub07.v ../../../sim_cfd_P3_JRT
cp ../../result/sub08.v ../../../sim_cfd_P3_JRT
cp ../../result/P3_2dim.v ../../../sim_cfd_P3_JRT
cd ../../../sim_cfd_P3_JRT
./run_partion16.sh
