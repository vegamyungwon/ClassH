<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="neco.emp.*" %>
<jsp:useBean id="eDTO" class="neco.emp.EmpDTO"></jsp:useBean>
<jsp:setProperty property="*" name="eDTO"/>
<jsp:useBean id="eDAO" class="neco.emp.EmpDAO"></jsp:useBean>


<%
	int result=eDAO.empUpdate_ok(eDTO);
	String msg=result>0?"수정에 성공했습니다.":"수정에 실패했습니다.";
%>

<script>
window.alert("<%=msg%>");
location.href="emp2.jsp";

</script>