package net.njlab.circuit;

import java.io.PrintWriter;

/**
 *  @author Keisuke Koike
 */
public abstract class VerilogBlockStatement {
	abstract void dumpAlways(PrintWriter wout, int offset);
}
