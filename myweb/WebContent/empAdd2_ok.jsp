<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="eDTO" class="neco.emp.EmpDTO"/>
<jsp:setProperty property="*" name="eDTO"/>
<jsp:useBean id="eDAO" class="neco.emp.EmpDAO"/>
<%
	int result=eDAO.empAdd(eDTO);
	//_ok는 징검다리역할
	
	String msg=result>0?"사원등록성공(Beans)":"사원등록실패(Beans)";
	
%>

<script>
window.alert("<%=msg%>");
location.href="emp2.jsp";

</script>