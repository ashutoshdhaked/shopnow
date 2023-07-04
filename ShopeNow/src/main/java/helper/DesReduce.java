package helper;

public class DesReduce {

	public static String get10Words(String desc) {
		String res=" ";
		String []str = desc.split(" ");
		if(str.length>10) {
			for(int i=0;i<10;i++) {
				res=res+str[i]+" ";
			}
			return res;
		}
		else {
		
			return desc;
		}
	}
}
