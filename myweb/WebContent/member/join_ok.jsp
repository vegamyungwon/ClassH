<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="neco.member.*"%>
<jsp:useBean id="mDTO" class="neco.member.MemberDTO"/>
<jsp:setProperty property="*" name="mDTO"/>
<jsp:useBean id="mDAO" class="neco.member.MemberDAO"/>

<%
	int result=mDAO.idJoin(mDTO);
	String msg=result>0?"가입에 성공했습니다.":"가입에 실패했습니다.";

%>

<script>
window.alert("<%=msg%>");
location.href="join.jsp";


</script>