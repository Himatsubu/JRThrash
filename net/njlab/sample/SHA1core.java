package net.njlab.sample;

import net.njlab.sample.annotation.*;

public class SHA1core {

	@JRThrashExtToTop
	public int SHA1_H0 = 0x67452301;
	@JRThrashExtToTop
	public int SHA1_H1 = 0xefcdab89;
	@JRThrashExtToTop
	public int SHA1_H2 = 0x98badcfe;
	@JRThrashExtToTop
	public int SHA1_H3 = 0x10325476;
	@JRThrashExtToTop
	public int SHA1_H4 = 0xc3d2e1f0;

	final int SHA1_K0 = 0x5a827999;
	final int SHA1_K1 = 0x6ed9eba1;
	final int SHA1_K2 = 0x8f1bbcdc;
	final int SHA1_K3 = 0xca62c1d6;

	int w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13, w14, w15;
	int a, b, c, d, e;

	@JRThrashConvertedIntoIPcore(
			 availableNum = 1, latency = 0, throughput = 1,
			 outputPName = "result", clockPName = "clk", clockEnablePName = "ce", resetPName = "rst", newDataPName = "operation_nd",
			 haveClock = false, haveReset = false, haveNewData = false)
	private int Rotate1(int num){
		return (num<<1) | (num>>>31);
	}

	@JRThrashConvertedIntoIPcore(
			 availableNum = 1, latency = 0, throughput = 1,
			 outputPName = "result", clockPName = "clk", clockEnablePName = "ce", resetPName = "rst", newDataPName = "operation_nd",
			 haveClock = false, haveReset = false, haveNewData = false)
	private int Rotate5(int num){
		return (num<<5) | (num>>>27);
	}

	@JRThrashConvertedIntoIPcore(
			 availableNum = 1, latency = 0, throughput = 1,
			 outputPName = "result", clockPName = "clk", clockEnablePName = "ce", resetPName = "rst", newDataPName = "operation_nd",
			 haveClock = false, haveReset = false, haveNewData = false)
	private int Rotate30(int num){
		return (num<<30) | (num>>>2);
	}

	//コア内に function 識別機能を搭載するタイプ
	@JRThrashConvertedIntoIPcore(
			 availableNum = 1, latency = 0, throughput = 1,
			 outputPName = "result", clockPName = "clk", clockEnablePName = "ce", resetPName = "rst", newDataPName = "operation_nd",
			 haveClock = false, haveReset = false, haveNewData = false)
	private int FUNCTION(byte state, int x, int y, int z){

		if(state<20)
			return (z^(x&(y^z)));

		else if(state<40)
			return (x^y^z);

		else if(state<60)
			return  ((x&y) | (z&(x|y)));

		else
			return (x^y^z);
	}

	@JRThrashConvertedIntoIPcore(availableNum = 1, latency = 0, throughput = 1,
								 outputPName = "result", clockPName = "clk", clockEnablePName = "ce", resetPName = "rst", newDataPName = "operation_nd",
								 haveClock = false, haveReset = false, haveNewData = false)
	private int F0(int x, int y, int z) {

		return (z ^ (x & (y ^ z)));
	}

	@JRThrashConvertedIntoIPcore(availableNum = 1, latency = 0, throughput = 1,
			 outputPName = "result", clockPName = "clk", clockEnablePName = "ce", resetPName = "rst", newDataPName = "operation_nd",
			 haveClock = false, haveReset = false, haveNewData = false)
	private int F1(int x, int y, int z) {

		return (x^y^z);
	}


	@JRThrashConvertedIntoIPcore(availableNum = 1, latency = 0, throughput = 1,
			 outputPName = "result", clockPName = "clk", clockEnablePName = "ce", resetPName = "rst", newDataPName = "operation_nd",
			 haveClock = false, haveReset = false, haveNewData = false)
	private int F2(int x, int y, int z) {

		return  ((x&y) | (z&(x|y)));
	}


	/*@JRThrashUnroll(loopVariableName = "t", unrollNum = 80, unrollType = JRThrashUnroll.simple)
	public void sha_transform(int[] data){

		a = SHA1_H0;
		b = SHA1_H1;
	    c = SHA1_H2;
	    d = SHA1_H3;
	    e = SHA1_H4;

	    @JRThrashForwardingInvalidate
	    int nextW15;
	    @JRThrashForwardingInvalidate
	    int tempA;
	    int tempB;
	    int SHA1_K;
	    int f0, f1, f2, function;
	    byte t, i, tx;
	    for (t=0, i=0, tx=0; t<80; ++t, ++i, ++tx) {

	    	SHA1_K = (t<20) ? SHA1_K0 :
	    			 (t<40) ? SHA1_K1 :
	    		     (t<60) ? SHA1_K2 : SHA1_K3;

	    	f0 = F0(b,c,d);
	    	f1 = F1(b,c,d);
	    	f2 = F2(b,c,d);
	    	function = (tx<20) ? f0 : (tx<40) ? f1 : (tx<60) ? f2 : f1;
	    	//function = FUNCTION(t,b,c,d);	//コア内に function 識別機能を搭載するタイプ
	    	nextW15 = (t<16) ? data[i] : Rotate1( w13^w8^w2^w0 );
	    	tempA = function + e;
	    	tempB = SHA1_K + Rotate5(a) + nextW15;

	    	e = d;
	    	d = c;
	    	c = Rotate30(b);
	    	b = a;
	    	a = tempA + tempB;

	    	w0  = w1;
			w1  = w2;
			w2  = w3;
			w3  = w4;
			w4  = w5;
			w5  = w6;
			w6  = w7;
			w7  = w8;
			w8  = w9;
			w9  = w10;
			w10 = w11;
			w11 = w12;
			w12 = w13;
			w13 = w14;
			w14 = w15;
			w15 = nextW15;
	    }

	    SHA1_H0 +=a;
	    SHA1_H1 +=b;
	    SHA1_H2 +=c;
	    SHA1_H3 +=d;
	    SHA1_H4 +=e;
	}*/

	@JRThrashUnroll(loopVariableName = "i", unrollNum = 80, unrollType = JRThrashUnroll.copyLoopVar)
	public void sha_transform(int[] data){

		a = SHA1_H0;
		b = SHA1_H1;
	    c = SHA1_H2;
	    d = SHA1_H3;
	    e = SHA1_H4;

	    @JRThrashForwardingInvalidate
	    int nextW15;
	    @JRThrashForwardingInvalidate
	    int tempA;
	    int tempB;
	    int SHA1_K;
	    int f0, f1, f2, function;
	    byte i;
	    for (i=0; i<80;  ++i) {

	    	SHA1_K = (i<20) ? SHA1_K0 :
	    			 (i<40) ? SHA1_K1 :
	    		     (i<60) ? SHA1_K2 : SHA1_K3;

	    	f0 = F0(b,c,d);
	    	f1 = F1(b,c,d);
	    	f2 = F2(b,c,d);
	    	function = (i<20) ? f0 : (i<40) ? f1 : (i<60) ? f2 : f1;
	    	//function = FUNCTION(t,b,c,d);	//コア内に function 識別機能を搭載するタイプ
	    	nextW15 = (i<16) ? data[i] : Rotate1( w13^w8^w2^w0 );
	    	tempA = function + e;
	    	tempB = SHA1_K + Rotate5(a) + nextW15;

	    	e = d;
	    	d = c;
	    	c = Rotate30(b);
	    	b = a;
	    	a = tempA + tempB;

	    	w0  = w1;
			w1  = w2;
			w2  = w3;
			w3  = w4;
			w4  = w5;
			w5  = w6;
			w6  = w7;
			w7  = w8;
			w8  = w9;
			w9  = w10;
			w10 = w11;
			w11 = w12;
			w12 = w13;
			w13 = w14;
			w14 = w15;
			w15 = nextW15;
	    }

	    SHA1_H0 +=a;
	    SHA1_H1 +=b;
	    SHA1_H2 +=c;
	    SHA1_H3 +=d;
	    SHA1_H4 +=e;
	}
}