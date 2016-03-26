<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.net.*" %>
<%
/*
	Date now=new Date();
	Cookie date=new Cookie("date", now.toString());
	response.addCookie(date);
	
	Cookie cks[]=request.getCookies();
	
	String date_s="첫 방문이십니다.";
	if(cks!=null){
		date_s=cks[cks.length-1].getValue();
	}
	
	
	*/
	
%>
<!-- 

function popup(){

	var url="popup.jsp"
	var today=""
		
	
	if(today=="open"){
	window.open(url,'popup','width=500, height=500');
	}
}
	
function popup2(day){
	if(day=="today_close"){	
	
		ck=new Cookie("savePopup","today_close");
		ck.setMaxAge(60*60*24);
		response.addCookie(ck);
	
	}
}


	/*
	
	
	*/



 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"	
href="css/mainLayout.css"><!--css 불러오는 방법 -->
<script>

function popupOpen(){
	window.open('popup.jsp','popup','width=350,height=400')
	
}




</script>
</head>
<%
	String lastDate="첫 방문이시군요!!";
	String popupck=null;
	Cookie cks2[]=request.getCookies();
	if(cks2!=null){
		for(int i=0;i<cks2.length;i++){
			if(cks2[i].getName().equals("saveDate")){
				lastDate=URLDecoder.decode(cks2[i].getValue());
			}
			if(cks2[i].getName().equals("popupck")){
				popupck=cks2[i].getValue();
			}
		}
	}
	
	String today="open";
	if(cks2!=null){
		for(int i=0;i<cks2.length;i++){
			if(cks2[i].getName().equals("savePopup")&&cks2[i].getValue().equals("today_close")){
				
				today="close";
			}
			
		}
		
	}
	
%>

<%
	Calendar now2=Calendar.getInstance();
	int year=now2.get(Calendar.YEAR);
	int month=now2.get(Calendar.MONTH)+1;
	int day=now2.get(Calendar.DATE);
	String saveDate=year+"년 "+month+"월 "+day+"일";
	saveDate=URLEncoder.encode(saveDate);
	Cookie ck=new Cookie("saveDate", saveDate);
	ck.setMaxAge(60*60*24*30);
	response.addCookie(ck);
	
	%>
<%@include file="header.jsp" %>

<body <%=popupck==null?"onload='popupOpen()'":""%> >		<!-- index로 파일명을 만들면 url 기준이된다. -->
<section>
	<article id="mainImg">	<!-- 컨텐츠 영역(중앙영역) article -->
		<img src="img/main.jpg" alt="이쁜아이유">
	</article>


	<div><%=lastDate%></div>
	
	<article id="mainMenu">
		<h2>여러분 이제부터입니다!</h2>
		<ul>
			<li>앞으로의 수업 내용은 아래에 추가..</li>
			<li><a href="formTest.jsp">form test</a></li>
			<li><a href="cal.jsp">사칙계산기</a></li>
			<li><a href="emp.jsp">사원관리</a></li>
			<li><a href="emp2.jsp">사원관리 프로그램(Beans)</a></li>
			<li><a href="member/memberFind.jsp">회원 검색</a></li>
		
		
			
		</ul>
	</article>
</section>
<%@include file="footer.jsp" %>

</body>
</html>