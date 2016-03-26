
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="neco.bbs.*"%>
<%@page import="java.util.*"%>
<%@page import="java.util.Date"%>
<jsp:useBean id="bDAO" class="neco.bbs.BbsDAO"/>
<%
	
	int maxIdx=1;
	int bbspage=1;
	if(request.getParameter("page")!=null){
		bbspage=Integer.parseInt(request.getParameter("page"));	
	}
	ArrayList<Integer> arr=bDAO.pageIdx();
	System.out.println(arr.size());
	ArrayList<Integer> pageArr=new ArrayList<Integer>();
	for(int i=0;i<10;i++){
		pageArr.add(arr.get((bbspage-1)*10+i));
	}
	
	ArrayList<BbsDTO> list=bDAO.bbsList(pageArr);
	System.out.println("BBS Size: "+arr.size());
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
	
	padding-right:10px;
}
</style>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<script>

</script>
</head>
<body>
<%@include file="/header.jsp" %>
<section>
	<article>
	<table border="1">
		<thead>
		<tr>
		<th>작성자</th>
		<th width="250px">제목</th>
		<th>작성자</th>
		<th>조회수</th>
		<th>작성일</th>
		</tr>
		</thead>

		<tbody>
		<%
			for(int i=0;i<list.size();i++){
				%>
				<tr>
				<td><%=list.get(i).getIdx()%></td>
				<td><a href="content.jsp?page=<%=bbspage%>&idx=<%=list.get(i).getIdx()%>"><%=list.get(i).getSubject()%></a></td>
				<td><%=list.get(i).getWriter() %></td>
				<td><%=list.get(i).getReadnum() %></td>
				<td><%=list.get(i).getWritedate() %></td>			
				</tr>
				<%
			}
		%>
		
		
	
		</tbody>
	
	
		<tfoot>
		<tr>
		<td colspan="4" align="left">
		<a href="list.jsp?page=1">1</a>
		<a href="list.jsp?page=2">2</a>
		<a href="list.jsp?page=3">3</a>
		<a href="list.jsp?page=4">4</a>
		<a href="list.jsp?page=5">5</a>
		<a href="list.jsp?page=6">></a>
		<a href="">...</a>
		<a href="list.jsp?page=1"><%=arr.size()/10+1 %></a>
		
		</td>
		<td align="right">
		<form name="write" action="write.jsp">
		<input type="submit" value="글쓰기">
		</form>
		</td>
		</tr>
		</tfoot>
	</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>