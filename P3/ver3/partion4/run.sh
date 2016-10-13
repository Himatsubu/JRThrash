sudo java -jar /home/yanai/JRThrash/JRThrash.jar *.java
cp /home/yanai/JRThrash/result/sub00.v /home/yanai/sim_cfd_P3_JRT
cp /home/yanai/JRThrash/result/sub01.v /home/yanai/sim_cfd_P3_JRT
cp /home/yanai/JRThrash/result/sub02.v /home/yanai/sim_cfd_P3_JRT
cp /home/yanai/JRThrash/result/sub03.v /home/yanai/sim_cfd_P3_JRT
cp /home/yanai/JRThrash/result/P3_2dim.v /home/yanai/sim_cfd_P3_JRT
cd /home/yanai/sim_cfd_P3_JRT
./run_partion4.sh
