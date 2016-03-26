<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String login_name=(String)session.getAttribute("name");;
%>


 <script>
 function loginOpen(){
	 var url="/myweb/member/login.jsp"
	 window.open(url,'popup', 'width=350, height=250')
	 
 }
 
 function logout(){
	 var url="/myweb/member/logout.jsp"
	 window.open(url,'popup', 'width=350, height=250')
 }
 
</script>   
  
    
<header>	<!-- 머리영역 header, nav 시멘트태그 -->

	

	<p>
	<%=
		login_name==null?
				"<a href='/myweb/member/join.jsp/'>회원가입</a> | <a href='javascript:loginOpen()'>로그인</a>"
				:login_name+"님 환영합니다. | <a href='javascript:logout()'>로그아웃</a>"
	%>
	</p>
	
	<h1>JSP Study Site</h1>
	<nav>	<!-- 제목영역 -->
		<ul>
			<li><a href="/myweb/index.jsp">Home</a></li>	<%//#을 넣어주면 아무 내용 없다. %>
			<li><a href="/myweb/profile.jsp">Profile</a></li>
			<li><a href="/myweb/wf/webFolder.jsp">WebFolder</a></li>
			<li><a href="/myweb/bbs/list.jsp">BBS</a></li>
			<li><a href="#">GuestBook</a></li>
		</ul>
	</nav>
	<hr>
</header>