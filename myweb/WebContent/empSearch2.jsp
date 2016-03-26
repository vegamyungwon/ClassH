<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="neco.emp.*" %>
<jsp:useBean id="eDTO" class="neco.emp.EmpDTO"></jsp:useBean>
<jsp:setProperty property="*" name="eDTO"/>
<jsp:useBean id="eDAO" class="neco.emp.EmpDAO"></jsp:useBean>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
<%@include file="header.jsp" %>

	<section>
		<article>
			<h2>모든 사원 내역</h2>		
			<table>
			<thead>
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>이메일</th>
				<th>사원부서</th>
			</tr>
			</thead>
			
			
			<tfoot>
				<tr>
					<td colspan="4">
						현재 근무하고 있는 직원들 목록입니다.
					</td>
				</tr>
			</tfoot>
			<tbody>
			<%
			EmpDTO dtos[]=eDAO.empSearch(eDTO);
			if(dtos==null||dtos.length==0){
				%>
				<tr><td colspan="4" align="center">
				등록된 사원이 없습니다.
				</td>
				</tr>
				<%				
			}else{
				for(int i=0;i<dtos.length;i++){
					%>
					<tr>
						<td><%=dtos[i].getIdx()%></td>
						<td><%=dtos[i].getName()%></td>
						<td><%=dtos[i].getEmail()%></td>
						<td><%=dtos[i].getDept()%></td>
					</tr>
					<%					
				}
			}
			%>
			</tbody>
			</table>
		</article>
	</section>

<%@include file="footer.jsp" %>
</body>
</html>