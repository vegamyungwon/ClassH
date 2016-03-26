<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	
href="css/mainLayout.css"><!--css 불러오는 방법 -->
</head>
<%@include file="header.jsp" %>

<body>		<!-- index로 파일명을 만들면 url 기준이된다. -->
<section>
	<article>	<!-- 컨텐츠 영역(중앙영역) article -->
		<table>
			<tr>
			<th>ID</th>
			<td><input type="text" size="15"></td>
			</tr>
			<tr>
			<th>PWD</th>
			<td><input type="password" size="15"></td>
			</tr>
			<tr>
			<td colspan="2"><input type="button" value="가입하기"></td>
			</tr>
		</table>
	</article>
</section>

<%@include file="footer.jsp"%>
</body>
</html>
