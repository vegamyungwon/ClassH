
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*" %>
<jsp:useBean id="wf" class="neco.wf.WebFolderDAO" scope="session"/>
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

</style>
</head>
<body>
<table border="1">
<%
	String dir=request.getParameter("name");
	String main_dir=wf.USERS_HOME+"/"+wf.getUser();
	String sid=(String)session.getAttribute("name");
	if(sid==null||sid.equals("")){
		%>	
			<script>
			window.alert("로그인후 이용 가능하신 서비스입니다.");
			location.href="/myweb";
			</script>
		<%
		return;
	}

%>

<article>
	<table summary="탐색기">
			<thead>
				<th>분류</th>
				<th>파일명 / 폴더명</th>
				<th>삭제</th>
				<th>임시</th>
			</thead>
			<tbody>
			
				<%
			
				if(dir==""||dir==null){
					System.out.println("webFolderList.dir: "+dir);
					wf.setUser(sid);
					File f=new File(wf.USERS_HOME+"/"+wf.getUser());
					File files[]=f.listFiles();
					
					for(int i=0;i<files.length;i++){
						
						wf.setCr_path(files[i].toString());
						int index=wf.getCr_path().indexOf("myweb")-1;
						String path=wf.getCr_path().substring(index);
						%>
					
						<tr>
						
						<td><%=files[i].isFile()?"[FILE]":"[DIR]"%></td>
						<%
						if(files[i].isFile()){
						
							%><td><a href="<%=path%>"><%=files[i].getName()%></a></td><%
						}else if(!files[i].isFile()){
							%>
							<td>
							<form name="<%=files[i].getName()%>" method="post">
							<a href='javascript:document.<%=files[i].getName()%>.submit();'><%=files[i].getName()%></a>
							<input type="hidden" value="<%=files[i].toString()%>" name="name">
								</form>
								</td>
							<%
						}
						 %>
					<td>
					<form name="<%=files[i].getName()%>_del" action="webFolderDel.jsp">
					<input type="hidden" name="del" value="<%=files[i].toString()%>">
					<input type="submit" value="삭제">
					</form>
					
					</td>
						</tr>
				
				<%
					}
				}else{
					System.out.println(dir);
					File f=new File(dir);
					File files[]=f.listFiles();
					System.out.println(dir);
					
					%>
					
					<tr>
					<td>[..]</td>
					<form name="<%=f.getName()%>" method="post">
					<td><a href='javascript:document.<%=f.getName()%>.submit();'>[상위폴더로]</a>
					<input type="hidden" value="<%=f.getParent()%>" name="name"></td>
					</form>
					</tr>
					<%
					for(int i=0;i<files.length;i++){
						
						wf.setCr_path(files[i].toString());
						int index=wf.getCr_path().indexOf("myweb")-1;
						String path=wf.getCr_path().substring(index);
						%>
					
						<tr>
						
						<td><%=files[i].isFile()?"[FILE]":"[DIR]"%></td>
						<%
						if(files[i].isFile()){
						
							%><td><a href="<%=path%>"><%=files[i].getName()%></a></td><%
						}else if(!files[i].isFile()){
							%>
							<td>
							<form name="<%=files[i].getName()%>" method="post">
							<a href='javascript:document.<%=files[i].getName()%>.submit();'><%=files[i].getName()%></a>
							<input type="hidden" value="<%=files[i].toString()%>" name="name">
								</form>
								</td>
							<%
						}
						 %>
					<td>
					<form name="<%=files[i].getName()%>_del" action="webFolderDel.jsp">
					<input type="hidden" name="del" value="<%=files[i].toString()%>">
					<input type="submit" value="삭제">
					</form>
					</td>
						</tr>
						<%
					}
				}
			
				%>
		
			</tbody>
	</table>
</article>

</table>
</body>
</html>
