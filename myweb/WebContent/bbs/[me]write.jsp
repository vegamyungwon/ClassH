<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width: 550px;
	border-spacing: 0px;
	border-top:2px double blue;
	border-bottom: 2px double blue;
	margin:0px auto;

}
table thead th{
	background: skyblue;
}
table tbody td{
	text-align:center;
}
table tfoot td{
	text-align:right;
	padding-right:10px;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css"></head>
<body>
<%@include file="/header.jsp" %>


<section>
	<article>
	<table>
	<form name="write_ok" action="write_ok.jsp">
	<thead>
	<tr>
	<th colspan="4">글쓰기</th>
	</tr>
	</thead>
	
	<tbody>
	<tr>
	<td>이름</td>
	<td><input type="text" name="writer"></td>
	<td>비밀번호</td>
	<td><input type="password" name="pwd"></td>
	</tr>
	
	<tr>
	<td>제목</td>
	<td colspan="3"><input type="text" name="subject" size="63"></td>
	</tr>
	
	<tr>
	<td colspan="4">
	<br>
	<textarea name="content" rows="20" cols="75">안녕하세요</textarea>
	</td> 
	</tr>
	
	</tbody>
	
	<tfoot>
	<tr>
	<td colspan="4">

	<input type="submit" value="글쓰기">
	
	</td>
	</tr>
	</tfoot>
	</form>
	</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>