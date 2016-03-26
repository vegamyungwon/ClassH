<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="neco.bbs.*" %>
<jsp:useBean id="bDAO" class="neco.bbs.BbsDAO" scope="session"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2{
	text-align: center;
}

table{
	margin:0px auto;
	width: 550px;
	border-top: 2px double blue;
	border-bottom: 2px double blue;
	border-spacing: 0px;
}

table thead th{
	background: skyblue;
}

table tfoot td{
	border-top: 2px solid black;
}	
</style>
</head>
<%
	int total_cnt=bDAO.getTotalCnt(); // 총 게시물수 ..오류발생가능 특정상황의 에러
	int listSize=10; //보여줄 리스트수
	int pageSize=5;	//보여줄 페이지수
	
	
	String cp_s=request.getParameter("cp");
	if(cp_s==null||cp_s.equals("")){
		cp_s="1";
		
	}
	int cp=Integer.parseInt(cp_s);		//사용자의 위치

	int page_cnt=total_cnt/(listSize)+1;
	if(total_cnt%listSize==0)page_cnt--;
	
	int group_num=cp/pageSize;
	if (cp%pageSize==0)group_num--;
	
%>


<body>
<%@include file="/header.jsp" %>

<section>
	<article>
		<h2>자유게시판</h2>
		<table summary="게시판리스트">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>조회수</th>
			</tr>
		<thead>
		
		
		<tfoot>
			<tr>
			<td colspan="3" align="center">
			<!-- -------------------------------------------- -->
				<%
					if(group_num!=0){
						%><a href="list.jsp?cp=<%=(group_num-1)*pageSize+pageSize%>">&lt;&lt;</a><%
					}
					for(int i=(group_num*pageSize)+1;i<=(group_num*pageSize)+pageSize;i++){
						%>
						<a href="list.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
						<%
						if(i==page_cnt)break;
					}
					if(group_num!=(page_cnt/pageSize-(page_cnt%pageSize==0?1:0))){
						%><a href="list.jsp?cp=<%=(group_num+1)*pageSize+1%>">&gt;&gt;</a><%
					}
				%>
			<!-- -------------------------------------------- -->
			</td>
			<td>
			<a href="write.jsp">글쓰기</a>
			</td>
			</tr>
		</tfoot>
		
		<tbody>
		<%
		ArrayList<BbsDTO> arr=bDAO.bbsList(cp,listSize);
		if(arr==null||arr.size()==0){
			%>
			<tr>
			<td colspan="4" align="center">
			등록된 게시글이 없습니다.
			</td>
			</tr>
			<%
		}else{
			 for(int i=0;i<arr.size();i++){
			%>
			 <tr>
			 <td><%=arr.get(i).getIdx() %></td>
			 <td>
			 <%
			 for(int z=0;z<arr.get(i).getLev();z++){
				 out.println("&nbsp;");
				if(z<arr.get(i).getLev()-1){
					out.println("&nbsp;");
				}else{
				 	out.println("└");
				}
			 }%>
			 <a href="content.jsp?idx=<%=arr.get(i).getIdx()%>"><%=arr.get(i).getSubject() %></a>
			 </td>
			 <td><%=arr.get(i).getWriter() %></td>
			 <td><%=arr.get(i).getReadnum() %></td>
			 </tr>
			 <%
			 }
			 %>
			 </tbody>
			 
		<%
		}
		%>
		</tbody>
		</table>
	</article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>