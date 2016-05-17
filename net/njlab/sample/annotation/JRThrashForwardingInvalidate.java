package net.njlab.sample.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

/**
 *  @author Keisuke Koike<br>
 *  このアノテーションが付けられた変数は, フォワーディングの対象外となる
 */
@Target({ElementType.FIELD, ElementType.LOCAL_VARIABLE})
public @interface JRThrashForwardingInvalidate {}