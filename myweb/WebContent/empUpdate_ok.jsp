<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%	
	int idx=Integer.parseInt(request.getParameter("idx_s"));
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String dept=request.getParameter("dept");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String id="scott";
	String pwd="1234";
	
	Connection conn=DriverManager.getConnection(url,id,pwd);
	String sql="update employee set name=?, email=?, dept=? where idx=?";
	System.out.println(sql);
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2, email);
	ps.setString(3, dept);
	ps.setInt(4, idx);
	
	int count=ps.executeUpdate();
	
	
	if(count>0){
		%>
		<script>
		window.alert("수정에 성공했습니다.");
		location.href="emp.jsp";
		</script>
		<%
	}else if(count==0){
		%>
		<script>
		window.alert("수정에 실패했습니다.");
		location.href="emp.jsp";
		</script>
		<%
		
	}
%>
