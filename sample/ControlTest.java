package net.njlab.sample;
/**
 *  @author Keisuke Koike
 */
public class ControlTest {

	int ret;
	public int controlTest(){



		int i=0, j=0, k=0;
		for(;;i+=1){

			if(i%2==1){
				for(j=0; j<11; j++){

					k=-2;
					while(k<9){
						++k;
						if(k<4 && j<5)
							ret+=32;
						else if(k==-2 || j==10){
							ret+=1000;
						}
						else if(i>10)
							ret += i+k;
						ret += k+j;
					}
					if(j==10)
						break;
					ret++;
				}
			}
			else
				do{
					if(j>5){
						ret += 33;

						switch(j%5){
							case 1: ret+=3; break;
							case 2: ret+=41; break;
							case 3: {		}
							default: ret+=133;
						}
					}
					j++;
				}
				while(j<13);

			if(i>16)
				break;

			if(i%3==0){
				continue;
			}

			ret += 200;
		}
		return ret+1;
	}

}
