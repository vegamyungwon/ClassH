<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
<%
session.invalidate();
%>

function logout(){
opener.location.reload()
window.close()
}
</script>
</head>
<body onload='logout()'>
</body>
</html>