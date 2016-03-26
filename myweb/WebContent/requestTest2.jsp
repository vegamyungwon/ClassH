<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>RequestTest.jsp</h2>
	<h4>사용자IP: <%=request.getRemoteAddr() %></h4><!-- request는 기본객체이고 getRomoteAddr은 사용자의 IP주소를 얻어온다. -->
	<h4>사용자의 접속port: <%=request.getRemotePort() %></h4>
	<h4>사용자의 접속방식:<%=request.getMethod() %></h4>
	<h4>서비스프로토콜:<%=request.getProtocol() %></h4>
	<h4>서버이름:<%=request.getServerName() %></h4>
	<h4>서비스포트:<%=request.getServerPort() %></h4>
	<h4>사용자 접속페이지:<%=request.getRequestURI() %></h4>
	<h4>프로젝트이름:<%=request.getContextPath() %></h4>
</body>

</html>