<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="eDTO" class="neco.emp.EmpDTO"></jsp:useBean>
<jsp:setProperty property="*" name="eDTO"/>
<jsp:useBean id="eDAO" class="neco.emp.EmpDAO"></jsp:useBean>
<%
	int count=eDAO.empDel(eDTO);
	String msg=count>0?"사원삭제성공(Beans)":"사원삭제실패(Beans)";


%>

<script>
window.alert("<%=msg%>");
location.href="emp2.jsp";
</script>