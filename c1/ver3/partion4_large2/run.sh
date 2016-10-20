sudo java -jar ../../../JRThrash.jar *.java
cp ../../../result/sub00.v ../../../../sim_cfd_c1_JRT
cp ../../../result/sub01.v ../../../../sim_cfd_c1_JRT
cp ../../../result/sub02.v ../../../../sim_cfd_c1_JRT
cp ../../../result/sub03.v ../../../../sim_cfd_c1_JRT
cp ../../../result/c1.v ../../../../sim_cfd_c1_JRT
cd ../../../../sim_cfd_c1_JRT
./run_partion4.sh
