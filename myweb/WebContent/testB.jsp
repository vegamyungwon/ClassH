<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>안녕하세요</title>
</head>
<body>
	<h2>이것은 HTML문서입니다.</h2>
	<%
	//400대 언어는 클라이언트쪽 언어
	//500대 언어는 서버쪽언어
	/*여러줄 주석*/
	/**문서화 주석*/
	System.out.println("이것은 자바코드에서 출력한 문장!");
	
	//out : jsp 제공되는 기본객체 출력을 담당
	out.println("<h2>이것도 자바코드에서 출력한 문장!</h2>");
	
	String str="java";
	
	out.println("<h2>str="+str+"</h2>");
	%>
	
	<h2>str=<%=str %></h2>
	<%System.out.println(this.str); %>
	
	<%!
		String str="jsp";//멤버변수
		public int getMaxNum(int a, int b){
			return a>b?a:b;	
		}
	%>
	
	<%
		out.println("<h2>str="+this.str+"</h2>");
		out.println("<h2>10과 5중에 큰수:"+getMaxNum(10,5)+"</h2>");
		
		Calendar now=Calendar.getInstance();
		int year=now.get(Calendar.YEAR);
		int month=now.get(Calendar.MONTH)+1;
		int day=now.get(Calendar.DATE);
		
		out.println("<h2>"+year+"년 "+month+"월 "+day+"일</h2>");
	%>
</body>
</html>