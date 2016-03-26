<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="test/css" href="css/mainLayout.css">
</head>
<body>
<%@include file="header.jsp"%>
<section><!-- 이름 비번 성별 취미 -->
	<article>
	<h2>form 데이터 테스트</h2>
	<form name="fm" action="formTest_ok.jsp"> <!-- action 해당 데이터를 누구에게 전달할건지를 사용할 속성 -->
												<!-- 처리페이지의 명명규칙에는 _이름을 붙인다. -->
	<legend>사용자 정보</legend>
	<ul>
		<li>이름: <input type="text" name="name"></li>
		<li>비밀번호: <input type="password" name="pwd"></li>
		<li>
			성별:<input type="radio" name="se" value="남자">남자
			<input type="radio" name="se" value="여자">여자
			<input type="radio" name="se" value="트랜스">트랜스
		</li>
		<li>
			취미: <input type="checkbox" name="cb" value="공부">공부
			<input type="checkbox" name="cb" value="운동">운동
			<input type="checkbox" name="cb" value="독서">독서
			<input type="checkbox" name="cb" value="컴퓨터">컴퓨터
			<input type="checkbox" name="cb" value="연애">연애			
		</li>
	</ul>
	<p>	<!-- p 단락태그 -->
		<input type="submit" value="전달하기"> <!-- submit은 전달속성 -->
		<input type="reset" value="다시작성"> <!-- 리셋속성 -->
	</p>
	</form>
	</article>
	
	
</section>
<%@include file="footer.jsp"%>
</body>
</html>