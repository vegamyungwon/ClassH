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
		<h2>사원 관리 프로그램</h2>
		<form name="empAdd" action="empAdd_ok.jsp">
		<fieldset>
			<legend>사원등록</legend>
				<table>
				<tr>
					<th>이름</th>
					<td><input type="text" name="name"></td>
				</tr>
				
				<tr>
					<th>이메일</th>
					<td><input type="text" name="email"></td>
				</tr>
				
				<tr>
					<th>부서</th>
					<td><input type="text" name="dept"></td> 
				</tr>
				
				<tr>
					<td colspan="2"><input type="submit" value="사원등록">
					<input type="reset" value="다시작성">
					</td>
				</tr>
				</table>
		</fieldset>
		</form>
		<form name="empDel" action="empDel_ok.jsp">
		<fieldset>
		<legend>사원삭제</legend>
			<table>
			<tr>
			<th>이름</th>
			<td><input type="text" name="name_del"><input type="submit" value="삭제하기"></td>
			</tr>
			</table>
		</fieldset>
		</form>
		<a href="empList.jsp">모든사원 보기</a>
		
		<fieldset>
			<legend>사원검색</legend>
			<form name="empSearch" action="empSearch.jsp">
			이름 <input type="text" name="empsearch">
			<input type="submit" value="검색하기">
			</form>
		</fieldset>
		
		<fieldset>
			<legend>사원수정</legend>
			<form name="empupdate" action="empUpdate.jsp">
			사원번호 <input type="text" name="empupdate">
			<input type="submit" value="수정하기">
			</form>
		</fieldset>
	</article>
</section>

<%@include file="footer.jsp" %>
</body>
</html>