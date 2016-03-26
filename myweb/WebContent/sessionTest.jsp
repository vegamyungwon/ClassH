<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>sessionTest.jsp</h2>

<!-- 세션로드 -->
<%
	String id=(String)session.getAttribute("id");


%>
<h3>아이디:<%=id%></h3>
<!-- 세션저장 -->
<%
	session.setAttribute("id", "hong");
	session.setAttribute("name", "홍길동");
%>
</body>
</html>