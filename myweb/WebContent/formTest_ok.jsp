<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">

</head>
<body>
<%@include file="header.jsp" %>
	<article>
		<h2>넘어온 폼 데이터들...</h2>
		<%
			String name=request.getParameter("name");
			String pwd=request.getParameter("pwd");
			String se=request.getParameter("se");
			String cbs[]=request.getParameterValues("cb");
			
			
		%>
		
		<h4>넘어온 이름값:<%=name%></h4>
		<h4>넘어온 비밀번호:<%=pwd %></h4>
		<h4>넘어온 성별:<%=se %></h4>
		<h4>넘어온 취미값:
		<%
		//취미가 없다면  nullpointexception이 걸리므로 유효성 검사가 필수다
		if(cbs==null||cbs.length==0){
			out.println("선택하신 취미가 없습니다.");
			
		}else{
			for(int i=0;i<cbs.length;i++){
				out.print(cbs[i]+" ");
			}
		}
		%>		
		</h4>
	</article>
<%@include file="footer.jsp" %>
</body>
</html>