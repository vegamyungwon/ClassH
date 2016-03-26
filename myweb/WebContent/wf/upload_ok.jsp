<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<jsp:useBean id="wf" class="neco.wf.WebFolderDAO" scope="session"/>

<%
	String savePath=wf.USERS_HOME+"/"+wf.getCr_path();

	try{
	MultipartRequest mr=
			new MultipartRequest(request,savePath,wf.getFree_size(),"utf-8");
	}catch(Exception e){
		%>
		<script>
		window.alert("업로드시 문제 발생!!");
		window.self.close();
		</script>
		<%
	}

%>
	<script>
	window.alert("파일 올리기 성공");
	opener.location.href="webFolder.jsp?cp=<%=wf.getCr_path()%>";
	window.self.close();
	</script>