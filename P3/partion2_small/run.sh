sudo java -jar ../JRThrash.jar *.java
cp ../result/subunder.v ../../sim_cfd_P3_JRT
cp ../result/subup.v ../../sim_cfd_P3_JRT
cp ../result/P3_2dim.v ../../sim_cfd_P3_JRT
cd ../../sim_cfd_P3_JRT
./run_partion2.sh
