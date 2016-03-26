<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="neco.emp.*" %>
<jsp:useBean id="eDTO" class="neco.emp.EmpDTO"/>
<jsp:setProperty property="*" name="eDTO"/>
<jsp:useBean id="eDAO" class="neco.emp.EmpDAO"/>
<%
	EmpDTO dtoidx[]=eDAO.empUpdate(eDTO);
	String idx_s=request.getParameter("idx");
	if(idx_s==null||idx_s.equals("")){
		idx_s="0";
	}

	if(dtoidx==null||dtoidx.length==0||idx_s=="0"){
		%>
		<script>
		window.alert("없어요");
		
		</script>
		<%
	}
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>


<%@include file="header.jsp"%>
<form name="empUpdate_ok" action="empUpdate2_ok.jsp">
<table summary="사원수정">

<caption>사원수정</caption>

	<tr>
	<th>사원번호</th>
	<td align="center"><input type="hidden" name="idx" value="<%=dtoidx[0].getIdx()%>">
	<%=dtoidx[0].getIdx()%>번 사원</td>
	</tr>
	
	<tr>
	<th>이름</th>
	<td><input type="text" name="name" size="20" value="<%=dtoidx[0].getName()%>"></td>
	</tr>
	
	<tr>
	<th>E-Mail</th>
	<td><input type="text" name="email" size="20" value="<%=dtoidx[0].getEmail()%>"></td>
	</tr>
	
	<tr>
	<th>부서</th>
	<td><input type="text" name="dept" size="20" value="<%=dtoidx[0].getDept()%>"></td>
	</tr>
	
	<tr>
	<td colspan="4" align="center"><input type="submit" value="수정하기"></td>	
	</tr>
	</table>

</form>
<%@include file="footer.jsp" %>
</body>
</html>