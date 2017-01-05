public class fifoa2b{
	private final int [] buffer = new int [10];
	int front=0;
	int rear=0;
	boolean is_finished = false;

	public void is_finished(boolean in_finished){
		if(in_finished==true) is_finished = true;
	}
	
	public boolean check_finished(){
		return is_finished;
	}

	public void enque(int n_in){
		buffer[rear]=n_in;
		rear++;
	}

	public int deque(){
		int n_out;
		n_out = buffer[front];
		front ++;
		return n_out;
	}
}
