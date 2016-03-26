<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String str2="JSP";
	String str=request.getParameter("str");
	String temp=request.getParameter("temp");
%>
<h2 style="color:blue;">Sub.jsp에서 출력한 문장A</h2>
<h2 style="color:blue;">Sub.jsp에서 str2:<%=str2%></h2>

<h2 style="color:green;">Super.jsp에서 받은</h2>
<h2 style="color:green;">Super.jsp에서 받은 temp의 값:<%=temp %></h2>

<h2 style="color:blue;">Sub.jsp에서 출력한 문장B</h2>
</body>
</html>