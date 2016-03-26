<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="neco.member.*" %>
<jsp:useBean id="mDTO" class="neco.member.MemberDTO"/>    
<jsp:setProperty property="id" name="mDTO"/>
<jsp:useBean id="mDAO" class="neco.member.MemberDAO"/>
<%
	Boolean check=mDAO.idCheck(mDTO);
	String msg=check?"사용가능한 아이디입니다.":"사용불가능한 아이디입니다.";
	
%>.
<script>
if (<%=check%> == true){
	opener.document.join.id.value="<%=mDTO.getId()%>";
	window.alert("<%=msg%>");
	window.close();
}else if(<%=check%> == false){
	window.alert("<%=msg%>");
	location.href="idCheck.jsp";
}


</script>
