package neco.emp;

public class EmpDTO {
	private int idx;		//private 외부에서 다이렉트로 접속이 가능하다.
	private String name;
	private String email;
	private String dept;
	
	
	public EmpDTO(){
		//System.out.println("EmpDTO생성자 호출됨!");
	}

	public EmpDTO(int idx, String name, String email, String dept) {
		super();
		this.idx = idx;
		this.name = name;
		this.email = email;
		this.dept = dept;
		//DTO는 정보 클래스 이기때문에 일반적으로 기본생성자와 모든 인자 생성자를 만들어 줘야 한다.
	}



	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getDept() {
		return dept;
	}

	public void setDept(String dept) {
		this.dept = dept;
	}

	
	
	
	
	
}
