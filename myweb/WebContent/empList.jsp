<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<%
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String id="scott";
	String pwd="1234";
	
	Connection conn=DriverManager.getConnection(url,id,pwd);
	String sql="select * from employee order by idx desc";
	PreparedStatement ps=conn.prepareStatement(sql);
	ResultSet rs=ps.executeQuery();



%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<section>
	<article>
		<h2>모든 사원 내역</h2>
		<table summary="사원내역">
			<caption>사원내역</caption>
			<thead>
			<tr>
			<th>사원번호</th>
			<th>사원이름</th>
			<th>E-Mail</th>
			<th>부서</th>
			</tr>
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
			<tr>
			<td colspan="4" align="center">위 목록은 현재 재직중인 사원을 의미합니다.</td>
			</tr>
		</table>
	</article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>