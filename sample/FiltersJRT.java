package net.njlab.sample;

public class FiltersJRT {

	final FixedFilterThread filter0 = new FixedFilterThread();
	final FixedFilterThread filter1 = new FixedFilterThread();
	final FixedFilterThread filter2 = new FixedFilterThread();
	final FixedFilterThread filter3 = new FixedFilterThread();
	final FixedFilterThread filter4 = new FixedFilterThread();
	final FixedFilterThread filter5 = new FixedFilterThread();
	final FixedFilterThread filter6 = new FixedFilterThread();
	final FixedFilterThread filter7 = new FixedFilterThread();
	final FixedFilterThread filter8 = new FixedFilterThread();
	final FixedFilterThread filter9 = new FixedFilterThread();
	final FixedFilterThread filter10 = new FixedFilterThread();
	final FixedFilterThread filter11 = new FixedFilterThread();
	final FixedFilterThread filter12 = new FixedFilterThread();
	final FixedFilterThread filter13 = new FixedFilterThread();
	final FixedFilterThread filter14 = new FixedFilterThread();
	final FixedFilterThread filter15 = new FixedFilterThread();

	void main(){

		filter0.start();
		filter1.start();
		filter2.start();
		filter3.start();
		filter4.start();
		filter5.start();
		filter6.start();
		filter7.start();
		filter8.start();
		filter9.start();
		filter10.start();
		filter11.start();
		filter12.start();
		filter13.start();
		filter14.start();
		filter15.start();

		try{
			filter0.join();
			filter1.join();
			filter2.join();
			filter3.join();
			filter4.join();
			filter5.join();
			filter6.join();
			filter7.join();
			filter8.join();
			filter9.join();
			filter10.join();
			filter11.join();
			filter12.join();
			filter13.join();
			filter14.join();
			filter15.join();
		}catch(Exception e){}
	}

}
