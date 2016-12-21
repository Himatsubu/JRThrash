import net.njlab.sample.annotation.*;

public class sub extends Thread{
	float cs,sc,c,s;
	float a_ik,a_jk,a_ki,a_kj,x_ki,x_kj;

	public void run(){
		cs = c*a_ik + s*a_jk;
		sc = -1.0f*s*a_ik + c*a_jk;
		a_ik = cs;
		a_jk = sc;

		cs = c*a_ki + s*a_kj;
		sc = -1.0f*s*a_ki + c*a_kj;
		a_ki = cs;
		a_kj = sc;
		cs = c*x_ki + s*x_kj;
		sc = -s*x_ki + c*x_kj;
		x_ki = cs;
		x_kj = sc;
	}
