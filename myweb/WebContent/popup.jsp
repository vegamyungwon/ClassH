<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
/*
function cl(){
	if(document.fm.op.value=="today_close"){
		opener.popup2(document.fm.op.value)
	}
	
	window.close()
}
*/
</script>
</head>
<body>
<div style="width:250px;height:250px;border:2px solid silver;">
<h2>공지사항</h2>
<h4>1. 지각 및 결석하지 않기</h4> 
<h4>2. 건강을 잘챙기기 </h4>
<h4>3. 복습은 철저히 </h4>
</div>
<form name="fm" action="popup_ok.jsp">
<input type="checkbox" name="popupck" value="on">
오늘 하루 안보기
<input type="submit" value="닫기">
</form>
</body>
</html>