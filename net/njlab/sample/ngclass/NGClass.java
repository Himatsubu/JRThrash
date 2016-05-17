package net.njlab.sample.ngclass;

import net.njlab.sample.annotation.JRThrashConvertedIntoIPcore;
import net.njlab.sample.annotation.JRThrashExtToTop;
import net.njlab.sample.annotation.JRThrashReadOnlyPort;

/**
 *  @author Keisuke Koike
 */
class NGClassSuper{

	int num;
}

//合成できない記述一覧
class NGClass extends NGClassSuper{

	final int[] a = {2,3,4};				//配列の初期化は new type[elementNum][elementNum]... としてください
	final int[] x = new int[a[0]];			//配列の要素数は整数値で指定してください
	final String[] st = new String[2];		//配列変数の型はプリミティブ型のみ対応しています
	short[] b = new short[12];				//配列変数は final を付けて宣言してください
	double[] c;								//配列変数は new を使って初期化して下さい
	NGClass obj0 = new NGClass();			//クラス型の変数はfinalを付けて宣言してください
	int d = 0;
	int e = d;								//フィールドの初期化は数値リテラルを使用してください

	@JRThrashExtToTop
	private final int[] cc = new int[16];	//JRThrashExtToTop , JRThrashReadOnlyPort アノテーションは private 変数につけられません

	@JRThrashReadOnlyPort	//JRThrashReadOnlyPort が付いた変数には書き込めません
	int ccxx = 0;

	//メソッドの戻り値はプリミティブ型にしてください
	String funcA(int ax[][]){	//パラメータリストの配列変数は1次元にしてください

		int[] ary;    //配列変数はフィールド変数かパラメータリストとして宣言してください

		ary = new int[10];		//ソッド内部で配列のインスタンス化はできません
		obj0 = new NGClass();	//メソッド内部でクラスのインスタンス化はできません

		//assert b[0]>0 : "x"; //アサーションは使えません
		for(String str : st){}	//拡張 for 文は使えません

		System.out.println();			//このメソッドは回路化できません

		String.valueOf(2);				//フィールドで宣言されたクラス型変数のみメソッド呼び出しができます
		a[1] = obj0.d;					//オブジェクトの "プリミティブ型" フィールドにはアクセスはできません  obj.a[0] -> OK
		obj0 = (NGClass)obj0;			//キャストする型はプリミティブ型にしてください
		this.num = 0;					//このフィールドはこのクラス内部に宣言されていません

		if(obj0 instanceof Object){}	//instanceof は使えません

		switch(a[0]){
			case (int)1.0 :	//case 文の条件部は整数値で記述してください
		}

		label1:				//label は使用できません

		d = d<<40;	//ビット数分以上シフトしないでください, エラーは出ませんが, Java と Verilog HDL で結果の不整合が起こります
		funcB(obj0.a);	//オブジェクトのフィールド配列をメソッドの引数に指定できません

		return "NGClass";						//リテラルは, 整数, 単・倍精度小数, true・false にのみ対応しています
	}

	//synchronized は使えません
	synchronized int funcA(){	//関数はオーバーロードしないでください
		return funcA();	//再帰呼び出しはできません.	また, オーバーロードされた関数も呼び出せません
						// ※エラー表示はされませんが funcA -> funcB -> funcC -> funcA の様な再帰性を持つメソッド呼び出しも正しい結果が得られません
	}

	void funcB(int[] arrayB) throws ArithmeticException{	//例外は投げられません

		synchronized(this){}	//syncronized block は使えません
		throw new ArithmeticException(""); //throws 文 は使えません
	}

	//------------------------------------------------------------------------------------------------------------------------

	//合成できない式
	int expressionNG(){

		//++, --, =, op=  は代入式の右辺で使えません
		//また, メソッド呼び出しは   variable = methodName(...)として使用してください
		int num0=0, num1=12;
		int num2 = num1 = num0; //	int num2 = num0;	num1 = num0;
		num0 *= num1 += num2;	//num1 += num2;  num0 *= num1;
		num0 = num1++;			//num0 = num1;	num1++;
		num0 = ++num1;			//++num1;   num0 = num1;
		num0 = funcA() + num1;	//num2 = funcA();   num0 = num2 + num1;
		num0 += funcA();		//num2 = funcA();    num0 = num2 + num0;

		double dnum = rand() + rand();	// JRThrashConvertedIntoIPcore を指定したメソッドは, 書き方に制限はありません

		return num0;
	}

	//------------------------------------------------------------------------------------------------------------------------

	@JRThrashConvertedIntoIPcore(availableNum = 45, latency = 0, throughput = 1,
			 					 outputPName = "", clockEnablePName = "ce", clockPName = "clk", resetPName = "rst", newDataPName = "",
			 					 haveClock = false, haveReset = true, haveNewData = false)
	private double rand(){	//JRThrashConvertedIntoIPcore を指定するメソッドは, private で宣言してください
		return Math.random();
	}

	//------------------------------------------------------------------------------------------------------------------------

	public final int[] fieldArray = new int[32];

	public void arrayAccess(int[] X, int[] Y){   }

	public void arrayAccessCall(){
		arrayAccess(fieldArray, fieldArray);	//配列引数に同じ配列を渡さないでください
	}

}