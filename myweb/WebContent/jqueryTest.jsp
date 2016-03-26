<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.12.0.min.js"></script>
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script>
//좌표 이미지를 표시하는 MarkerImage
var GreenIcon = new google.maps.MarkerImage(
	"http://ankyu.entersoft.kr/images/choiankyu.jpg",
	new google.maps.Size(60, 60),
	new google.maps.Point(0, 0),
	new google.maps.Point(6, 20));

//현재 위치에서 위도/경도 뽑기
function getLocation_cord()
{
	if (navigator.geolocation)
	{
		navigator.geolocation.getCurrentPosition(successCallback,errorCallback);
	} else
	{
		$("#map").html("Geolocation is not supported by this browser.");
		alert('단말기에서 현재 위치를 사용할 수 없습니다.');
	}
}

//위도/경도 성공시 호출 Callback 함수
function successCallback(wp_position) 
{
	//위도 경도 표시
	$("#setPosition").html("Latitude: " + wp_position.coords.latitude + ", Longitude: " + wp_position.coords.longitude);
	
	var wplatlng = new google.maps.LatLng(wp_position.coords.latitude, wp_position.coords.longitude); 
	var wpOptions = {
		zoom:19,				// 지도 zoom단계
		center:wplatlng,		//지도에서 가운데로 위치할 위도와 경도(변수) 
		mapTypeId:google.maps.MapTypeId.ROADMAP 
		};


	var wpmap = new google.maps.Map(document.getElementById("map"), wpOptions); 
	var marker = new google.maps.Marker({
		map: wpmap, 
		icon: GreenIcon,			// 마커로 사용할 이미지(변수)
		info: "말풍선",				// 말풍선 안에 들어갈 내용.
		title : "현재위치",			// 마커에 마우스 포인트를 갖다댔을 때 뜨는 타이틀.
		position: wplatlng			// 마커 표시 좌표.
		});

  
	var content = "이곳은 말풍선 테스트 하는 곳 입니다. ";		 // 말풍선 안에 들어갈 내용
    
	// 마커를 클릭했을 때의 이벤트. 말풍선 뿅~
	var infowindow = new google.maps.InfoWindow({ content: content});

	google.maps.event.addListener(marker, "click", function() {
    	infowindow.open(wpmap,marker);
    });


}

//위도 경도 실패시
function errorCallback(wp_position_error) 
{	
	// 실패 코드와 메세지 출력
	$("#map").html("error.code : "+ wp_position_error.code + " , error.message : " + wp_position_error.message);
}

google.maps.event.addDomListener(window, 'load', getLocation_cord);


</script>
</head>
<body>

</body>
</html>