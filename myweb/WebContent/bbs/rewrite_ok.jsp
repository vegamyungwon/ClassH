<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bDTO" class="neco.bbs.BbsDTO" scope="page"></jsp:useBean>
<jsp:setProperty property="*" name="bDTO"/>
<jsp:useBean id="bDAO" class="neco.bbs.BbsDAO" scope="session"></jsp:useBean>

<%
	System.out.println("rewrite_ok.ref: "+bDTO.getRef());
	int result=bDAO.bbsReWrite(bDTO);
	String msg=result>0?"글쓰기 성공!":"글쓰기 실패!";


%>
<script>
window.alert("<%=result %>");
location.href="list.jsp";
</script>







