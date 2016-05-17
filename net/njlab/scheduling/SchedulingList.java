package net.njlab.scheduling;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;

import net.njlab.dfg.DFGraphBinary;
import net.njlab.dfg.DFGraphNode;
import net.njlab.dfg.DFGraphTypeCast;
import net.njlab.dfg.DFGraphUserDefinedOp;
import net.njlab.ipcore.VerilogIPcore;

/**
 *  @author Keisuke Koike
 */
public class SchedulingList {

	VerilogIPcore[] ipcore;
	ArrayList<DFGraphNode> priorityList = new ArrayList<DFGraphNode>();

	public SchedulingList(VerilogIPcore[] ipcore){
		this.ipcore = ipcore;
	}

	public void addList(DFGraphNode node){
		priorityList.add(node);
	}

	public ArrayList<DFGraphNode> getList(){
		return priorityList;
	}

	protected void UpdateReUseTime(){

		for(int i=0; i<ipcore.length; i++){
			if(ipcore[i].reuseTime>0)
				--ipcore[i].reuseTime;
		}
	}

	/**
	 * IP コアをノードに割り当てる
	 * */
	public boolean assignIPcore(int controlStep){

		Collections.sort(priorityList);	//優先順位順(priority の値が大きい順)に並べ替え

		if(!priorityList.isEmpty())
			calcIPcorePriority(priorityList.get(0));//IPコアに割り当ての優先度を付ける

		Arrays.sort(ipcore);	//priorityの高い順に並べ替え

		boolean IPcoreIsAssigned = false;

		for(int i=0; i<ipcore.length; i++){
			if(ipcore[i].reuseTime <= 0){//IPコアが使える

				if(!priorityList.isEmpty()){

					if(priorityList.get(0) instanceof DFGraphBinary){
						((DFGraphBinary)priorityList.get(0)).setIPcoreAndControlStep(ipcore[i], controlStep);
						updateList(i, priorityList.get(0));
						IPcoreIsAssigned = true;
					}
					else if(priorityList.get(0) instanceof DFGraphTypeCast){
						((DFGraphTypeCast)priorityList.get(0)).setIPcoreAndControlStep(ipcore[i], controlStep);
						updateList(i, priorityList.get(0));
						IPcoreIsAssigned = true;
					}
					else if(priorityList.get(0) instanceof DFGraphUserDefinedOp){
						((DFGraphUserDefinedOp)priorityList.get(0)).setIPcoreAndControlStep(ipcore[i], controlStep);
						updateList(i, priorityList.get(0));
						IPcoreIsAssigned = true;
					}
					else{
						System.out.println("DEBUG:	error SchedulingList	assignIPcore");
						ipcore[i].reuseTime = ipcore[i].throughput;
					}
				}
				else{
					break;
				}
			}
		}
		return IPcoreIsAssigned;
	}

	private void updateList(int num, DFGraphNode assignedNode) {
		priorityList.remove(0);
		ipcore[num].reuseTime = ipcore[num].throughput;
		ipcore[num].usedTime++;
		ipcore[num].nodeSignitures.add(assignedNode.getNodeSign());
	}

	/**
	 * IPコアに割り当ての優先順位を付ける
	 * */
	private void calcIPcorePriority(DFGraphNode assignedNode){

		for(VerilogIPcore ip : ipcore)
			ip.calcPriority(assignedNode.getNodeSign());
	}

}






