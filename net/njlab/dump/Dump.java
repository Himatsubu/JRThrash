package net.njlab.dump;

import java.io.PrintWriter;
import java.io.*;

/**
 *  @author Keisuke Koike
 */
public class Dump {

	public static void tprint(PrintWriter out, int offset, String st){
		int i,j;
		String[] split = st.split("\n");
		for(j=0; j<split.length; j++){
			for(i=0; i<offset; i++)
				out.print("	");
			out.print(split[j]);
			if(j!=split.length-1)
				out.print("\n");
		}
	}

	public static void tprint(PrintStream out, int offset, String st){
		int i,j;
		String[] split = st.split("\n");
		for(j=0; j<split.length; j++){
			for(i=0; i<offset; i++)
				out.print("	");
			out.print(split[j]);
			if(j!=split.length-1)
				out.print("\n");
		}
	}

	public static void tprintln(PrintWriter out, int offset, String st){
		int i;
		for(i=0; i<offset; i++)
			out.print("	");
		out.print(st+"\n");
	}

	public static String bitWidthString(int bitWidth){
		if(bitWidth==1)
			return "      ";
		else{
			if(bitWidth-1<10)
				return "[ "+(bitWidth-1)+":0]";
			return "["+(bitWidth-1)+":0]";
		}
	}

	public static String translateHTML(String str){

		str = str.replaceAll("&", "&amp;").replaceAll(" ", "&nbsp;").replaceAll("	", "&nbsp;&nbsp;&nbsp;&nbsp;");
		str = str.replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\"", "&quot;").replaceAll("\r\n|\r|\n", "<br>");
		return str;
	}
}
