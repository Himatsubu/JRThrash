sudo java -jar /home/yanai/JRThrash/JRThrash.jar *.java
cp /home/yanai/JRThrash/result/subup.v /home/yanai/sim_cfd_P3_JRT
cp /home/yanai/JRThrash/result/subunder.v /home/yanai/sim_cfd_P3_JRT
cp /home/yanai/JRThrash/result/P3_2dim.v /home/yanai/sim_cfd_P3_JRT
cd /home/yanai/sim_cfd_P3_JRT
./run_partion2.sh
