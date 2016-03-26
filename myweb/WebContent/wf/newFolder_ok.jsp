<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="neco.wf.WebFolderDAO" scope="session"/>
<%@ page import="java.io.*" %>

<%
	String newPath=request.getParameter("newfolder");
	String userPath=wf.USERS_HOME+"/"+wf.getCr_path()+"/"+newPath;
	File newfolder=new File(userPath);
	newfolder.mkdir();
%>

<script>
opener.location.href="webFolder.jsp?cp=<%=wf.getCr_path()%>";
window.self.close();
</script>