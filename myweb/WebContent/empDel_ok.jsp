<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
	String name=request.getParameter("name_del");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String id="scott";
	String pwd="1234";
	Connection conn=DriverManager.getConnection(url,id,pwd);
	
	String sql="delete from employee where name=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	
	ps.setString(1, name);
	
	int count=ps.executeUpdate();
	
	if(count>0){
		%>
		<script>
	window.alert("삭제에 성공했습니다.");
	location.href="emp.jsp";
	</script>
		<%
	}else if(count<=0){
		%>
		<script>
	window.alert("삭제에 실패했습니다.");
	location.href="emp.jsp";
	</script>
		<%
	}
	



%>
