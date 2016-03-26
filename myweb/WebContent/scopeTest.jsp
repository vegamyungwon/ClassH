<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="stest" class="neco.bean.ScopeTest" scope="session"/>
<jsp:setProperty property="count" name="stest"/>
<h2>scopeTest.jsp</h2>
<h3>현재 count의 값:
<jsp:getProperty property="count" name="stest"/>


</h3>
<a href="scopeTest_ok.jsp">다음페이지로...</a>
</body>
</html>