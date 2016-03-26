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
String str="Java";
%>

<h2 style="color:red;">Super.jsp에서 출력한 문장 A</h2>
<jsp:param value="<%=str%>" name="str"/>
<h2 style="color:red;">Super.jsp의 str값:<%=str%></h2>
<h2 style="color:red;">Super.jsp에서 출력한 문장 B</h2>

</body>
</html>