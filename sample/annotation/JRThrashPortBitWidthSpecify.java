package net.njlab.sample.annotation;


import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

/**
 *  @author Keisuke Koike
 *  このアノテーションは, JRThrashConvertedIntoIPcore で作成されるIPコアの入出力ポートbit幅を変更するためのものです
 *
 */
@Target( {ElementType.METHOD} )
public @interface JRThrashPortBitWidthSpecify {

	String inputBitWidth();
	int outputBitWidth();
}
