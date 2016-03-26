package neco.bean;

public class ScopeTest {
	private int count;
	
	public ScopeTest(){
		System.out.println("ScopeTest생성자 호출됨!");
		count=0;
		
	}

	public int getCount() {
		System.out.println("현재 저장된 count값:"+count);
		return count;
	}

	public void setCount(int count) {
		this.count += count;
		System.out.println(count+"값이 추가된 "+this.count+"값이 저장됨");
	}
	
	
}
