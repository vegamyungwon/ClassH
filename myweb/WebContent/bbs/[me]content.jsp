
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="neco.bbs.*" %>
<jsp:useBean id="bDAO" class="neco.bbs.BbsDAO"></jsp:useBean>

<%
	System.out.println("content_idx: "+request.getParameter("idx"));
	String idx=request.getParameter("idx");
	String user_page=request.getParameter("page");
	ArrayList<BbsDTO> content=bDAO.bbsContent(request.getParameter("idx"));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	width: 550px;
	border-spacing: 0px;
	border-top:2px double blue;
	border-bottom: 2px double blue;
	margin:0px auto;

}
table thead th{
	background: skyblue;
}
table tbody td{
	text-align:center;
}
table tfoot td{
	text-align:right;
	padding-right:10px;
}
</style>
</head>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css"></head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<table>
	<thead>
	<tr>
	<th>글번호</th>
	<th>제목</th>
	<th>작성자</th>
	<th>조회수</th>
	<th>작성일</th>
	</tr>
	</thead>
	
	<tbody>
	<tr>
	<td><%=content.get(0).getIdx() %></td>
	<td><%=content.get(0).getSubject()%></td>
	<td><%=content.get(0).getWriter()%></td>
	<td><%=content.get(0).getReadnum()%></td>
	<td><%=content.get(0).getWritedate()%></td>
	</tr>
	<tr>
	<td colspan="5">
	<textarea name="content" rows="15" cols="75" readonly><%=content.get(0).getContent()%></textarea>
	</td>
	</tr>
	</tbody>
	
	<tfoot>
	<tr>
	<td colspan="5">
	
	<input type="button" value="목록으로" style="WIDTH: 400pt; HEIGHT: 30pt" 
	onclick="javascript:location.href='list.jsp?page=<%=user_page%>'">
	
	</td>
	</tr>
	</tfoot>	

	</table>
	</article>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>