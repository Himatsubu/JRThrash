package net.njlab.sample.annotation;


import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

/**
 *  @author Keisuke Koike
 *  このアノテーションを指定するメソッドは, private で宣言してください
 */
@Target( {ElementType.METHOD} )
public @interface JRThrashConvertedIntoIPcore {

	int latency();
	int throughput();
	int availableNum();
	String outputPName();
	String newDataPName();
	String clockPName();
	String clockEnablePName();
	String resetPName();
	boolean haveClock();
	boolean haveNewData();
	boolean haveReset();
}
