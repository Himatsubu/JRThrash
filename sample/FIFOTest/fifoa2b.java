public class fifoa2b{
	private final int [] buffer = new int [10];
	int front=0;
	int rear=0;

	public int enque(int n_in){
		buffer[rear]=n_in;
		rear++;
	}

	public int rear(){
		int n_out;
		n_out = buffer[front];
		front ++;
	}
