<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>cookieTest.jsp</h2>
<!-- 쿠키로드 -->
<%
	
	Cookie cks[]=request.getCookies();
	if(cks!=null){
		for(int i=0;i<cks.length;i++){
			String key=cks[i].getName();
			String value=URLDecoder.decode(cks[i].getValue());
			out.println("<h4>KEY: "+key+" / VALUE:"+value+"</h4>");
			
		}
	}

%>

<!-- 쿠키저장 -->
<%
	Cookie ck1=new Cookie("id","hong");
	ck1.setMaxAge(60*3);
	response.addCookie(ck1);
	
	String name="홍길동";
	name=URLEncoder.encode(name);	// 유니코드로 변경
	Cookie ck2=new Cookie("name",name);
	ck2.setMaxAge(60*3);
	response.addCookie(ck2);

%>
<h4>>쿠키저장완료!</h4>

</body>
</html>