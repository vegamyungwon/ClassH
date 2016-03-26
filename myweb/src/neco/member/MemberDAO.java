package neco.member;
import java.sql.*;
import java.util.ArrayList;
import java.util.Vector;

import javax.sql.*;
import neco.emp.EmpDTO;
import javax.naming.*;

public class MemberDAO {
	ResultSet rs;
	PreparedStatement ps;
	Connection conn;
	
	public static final int NOT_ID=1;
	public static final int NOT_PWD=2;
	public static final int LOGIN_OK=3;
	public static final int ERROR=-1;
	//final은 이 변수를 바꿀수 없게 만든다
	
	/*
	public MemberDAO(){
		
		dbConnect();
	}
	
	public void dbConnect(){
		try {
			Context initContext = new InitialContext();
			Context envContext  = (Context)initContext.lookup("java:/comp/env");
			DataSource ds = (DataSource)envContext.lookup("jdbc/myoracle");
			conn = ds.getConnection();
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url="jdbc:oracle:thin:@localhost:1521:orcl";
			String user="scott";
			String pwd="1234";
			conn=DriverManager.getConnection(url,user,pwd);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	
	
	}
	
	*/
	
	
	
	public Boolean idCheck(MemberDTO dto){
		try {
			conn=neco.db.NecoDB.getConn();
			String sql="select * from JSP_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.executeUpdate();
			rs=ps.executeQuery();
			
			Boolean check;
			String id="";
			while(rs.next()){
				id=rs.getString("id");
				
			}
			if(id==null||id.equals("")){
				check=true;
			}else{
				check=false;
				
			}

			return check;
		} catch (Exception e) {

			return false;
		} finally {
			try {
				
			} catch (Exception e2) {}
			
			
		}
		
	}
	
	
	public int idJoin(MemberDTO dto){
		try {
			conn=neco.db.NecoDB.getConn();
			String sql="insert into JSP_member values(JSP_member_idx.nextval,?,?,?,?,?,sysdate)";
			//name, id, pwd, email, addr
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getPwd());
			ps.setString(4, dto.getEmail());
			ps.setString(5, dto.getAddr());
			int count = ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally{
			try {
				
				
			} catch (Exception e2) {}
			
		}
		
		
	}
	
	public MemberDTO[] memberSearch(MemberDTO dto){
		try {
			conn=neco.db.NecoDB.getConn();
			String sql="select * from JSP_member where name=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.executeUpdate();
			rs=ps.executeQuery();
			
			Vector<MemberDTO> v=new Vector<MemberDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String addr=rs.getString("addr");
				Date date=rs.getDate("joindate");
				
				MemberDTO dtos=new MemberDTO(idx, name, id, pwd, email, addr, date);
				v.add(dtos);
			}
			
			MemberDTO dtos[]=new MemberDTO[v.size()];
			v.copyInto(dtos);
			return dtos;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
			} catch (Exception e2) {}
			
		}
		
	}
	
	
	/**회원 검색 관련 메소드*/
	public ArrayList<MemberDTO> memberFind(String fkey,String fvalue){
		try {
			conn=neco.db.NecoDB.getConn();
			String sql="select * from jsp_member where "+fkey+"=?";	//?는 value에서만 사용이 가능하다
			ps=conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			rs=ps.executeQuery();
			ArrayList<MemberDTO> arr=new ArrayList<MemberDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String name=rs.getString("name");
				String id=rs.getString("id");
				String pwd=rs.getString("pwd");
				String email=rs.getString("email");
				String addr=rs.getString("addr");
				java.sql.Date joindate=rs.getDate("joindate");	//Date클래스는 util과 sql이 있기떄문에 표현을 해주는게 좋다.
				
				MemberDTO dto=new MemberDTO(idx, name, id, pwd, email, addr, joindate);
				arr.add(dto);
			}
			
			return arr;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		
	}
	
	/**로그인 관련 메소드*/
	public int loginCheck(String id_login, String pwd_login){
		try {
			conn=neco.db.NecoDB.getConn();
			String sql="select id,pwd from jsp_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id_login);
			rs=ps.executeQuery();
			
			String id_db=null;
			String pwd_db=null;
			
			while(rs.next()){
				id_db=rs.getString("id");
				pwd_db=rs.getString("pwd");
			}
			System.out.println("MemberDAO.loginCheck(): "+id_db+" "+pwd_db+" "+id_login+" "+pwd_login);
			
			
			int result=-1;
			
			if(!id_login.equals(id_db)){
			//	System.out.println("일치하는 아이디가 없습니다.");
				result=NOT_ID;
			}else if(id_db.equals(id_login)&&!(pwd_db.equals(pwd_login))){
			//	System.out.println("비밀번호가 틀립니다.");
				result=NOT_PWD;
			}else if(id_db.equals(id_login)&&pwd_db.equals(pwd_login)){
			//	System.out.println("ID와 PWD가 일치합니다.");
				result=LOGIN_OK;
			}else{
			//	System.out.println("알수 없는 오류");
				result=ERROR;
			}
			
			/*	1. ID가 없습니다.
			 * 	2. ID가 맞으나 PWD가 맞지 않습니다.
			 * 	3. ID가 있으며 PWD가 일치합니다.
			 * 
			 */
			
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
			} catch (Exception e2) {}
			
		}
	}
	
	public String userGetInfo(String id_login){
		try {
			conn=neco.db.NecoDB.getConn();
			//생성자에 conn을 집어넣으면 안받아와진다.
			String sql="select id,name from jsp_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id_login);
			rs=ps.executeQuery();
			
			String name_db=null;
			
			while(rs.next()){
				name_db=rs.getString("name");
			}
			
			return name_db;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
			
		}
		
		
	}


}
