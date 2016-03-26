<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function win_close(){
	opener.document.join.id.value=document.idcheck.id.value;
	self.close();
}

</script>


</head>
<body>
	<section>
	<article>
		<table>
		<tr>
		<form name="idcheck" action="idCheck_ok.jsp">
		<td><label for="idCheck">아이디 확인</label></td>
		<td><input type="text" name="id"></td>
		<td><input type="submit" value="중복체크"></td>
		</form>
		</tr>
		
		</table>
	
	</article>
	</section>
</body>
</html>