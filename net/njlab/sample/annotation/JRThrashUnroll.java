package net.njlab.sample.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

/**
 *  @author Keisuke Koike
 *  ループ展開の際は, ループ総数 % ループ展開数 == 0 となるようにしてください
 */
@Target( {ElementType.METHOD})
public @interface JRThrashUnroll {

	//unrollType	I recommend using "copyLoopVar".
	public static int simple = 0;
	public static int copyLoopVar = simple + 1;
	public static int modifyLoopVar = copyLoopVar + 1;
	public static int modifyLoopVar_IndependentIterator = modifyLoopVar + 1;

	String loopVariableName();
	int unrollNum();
	int unrollType();
}

