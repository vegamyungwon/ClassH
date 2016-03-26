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
<h2>scopeTest_ok.jsp</h2>
<h3>현재 count의 값:
<jsp:getProperty property="count" name="stest"/>
</h3>

<a href="scopeTest.jsp">이전페이지로...</a>
</body>
</body>
</html>