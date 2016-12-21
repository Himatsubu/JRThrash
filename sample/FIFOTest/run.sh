java -jar /home/yanai/JRThrash/JRThrash.jar *.java
cp ../../result/FIFOTestA.v .
cp ../../result/FIFOTestB.v .
iverilog FIFOA2B.v FIFOTestA.v  ram.v simple_fifo_32.v simple_fifo.v C1_tb.v
vvp a.out 
