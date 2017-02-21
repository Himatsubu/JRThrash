public class mandelbrot {

	private static double mandelbrot(double a,double b){
		double x = 0.0;
		double y = 0.0;
		double x1, y1;

		int n;

		for(n = 0; n < 100; n++){
			x1 = x*x-y*y+a;
			y1 = 2.0*x*y+b; 
			if(x1*x1+y1*y1>4.0) return n;//発散

			x = x1;
			y = y1;
		}
		return 0;
	}	


	public  static void main(String[] args){
		double a,b;

		double C0r = -0.743;
		double C0i =  0.1145;
		double VS  =  0.003;
		int STEP   = 800;



		for(a = C0r-VS; a<C0r+VS; a+=2.0*VS/STEP){
			for(b = C0i-VS; b<C0i+VS; b+=2.0*VS/STEP){
				System.out.print(a+" "+b+" "+mandelbrot(a,b)+"\n");
			}
			System.out.println();
		} 	
	}
}
