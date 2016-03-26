package neco.wf;
import java.io.*;
public class WebFolderDAO {
	/**사용자 공통공간*/
	public static final String USERS_HOME="C:\\Programing\\JspStudy\\"
			+ ".metadata\\.plugins\\"
			+ "org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\"
			+ "myweb\\wf\\upload"; 
	
	private String user;	//실제 개인사용자 id
	private String cr_path;	//경로저장 변수
	private int total_size, used_size,free_size;	//총용량, 사용용량, 남은용량 저장 변수
	
	public WebFolderDAO(){
		used_size=0;
		free_size=0;
		total_size=1024*1024*10;	//10MB정도의 공간
	}
	
	
	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public String getCr_path() {
		return cr_path;
	}


	public void setCr_path(String cr_path) {
		this.cr_path = cr_path;
	}


	public int getTotal_size() {
		return total_size;
	}


	public void setTotal_size(int total_size) {
		this.total_size = total_size;
	}


	public int getUsed_size() {
		return used_size;
	}


	public void setUsed_size(int used_size) {
		this.used_size = used_size;
	}


	public int getFree_size() {
		return free_size;
	}


	public void setFree_size(int free_size) {
		this.free_size = free_size;
	}


	public boolean userFolderExists(){
		File f=new File(USERS_HOME+"/"+user);
		if(f.exists()){
			used_size=0;
			getSettingSize(f);
			free_size=total_size-used_size;
			return true;
			
		}else{
			return false;
		}
		
	}
	
	public void getSettingSize(File f){				//메소드는 LIFO Last in First out /Stack 형식이다.
		File files[]=f.listFiles();
		for(int i=0;i<files.length;i++){
			if(files[i].isFile()){
				used_size+=files[i].length();
			}else{
				getSettingSize(files[i]);
			}
		}
	}
	
	
}
