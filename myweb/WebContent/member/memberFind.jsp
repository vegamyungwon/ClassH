<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<h2>회 원 검 색</h2>
	<form name="memberFind" method="post"> <!-- action="memberFind.jsp"를 안쓰면 파라미터를 자기자신에게 던진다. -->
	<select name="fkey">
		<option value="name">이름</option>
		<option value="id">아이디</option>
	</select>
	<input type="text" name="fvalue">
	<input type="submit" value="검색">
	</form>
	</article>
	
	<article>
	<hr color="blue">
	<%
	if(request.getMethod().equals("GET")){
		%>
		<h3>위 검색란에 검색어를 입력해주세요!</h3>
		<%
	}else{
		%>
		 <jsp:include page="result.jsp"/>
		
		<%
	}
	%>

	<hr color="blue">
	</article>
	
</section>

<%@include file="/footer.jsp" %>
</body>
</html>