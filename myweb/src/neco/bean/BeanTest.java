package neco.bean;

public class BeanTest {
	private String name;
	private int age;
	private String addr;
	private String tel;

	public BeanTest(){
		System.out.println("BeanTest생성자 호출됨!");
		
	}

	public String getName() {
		return name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	
	
}
