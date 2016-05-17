package net.njlab.sample.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Target;

@Target( {ElementType.PARAMETER} )
public @interface JRThrashCacheEnable {

	int cacheLatency();
}
