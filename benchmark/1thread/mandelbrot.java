public class mandelbrot {

	private float mandelbrot(float a,float b){
		float x = 0.0f;
		float y = 0.0f;
		float x1, y1;

		int n;

		for(n = 0; n < 100; n++){
			x1 = x*x-y*y+a;
			y1 = 2.0f*x*y+b; 
			if(x1*x1+y1*y1>4.0) return n;//発散

			x = x1;
			y = y1;
		}
		return 0;
	}	


	//public static void main(String[] args){
	public void run(){
		float a,b;

		float C0r = -0.743f;
		float C0i =  0.1145f;
		float VS  =  0.003f;
		int STEP   = 800;
		float result;



		for(a = C0r-VS; a<C0r+VS; a+=2.0f*VS/STEP){
			for(b = C0i-VS; b<C0i+VS; b+=2.0f*VS/STEP){
				//System.out.print(a+" "+b+" "+mandelbrot(a,b)+"\n");
				mandelbrot(a,b);
			}
			//System.out.println();
		} 	
	}
}
