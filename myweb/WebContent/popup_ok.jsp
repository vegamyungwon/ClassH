<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String popupck=request.getParameter("popupck");
	if(popupck!=null&&popupck.equals("on")){
		Cookie ck=new Cookie("popupck","on");
		ck.setMaxAge(60*60*24);
		response.addCookie(ck);
	}
	
%>

<script>
window.self.close();

</script>