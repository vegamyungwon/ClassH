<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	function show(){
		<%
			int kor,eng,math;
			try{
				kor=Integer.parseInt(request.getParameter("kor"));
				eng=Integer.parseInt(request.getParameter("eng"));
				math=Integer.parseInt(request.getParameter("math"));
				%>
	window.alert(<%=kor%>);
				<%
				
			}catch(Exception e){
								
			}
		%>
		
	}
	</script>
</head>
<body>

<table border="1">
	<form name="fm">
		<tr>
		<th>국어</th>
		<td><input type="text" name="kor"></td>
		</tr>
		<tr>
		<th>영어</th>
		<td><input type="text" name="eng"></td>
		</tr>
		<tr>
		<th>수학</th>
		<td><input type="text" name="math"></td>
		</tr>
		<tr>
		<td colspan="3" align="center"><input type="submit" value="확인하기" onclick="show()"></td>
		</tr>
	</form>
</table>
</body>
</html>