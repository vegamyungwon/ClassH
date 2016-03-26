<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
String idck=null;
	Cookie cks2[]=request.getCookies();
	if(cks2!=null){
		for(int i=0;i<cks2.length;i++){
			if(cks2[i].getName().equals("idck")){
				idck=cks2[i].getValue();
			}
		}
	}
	
System.out.println("idck: "+idck);
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
	<article>
	<fieldset>
	<legend>로그인</legend>
	
	<form name="login" action="login_ok.jsp">
	<table>
		<tr>
		<td>아이디</td>
		<td><input type="text" name="id" placeholder="아이디" <%= idck==null?"":"value='"+idck+"'"%>></td>
		</tr>
		
		<tr>
		<td>비밀번호</td>
		<td><input type="password" name="pwd" placeholder="비밀번호"  ></td>
		</tr>
		
		<tfoot>
		<tr>
		<td colspan="2" align="right">
		<input type="checkbox" name="idck" value="on">
		아이디 기억하기
		<input type="submit" value="로그인">
		</td>
		</tr>
		</tfoot>
	</table>
	</form>
	</fieldset>
	</article>
</section>

</body>
</html>