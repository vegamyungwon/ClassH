<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>beanTest_ok.jsp</h2>

<jsp:useBean id="btest" class="neco.bean.BeanTest"/> <!-- 마지막에 /를 넣으면 여는것과 닫는것이 가능하다. -->



<%
	//form안의 이름과
	//private 의 이름이 같으면 getParameter를 사용 안해도 넣을수 있다.
	//ex
//	String name=request.getParameter("name");
%>
<!-- 
<jsp:setProperty property="name" name="btest" value="name">
 -->

<!-- 
<jsp:setProperty property="name" name="btest" />
<jsp:setProperty property="age" name="btest" />
<jsp:setProperty property="addr" name="btest" />
<jsp:setProperty property="tel" name="btest" />
 -->
 
<!-- private값과 form내의 이름이 같다면 *로 모든걸 사용가능하다. --> 
<jsp:setProperty property="*" name="btest" />


<h3>저장된 이름:
<jsp:getProperty property="name" name="btest"/>
</h3>
<h3>저장된 나이:
<jsp:getProperty property="age" name="btest"/>
</h3>
<h3>저장된 주소:
<jsp:getProperty property="addr" name="btest"/>
</h3>
<h3>저장된 번호:
<jsp:getProperty property="tel" name="btest"/>
</h3>

<!-- 
1. DB 스키마 설계
2. 디자인 설계 (HTML 뼈대)JSP
3. DTD / DAO 작성
4. 컨트롤러 작성 _ok  
 -->
</body>
</html>