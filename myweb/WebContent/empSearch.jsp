<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	String search=request.getParameter("empsearch");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pwd="1234";
	
	Connection conn=DriverManager.getConnection(url,user,pwd);
	
	String sql="select * from employee where name=?";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, search);
	int count=ps.executeUpdate();
	ResultSet rs=ps.executeQuery();
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 검색 페이지</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<style>
h2{
	text-align: center;
}
table{
	margin: 0px auto;
	width:550px;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
	border-spacing: 0px;

}
table thead th{
	background: skyblue;
	
}
</style>
</head>
<body>
<%@include file="header.jsp" %>
<h2>사원검색</h2>
	<table summary="사원 검색">
		<caption>사원 검색</caption>
		<thead>
			<th>사원 번호</th>
			<th>사원 이름</th>
			<th>E-Mail</th>
			<th>부서</th>
		</thead>
		<tbody>
		<%
		if(rs.next()){
					do{
						%>
						<tr>
							<td><%=rs.getInt("idx")%></td>
							<td><%=rs.getString("name")%></td>
							<td><%=rs.getString("email")%></td>
							<td><%=rs.getString("dept")%></td>
						</tr>
						<%
					}while(rs.next());
					
				}else{
					%>
						<td colspan="4" align="center">	등록되어있는 사원이 없습니다.	</td>	
					<%
				}
		 %>
		</tbody>
		<tfoot>
		<td colspan="4" align="center">위 목록은 현재 재직중인 사원입니다.</td>
		</tfoot>
	
	
	</table>
<%@include file="footer.jsp" %>
</body>
</html>