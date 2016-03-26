package neco.member;

import java.util.Date;

public class MemberDTO {
	private int idx;
	private String name;
	private String id;
	private String pwd;
	private String email;
	private String addr;
	private Date joindate;
	public MemberDTO(){
		//System.out.println("DTO생성자 호출됨");
		
	}
	
	public MemberDTO(int idx, String name, String id, String pwd, String email, String addr, Date joindate){
		super();
		this.idx = idx;
		this.name = name;
		this.id = id;
		this.pwd = pwd;
		this.email = email;
		this.addr = addr;
		this.joindate = joindate;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}
	
	
}
