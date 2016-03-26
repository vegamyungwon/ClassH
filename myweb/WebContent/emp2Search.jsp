<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="eDTO" class="neco.emp.EmpDTO"/>
<jsp:setProperty property="*" name="eDTO"/>
<jsp:useBean id="eDAO" class="neco.emp.EmpDAO"/>
<jsp:setProperty property="*" name="eDAO"/>

<%
	int count=eDAO.empSearch(eDTO);
	String msg=count>0?"검색에 성공했습니다.":"검색에 실패했습니다.";
	
%>

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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