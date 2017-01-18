java -jar /home/yanai/JRThrash/JRThrash.jar *.java
cp ../../result/FIFOTestA.v .
#cp ../../result/fifoa2b.v .
#cp ../../result/FIFOTestB.v .
iverilog  FIFOTestA.v  ram.v fifoa2b.v simpleC1_tb.v
#iverilog FIFOTestA.v ram.v fifoa2b.v C1_tb.v
vvp a.out 
