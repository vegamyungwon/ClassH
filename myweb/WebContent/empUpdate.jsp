<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%@ page import="java.sql.*" %>
<%
	String name="";
	String email="";
	String dept="";
	String idx=request.getParameter("empupdate");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pwd="1234";
	Connection conn=DriverManager.getConnection(url,user,pwd);
	String sql="select * from employee where idx=?";
	
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, idx);
	int count=ps.executeUpdate();
	ResultSet rs=ps.executeQuery();
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
	<%
	if (count==0){
		%>
		<script>
		window.alert("등록된 사원이 없습니다.");
		location.href="emp.jsp";
		</script>
		
		<%
	}else{
		rs.next();
		name=rs.getString("name");
		email=rs.getString("email");
		dept=rs.getString("dept");
	}
%>

</head>
<body>
<%@include file="header.jsp" %>
<form name="empUpdate_ok" action="empUpdate_ok.jsp" value="<%=idx%>">
<table summary="사원수정">
<caption>사원수정</caption>

	<tr>
	<th>사원번호</th>
	<td align="center"><input type="hidden" name="idx_s" value="<%=idx%>"><%=idx %>번 사원</td>
	</tr>
	
	
	<tr>
	<th>이름</th>
	<td><input type="text" name="name" size="20" value="<%=name%>"></td>
	</tr>
	
	<tr>
	<th>E-Mail</th>
	<td><input type="text" name="email" size="20" value="<%=email%>"></td>
	</tr>
	
	<tr>
	<th>부서</th>
	<td><input type="text" name="dept" size="20" value="<%=dept%>"></td>
	</tr>
	
	<tr>
	<td colspan="4" align="center"><input type="submit" value="수정하기"></td>	
	</tr>
	
</table>

</form>


<%@include file="footer.jsp" %>
</body>
</html>