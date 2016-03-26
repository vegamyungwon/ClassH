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
<script ></script>
<script>
function newfolder(){
	window.open('newFolder.jsp',newfolder,"width=400, height=150");
	
}

function openUpload(){
	window.open('upload.jsp','upload','width=350,height=200')
	
}
</script>
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
		
		String cp=request.getParameter("cp");
		if(cp==null||cp.equals("")){
			cp=wf.getUser();
		}
		wf.setCr_path(cp);
		
		%>
		<fieldset>
			<legend>기본정보</legend>
				<ul id="userinfo">
				<li><label>총용량:</label><meter value="<%=wf.getTotal_size()%>" min="0" max="<%=wf.getTotal_size()%>"></meter></li>
				<li><label>사용용량:</label><meter value="<%=wf.getUsed_size() %>" min="0" max="<%=wf.getTotal_size()%>"></meter></li>
				<li><label>남은용량:</label><meter value="<%=wf.getFree_size() %>" min="0" max="<%=wf.getTotal_size()%>"></meter></li>
				
				</ul>
				
				<p>
				<input type="button" value="파일올리기" onclick="openUpload()">
				<input type="button" value="폴더만들기" onclick="newfolder()">
				</p>
		</fieldset>
	</article>
	<br>	
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
				File f=new File(wf.USERS_HOME+"/"+wf.getCr_path());
				File files[]=f.listFiles();
				
				if(!wf.getCr_path().equals(wf.getUser())){
					int lastIndex=wf.getCr_path().lastIndexOf("/");
					String up_path=wf.getCr_path().substring(0,lastIndex);
				%>
						<tr>
						<td colspan="3" align="left">
						<a href="webFolder.jsp?cp=<%=up_path%>">[상위로....]</a>
						</td>
						</tr>
				<%
				}
				%>
				
				
				<%
				if(files==null||files.length==0){
					%>
					<tr>
						<td colspan="3" align="center">
						등록된 파일 및 폴더가 없습니다.
						</td>
					</tr>
					<%
				}else{
					for(int i=0;i<files.length;i++){
						%>
						<tr>
							<td><%=files[i].isFile()?"[FILE]":"[DIR]" %></td>
							<td>
							<%
								if(files[i].isFile()){
									%>
									<a href="/myweb/wf/upload/<%=wf.getCr_path()%>/<%=files[i].getName()%>"><%=files[i].getName() %></a>
									<%
									
								}else{ 
								%>
									<a href="webFolder.jsp?cp=<%=wf.getCr_path()%>/<%=files[i].getName()%>"><%=files[i].getName() %></a>
								<%
								}
							%>
							</td>
							<td><a href="webFolderDel.jsp?cp=<%=files[i].getName()%>">삭제</a></td>
						</tr>
						<%
					}
					
				}
			
			
			%>
			
			
	 		</tbody>
	 		</table>
	 		</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>