<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int total_cnt=83; // 총 게시물수
	int listSize=5; //보여줄 리스트수
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
<h2>pageTest.jsp</h2>
<h4>총 게시물 수:<%=total_cnt %></h4>
<h4>보여줄 페이지 수:<%=listSize%> / <%=pageSize%></h4>
<h4>현재 사용자 위치:<%=cp %></h4>
<hr>
<%
	if(group_num!=0){
		%><a href="pageTest.jsp?cp=<%=(group_num-1)*pageSize+pageSize%>">&lt;&lt;</a><%
		
	}

	for(int i=(group_num*pageSize)+1;i<=(group_num*pageSize)+pageSize;i++){
		%>
		<a href="pageTest.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
		
		<%
		if(i==page_cnt)break;
	}
	
	if(group_num!=(page_cnt/pageSize-(page_cnt%pageSize==0?1:0))){
		%><a href="pageTest.jsp?cp=<%=(group_num+1)*pageSize+1%>">&gt;&gt;</a><%
	
	}


%>
</body>
</html>