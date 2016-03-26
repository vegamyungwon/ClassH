<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="neco.member.*" %>

<jsp:useBean id="mDTO" class="neco.member.MemberDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mDTO"/>
<jsp:useBean id="mDAO" class="neco.member.MemberDAO"></jsp:useBean>
<script>
<%
	String session_name=null;
%>
function login(index, name){
	if (index==1){
		window.alert("일치하는 ID가 없습니다.")	//에러
	}else if (index==2){
		window.alert("비밀번호가 틀립니다.")
	}else if (index==3){
		window.alert(name+"님 환영합니다.")
	}
	
	
	opener.location.reload();
	self.close();
}

</script>



<%
 System.out.println("login_ok.jsp: "+mDTO.getId()+" "+mDTO.getPwd());
 int result=mDAO.loginCheck(mDTO.getId(), mDTO.getPwd());
 System.out.println("login_ok.result: "+result);
 String name=null;
 
 switch(result){
 case 1:%><script>login(<%=result%>, "<%=name%>");</script><%;break;
 case 2:%><script>login(<%=result%>, "<%=name%>");</script><%;break;
 case 3:name=mDAO.userGetInfo(mDTO.getId());
	 	session_name=(String)session.getAttribute("name");
 		System.out.println("login_ok.switchname: "+name);
		if(name!=null){ 
		session.setAttribute("name", name);
		System.out.println("session_name: "+session_name);
		String idck=request.getParameter("idck");
		System.out.println("login_ok.idck: "+idck);
		if(idck!=null&&idck.equals("on")){
			System.out.println("if "+idck);
			Cookie ck1=new Cookie("idck",mDTO.getId());
			ck1.setMaxAge(60*60*24);
			response.addCookie(ck1);
		}else if(idck==null){
			Cookie ck1=new Cookie("idck",null);
			ck1.setMaxAge(60*60*24);
			response.addCookie(ck1);
			
		}
		%>
	
		<script>
		login(<%=result%>, "<%=name%>");
				
		</script>
		
		<%
		}
		
		//쿠키
	
		
		 ;break;
 default:;
 }
 
%>








