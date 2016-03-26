<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="neco.bbs.*"%>
<jsp:useBean id="bDTO" class="neco.bbs.BbsDTO"></jsp:useBean>
<jsp:setProperty property="*" name="bDTO"/>
<jsp:useBean id="bDAO" class="neco.bbs.BbsDAO"></jsp:useBean>


<%
	//System.out.println(""+bDTO.getWriter()+bDTO.getPwd()+bDTO.getSubject()+bDTO.getContent());
	int result=bDAO.bbsWrite(bDTO);
	System.out.println("write_ok.result: "+result);

%>

<script>
if(<%=result%>==1){
	window.alert("글쓰기에 성공했습니다.");
	
}else if(<%=result%>==0){
	window.alert("글쓰기에 실패했습니다.");
}

location.href="list.jsp";
</script>