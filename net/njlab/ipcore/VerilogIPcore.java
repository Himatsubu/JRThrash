package net.njlab.ipcore;

import java.io.PrintWriter;
import java.util.ArrayList;

import net.njlab.circuit.VerilogReg;
import net.njlab.circuit.VerilogSignal;
import net.njlab.circuit.VerilogWire;
import net.njlab.model.VerilogClass;
import net.njlab.config.*;

/**
 *  @author Keisuke Koike
 */
public abstract class VerilogIPcore implements Comparable<VerilogIPcore>{

	public String instanceName;
	public int usedTime = 0;	//このIPコアが使用された回数
	abstract public void dumpInstance(PrintWriter wout, int offset);
	abstract public void addSignalToModule();
	public int reuseTime=0;	//再利用可能になるまでの残りクロック -> スケジューリングで使用
	public int latency;
	public int throughput;
	public VerilogClass parentClass;
	public VerilogReg newData = null;
	public String resetName;
	public VerilogSignal reset;
	public VerilogSignal clockEnable;

	//割り当てられたノードの nodeSignitureを保存 (nodeSigniture == DFGraphnode のハッシュ値. ただし, ループ展開に伴うクローンノードはオリジナルと同じ値を持つ
	public ArrayList<Integer> nodeSignitures = new ArrayList<Integer>();
	int priority;	//あるノードを割り当てる際の優先度( 割り当てるノードの nodeSigniture が nodeSignitures にある値と多く一致するほど高い数値となる )

	@Override
	public int compareTo(VerilogIPcore obj){

		//int n1 = this.usedTime;
		//int n2 = obj.usedTime;

		int n1 = parentClass.config.assignSameIPtoUnrolledNode ? obj.priority : this.usedTime;
        int n2 = parentClass.config.assignSameIPtoUnrolledNode ? this.priority : obj.usedTime;

        if(n1==n2)
        	return 0;

        return n1 < n2 ? -1 : 1;
    }

	public String getInstanceName(){
		return instanceName;
	}

	public void calcPriority(int assignedNodeSign){

		priority = 0;
		int score = 1024;	//nodeSign が一致した場合の得点 ( 1024は usedTime の影響を受けないくらい大きい数値 )
		for(Integer nodeSign : nodeSignitures)
			priority += (nodeSign==assignedNodeSign) ? score : 0;

		priority -= usedTime;
	}

	protected void setClockEnable(Config config, int latency, VerilogWire clockEnable){

		if( latency>=1 && config.clockEnable )
			this.clockEnable = clockEnable;
		else
			clockEnable = null;
	}
}









