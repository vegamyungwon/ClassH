<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css"> 
<style>
h2{
	text-align: center;
}

table{
	margin: 0px auto;
}
</style>

<script>

function popup(){
	var popup=window.open('idCheck.jsp', 'popup', 'width=400, height=150');
}


</script>
</head>
<body>
<%@include file="../header.jsp" %>
<h2>회원가입</h2>
<section>
	<article>
		<table>
			<form name="join" action="join_ok.jsp">
				<tr>
				<td>ID</td>
				<td><input type="text" name="id" readonly>
				<td><input type="button" name="idcheck" value="중복검사" onclick="popup()"></td>
				</tr>
				
				<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd"></td>
				</tr>
				
				<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				</tr>
				
				<tr>
				<td>E-Mail</td>
				<td><input type="text" name="email"></td>
				</tr>
				
				<tr>
				<td>주소</td>
				<td><input type="text" name="addr"></td>
				</tr>
		
				
				<tr>
				<td colspan="3" align="center"><input type="submit" value="회원가입"></td>
				</tr>
			</form>
		</table>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>