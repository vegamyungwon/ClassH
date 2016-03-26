package neco.bbs;
import java.sql.*;
import java.util.*;
import java.util.Date;

public class me_BbsDAO {
	ResultSet rs;
	PreparedStatement ps;
	Connection conn;
	
	public static final int NOT_NAME=2;
	public static final int NOT_PWD=3;
	public static final int NOT_SUBJECT=4;
	public static final int NOT_CONTENT=5;
	public static final int SUCCESS=1;
	public static final int ERROR=-1;
	
	public int bbsWrite(me_BbsDTO dto){
		try {
			conn=neco.db.NecoDB.getConn();
			String sql="insert into JSP_BBS values(JSP_BBS_idx.nextval,?,?,?,?,sysdate,0,0,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getSubject());
			ps.setString(4, dto.getContent());
			ps.executeUpdate();
			
			
			return SUCCESS;
			
		} catch (Exception e) {
			e.printStackTrace();
			return ERROR;
		
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
		
	}
	
	/**BBS 리스트*/
	public ArrayList<me_BbsDTO> bbsList(ArrayList<Integer> arr1){
		try {
			
			conn=neco.db.NecoDB.getConn();
			System.out.println("Min: "+arr1.get(arr1.size()-1));
			System.out.println("Max: "+arr1.get(0));
			System.out.println("Size: "+arr1.size());
			String sql="select * from jsp_bbs where idx>="+arr1.get(arr1.size()-1)+" and idx<="+arr1.get(0)+" order by idx desc";
			System.out.println(sql);
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int idx=0;
			String writer="";
			String pwd="";
			String subject="";
			String content="";
			int readnum=0;
			int ref=0;
			int lev=0;
			int sunbun=0;
			
			ArrayList<me_BbsDTO> list=new ArrayList<me_BbsDTO>();
			
			for(int i=0;i<arr1.size();i++){
				if(rs.next()){
				idx=rs.getInt("idx");
				writer=rs.getString("writer");
				pwd=rs.getString("pwd");
				subject=rs.getString("subject");
				content=rs.getString("content");
				Date writedate=rs.getDate("writedate");
				readnum=rs.getInt("readnum");
				ref=rs.getInt("ref");
				lev=rs.getInt("lev");
				sunbun=rs.getInt("sunbun");
				
				me_BbsDTO dto=new me_BbsDTO(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
				list.add(dto);
				}
			}
			
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				
			} catch (Exception e2) {}
			
		}
		
	}
	
	/**최대 IDX얻어오기*/
	public ArrayList<Integer> pageIdx(){
		try {
			conn=neco.db.NecoDB.getConn();
			String sql="select idx from jsp_bbs order by idx desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			ArrayList<Integer> arrIdx=new ArrayList<Integer>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				arrIdx.add(idx);
			}
			
			
			return arrIdx;
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
	
	public ArrayList<me_BbsDTO> bbsContent(String user_idx){
		try {
			conn=neco.db.NecoDB.getConn();
			String sql="select * from jsp_bbs where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, user_idx);
			ps.executeUpdate();
			rs=ps.executeQuery();
			
			int idx=0;
			String writer="";
			String pwd="";
			String subject="";
			String content="";
			int readnum=0;
			int ref=0;
			int lev=0;
			int sunbun=0;
			
			ArrayList<me_BbsDTO> arr=new ArrayList<me_BbsDTO>();
			if(rs.next()){
				idx=rs.getInt("idx");
				writer=rs.getString("writer");
				pwd=rs.getString("pwd");
				subject=rs.getString("subject");
				content=rs.getString("content");
				Date writedate=rs.getDate("writedate");
				readnum=rs.getInt("readnum");
				ref=rs.getInt("ref");
				lev=rs.getInt("lev");
				sunbun=rs.getInt("sunbun");
				
				me_BbsDTO dto=new me_BbsDTO(idx, writer, pwd, subject, content, writedate, readnum, ref, lev, sunbun);
				arr.add(dto);
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
				
				conn=neco.db.NecoDB.getConn();
				String read="update jsp_bbs set readnum = readnum+1 where idx=?";
				ps=conn.prepareStatement(read);
				ps.setString(1, user_idx);
				ps.executeUpdate();
			}
			
			
			return arr;
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
	
	
	public void function(){
		try {
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			
		} finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
			
			
		}
		
	}
	
}
