<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="neco.wf.WebFolderDAO" scope="session"/>
<%@ page import="java.io.*" %>
<%
	String del=request.getParameter("cp");
	String delPath=wf.USERS_HOME+"/"+wf.getCr_path()+"/"+del;
	System.out.println("webFoderDel.delPath: "+delPath);
	File f=new File(delPath);
	boolean result=f.delete();
%>
<script>
if(<%=result%>){
	window.alert("삭제에 성공했습니다.");
	location.href="webFolder.jsp?cp=<%=wf.getCr_path()%>";	
}else{
	window.alert("하위 폴더에 내용이 있습니다. 확인해 주세요.");
	location.href="webFolder.jsp?cp=<%=wf.getCr_path()%>";	
	
}

</script>