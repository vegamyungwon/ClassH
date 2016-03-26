<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<form name="fm" action="cal_ok.jsp">
	<input type="text" name="num1" size="5">
	<select	name="cal">
		<option value="1">+</option>
		<option value="2">-</option>
		<option value="3">*</option>
		<option value="4">/</option>
	</select>
	<input type="text" name="num2" size="5">
	=
	<input type="submit" value="계산하기">
	<input type="reset" value="다시작성">
	</article>
</form>
</section>
<%@include file="footer.jsp" %>
</body>
</html>