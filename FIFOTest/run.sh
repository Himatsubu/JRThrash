java -jar /home/yanai/JRThrash/JRThrash.jar fifoa2b.java FIFOTestA.java FIFOTestB.java 
cp ../../result/FOFOTestA.v .
cp ../../result/fifoa2b.v .
cp ../../result/FIFOTestB.v .
#iverilog  FIFOTestA.v FIFOTestB.v  ram.v fifoa2b.v C1_tb.v
#iverilog fifotesta.v ram.v FIFOA2B.v simple_fifo_32.v simple_fifo.v C1_tb.v
#vvp a.out 
