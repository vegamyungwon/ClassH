<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<%@ page import="java.net.*" %>
<jsp:useBean id="wf" class="neco.wf.WebFolderDAO" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2{
	text-align:center;
}

fieldset{
	width: 500px;
	margin: 0px auto;
}

#userinfo li{
	list-style-type: none;
}

label{
	float: left;
	width: 100px;
	

}

meter{
	width: 200px;
}


</style>
</head>

<%
	String sid2=(String)session.getAttribute("name");
	if(sid2==null||sid2.equals("")){
		%>	
			<script>
			window.alert("로그인후 이용 가능하신 서비스입니다.");
			location.href="/myweb";
			</script>
		<%
		return;
	}
	

%>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
		<h2><%=sid2 %>님 웹 폴더</h2>
		<%
		wf.setUser(sid2);
		if(!wf.userFolderExists()){
			File f=new File(wf.USERS_HOME+"/"+wf.getUser());
			f.mkdir();
			wf.userFolderExists();
		}
		%>
		<fieldset>
			<legend>기본정보</legend>
				<ul id="userinfo">
				<li><label>총용량:</label><meter value="<%=wf.getTotal_size()%>" min="0" max="<%=wf.getTotal_size()%>"></meter></li>
				<li><label>사용용량:</label><meter value="<%=wf.getUsed_size() %>" min="0" max="<%=wf.getTotal_size()%>"></meter></li>
				<li><label>남은용량:</label><meter value="<%=wf.getFree_size() %>" min="0" max="<%=wf.getTotal_size()%>"></meter></li>
				
				</ul>
				
				<p>
				<input type="button" value="파일올리기">
				<input type="button" value="폴더만들기">
				</p>
		</fieldset>
	</article>
	<br>	
	 <jsp:include page="webFolderList.jsp"/>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>