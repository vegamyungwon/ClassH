package neco.emp;
import java.sql.*;
import java.util.*;

public class EmpDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public EmpDAO(){
		System.out.println("EmpDAO생성자 호출됨!");
		dbConnect();
	}
	
	public  void dbConnect(){
		try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="scott";
		String pwd="1234";
		conn=DriverManager.getConnection(url,user,pwd);
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	/**사원 등록관련 매소드*/
	//public 어디든 들어오게, int는 실행횟수 반환 count, try catch finally
	public int empAdd(EmpDTO dto){
		try {
			String sql="insert into employee values(employee_idx.nextval, ?, ?, ?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		
		}finally{
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
	
	
	public int empDel(EmpDTO dto){
		try {
			String sql="delete from employee where name=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			return ps.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
			
		} finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	/**사원 모두 보기 관련 메서드*/
	public EmpDTO[] empList(){
		try{
			String sql="select * from employee order by idx";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			Vector<EmpDTO> v=new Vector<EmpDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String dept=rs.getString("dept");
				
				EmpDTO dto=new EmpDTO(idx, name, email, dept);
				v.add(dto);
			}
			EmpDTO dtos[]=new EmpDTO[v.size()];
			v.copyInto(dtos);	//같은 벡터이면 복사가능
			return dtos;
			
		}catch(Exception e){
			e.printStackTrace();
			return null;
			
		}finally{
			try{
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e2){}
		}
	}
	
	/**사원 번호로 불러오기*/
	public EmpDTO[] empUpdate(EmpDTO dto){
		try {
			String sql="select * from employee where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getIdx());
			ps.executeUpdate();
			rs=ps.executeQuery();
			
			Vector<EmpDTO> v=new Vector<EmpDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String dept=rs.getString("dept");
					
				EmpDTO dtoupdate=new EmpDTO(idx, name, email, dept);
				v.add(dtoupdate);
			}
			
			EmpDTO dtoidx[]=new EmpDTO[v.size()];
			v.copyInto(dtoidx);
			return dtoidx;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally{
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
			
		}
	}
	
	public int empUpdate_ok(EmpDTO dto){
		try {
			String sql="update employee set name=?,email=?,dept=? where idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getDept());
			ps.setInt(4, dto.getIdx());
			
			return ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		} finally {
			try {
				ps.close();
				conn.close();
			} catch (Exception e2) {}
		}
	}
	
	public EmpDTO[] empSearch(EmpDTO dto){
		try {
			String sql="select * from employee where name=? order by idx";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.executeUpdate();
			rs=ps.executeQuery();
			
			Vector<EmpDTO> v=new Vector<EmpDTO>();
			while(rs.next()){
				int idx=rs.getInt("idx");
				String name=rs.getString("name");
				String email=rs.getString("email");
				String dept=rs.getString("dept");
				
				EmpDTO dtos=new EmpDTO(idx, name, email, dept);
				v.add(dtos);
			}
			
			EmpDTO dtos[]=new EmpDTO[v.size()];
			v.copyInto(dtos);
			return dtos;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				rs.close();
				ps.close();
				conn.close();
			} catch (Exception e2) {}
			
		}
		
	}
	
}
	


