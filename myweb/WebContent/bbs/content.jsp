<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="neco.bbs.*" %>
<jsp:useBean id="bDAO" class="neco.bbs.BbsDAO" scope="session"/>
<%

	String idx_s=request.getParameter("idx");
	if(idx_s==null||idx_s.equals("")){
		idx_s="0";
	}
	int idx=Integer.parseInt(idx_s);
	BbsDTO dto=bDAO.bbsContent(idx);
	
	if(dto==null){
		%>
		
		<script>
		window.alert('잘못된 접근 방식입니다.')
		</script>
		
		<%
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/sss" href="../css/mainLayout.css">
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<h2>자유게시판 본문보기</h2>
	<table border="1" cellspacing="0" width="550">
	<tr>
		<th>글번호</th>
		<td><%=dto.getIdx() %></td>
		<th>조회수</th>
		<td><%=dto.getReadnum() %></td>
	</tr>
	<tr>
		<th>작성자</th>
		<td><%=dto.getWriter() %></td>
		<th>작성일자</th>
		<td><%=dto.getWritedate()%></td>
	</tr>
	<tr>
		<th>제목</th>
		<td colspan="3"><%=dto.getSubject() %></td>
	</tr>
	
	<tr height="250">
		<td colspan="4" align="left" valign="top">
		<%=dto.getContent().replaceAll("\n", "<br>") %>
		</td>
	</tr>
	<tr>
		<td colspan="4" align="center">
		<a href="rewrite.jsp?subject=<%=dto.getSubject()%>&ref=<%=dto.getRef()%>&lev=<%=dto.getLev()%>&sunbun=<%=dto.getSunbun()%>">답변쓰기</a> 
		| 목록으로
		</td>
	</tr>
	</table>
	
	</article>
</section>
<%@include file="/footer.jsp" %>

</body>
</html>