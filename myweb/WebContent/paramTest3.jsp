<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>paramTest3.jsp</h2>
<%
	String name=request.getParameter("name");
	String age=request.getParameter("age");
	String id=request.getParameter("id");
	String addr=request.getParameter("addr");

%>

<h4>이름:<%=name %></h4>
<h4>나이:<%=age %></h4>
<h4>아이디:<%=id %></h4>
<h4>주소:<%=addr %></h4>
</body>
</html>