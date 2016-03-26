<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="neco.member.*"%>
<jsp:useBean id="mDTO" class="neco.member.MemberDTO"/>
<jsp:setProperty property="*" name="mDTO"/>
<jsp:useBean id="mDAO" class="neco.member.MemberDAO"/>


<%
	
	MemberDTO dtos[]=mDAO.memberSearch(mDTO);
	//String msg=count>0?"검색에 성공했습니다.":"검색에 실패했습니다.";
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<table>
	<section>
		<article>
			<%
			if(dtos.length==0){
				 %>
				 <div>위 검색어에 검색어를 입력하세요.</div>
				 <%
			}
			
			
			else if(dtos.length==0){
				%>
				<h2>모든 사원 내역</h2>		
			<table>
			<thead>
			<tr>
				<th>사원번호</th>
				<th>사원이름</th>
				<th>이메일</th>
				<th>사원부서</th>
			</tr>
			</thead>
			
			
			<tfoot>
				<tr>
					<td colspan="4">
						현재 근무하고 있는 직원들 목록입니다.
					</td>
				</tr>
			</tfoot>
			<tbody>
				<tr><td colspan="5" align="center">
				등록된 사원이 없습니다.
				</td>
				</tr>
				<%		
			}else{
				for(int i=0;i<dtos.length;i++){
					%>
					<h2>모든 사원 내역</h2>		
			<table border="1">
			<thead>
			<tr>
				<th>사원번호</th>
				<th>ID</th>
				<th>사원이름</th>
				<th>이메일</th>
				<th>사원부서</th>
				<th>가입날짜</th>
			</tr>
			</thead>
			
			
			<tfoot>
				<tr>
					<td colspan="6">
						현재 근무하고 있는 직원들 목록입니다.
					</td>
				</tr>
			</tfoot>
			<tbody>
					<tr>
						<td><%=dtos[i].getIdx()%></td>
						<td><%=dtos[i].getId()%></td>
						<td><%=dtos[i].getName()%></td>
						<td><%=dtos[i].getId()%></td>
						<td><%=dtos[i].getAddr()%></td>
						<td><%=dtos[i].getDate() %></td>
					</tr>
					<%					
				}
			}
			%>
			</tbody>
			</table>
		</article>
	</section>


</table>

</body>
</html>