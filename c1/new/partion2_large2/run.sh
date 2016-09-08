sudo java -jar ../../JRThrash.jar *.java
cp ../../result/subup.v ../../../sim_cfd_c1_JRT
cp ../../result/subunder.v ../../../sim_cfd_c1_JRT
cp ../../result/c1_test.v ../../../sim_cfd_c1_JRT
cd ../../../sim_cfd_c1_JRT
./run_partion2.sh
