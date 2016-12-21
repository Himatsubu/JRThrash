import net.njlab.sample.annotation.JRThrashExtToTop;

public class BoolTest{
	@JRThrashExtToTop
	boolean a = true;

	public void run(){
		int i;

		for(i=0;i<100;i++){
			a=false;
			a=true;
		}
	}
}
