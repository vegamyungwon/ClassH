 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">

<head>
    <title>jQuery Selector</title>
  
    <style>
        div { background : #FFF; padding:10px; margin:10px; }
    </style>
    <script src="http://code.jquery.com/jquery-latest.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            //ID가 Content인 요소를 찾아 배경을 "yellow"로 변경합니다.
            $("#content").css("background", "yellow");
        });
    </script>
</head>
<body>    
    <h2>jQuery 시작 Selector</h2>
    <p>jQuery에 대한 자세한 내용을 보려면 jquery.com 을 방문하세요.</p>
    <div>   
        <div id="content">
            이 부분은 ID값이 content 입니다.
        </div>        
    </div>
</body>
</html>