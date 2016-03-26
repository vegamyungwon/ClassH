<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>paramTest2.jsp</h2>
<%
	String name=request.getParameter("name");
	String age=request.getParameter("age");
%>

<form name="fm" action="paramTest3.jsp">
<input type="hidden" name="name" value="<%=name%>">
<input type="hidden" name="age" value="<%=age%>">

아이디: <input type="text" name="id"><br>
주소: <input type="text" name="addr"><br>
<input type="submit" value="전달">


</form>
</body>
</html>