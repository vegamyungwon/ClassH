<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<script>
function asd(){
	window.alert("document.find.find.value()");
}
</script>



</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<fieldset>
		<legend>회원검색</legend>
		<form name="memberSearch" action="memberFind.jsp">
		<select name="find">
		<option value="id">ID </option>
		<option value="name">이름 </option>
		</select>	
		
		이름 <input type="text" name="name">
		<input type="submit" value="검색하기">
		</form>
		</fieldset>
		<hr>
		<jsp:include page="result.jsp"/>
		
		</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>