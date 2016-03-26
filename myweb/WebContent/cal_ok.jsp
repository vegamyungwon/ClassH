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
	<%
	try{
	int num1=Integer.parseInt(request.getParameter("num1"));
	int num2=Integer.parseInt(request.getParameter("num2"));
	int cal=Integer.parseInt(request.getParameter("cal"));
	//char cal_c=cal.charAt(0);
	switch(cal){
	case 1:out.println(num1+"+"+num2+"="+(num1+num2));break;
	case 2:out.println(num1+"-"+num2+"="+(num1-num2));break;
	case 3:out.println(num1+"*"+num2+"="+(num1*num2));break;
	case 4:out.println(num1+"/"+num2+"="+(num1/num2));break;
	default:out.println(""+num1+num2+cal);
	}
	
	
	
	}catch(Exception e){
		out.println(e.toString());
		
	}
	
	%>
	
	
	</article>
<%@include file="footer.jsp" %>
</body>
</html>