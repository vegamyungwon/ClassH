<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" /> 
<title>TownStory: Google Map</title>
<link href="http://code.google.com/apis/maps/documentation/javascript/examples/default.css" rel="stylesheet" type="text/css" />
<style type="text/css"> 
  html { height: 100% } 
  body { height: 100%; margin: 0px; padding: 0px; font-size: 9pt; } 

    div { float:left; }

    #map_canvas { width: 800px; height: 500px }

    #control {  }

    input { font-size: 9pt; }
</style> 
<script type="text/javascript" 
    src="http://maps.google.com/maps/api/js?sensor=false&region=KR"> 
</script> 
<script type="text/javascript"> 
var StreetViewPanorama = new function(){}

var globalMap;
var globalMarker;
var globalGeocoder;

// 맵 초기화
function initialize(x, y) { 
     // 입력된 좌표가 없으면 기본좌표를 역삼동으로 설정.
    if(x==0){ x=37.50075507977441; }
    if(y==0){ y=127.03690767288208; }

    globalGeocoder = new google.maps.Geocoder();

    var latlng = new google.maps.LatLng(x, y);

    var myOptions = { 
        zoom: 16, 

        //disableDoubleClickZoom:false,
        center: latlng, 
        
        navigationControl: false,    // 눈금자 형태로 스케일 조절하는 컨트롤 활성화 선택.
        navigationControlOptions: { 
            position: google.maps.ControlPosition.TOP_RIGHT,
            style: google.maps.NavigationControlStyle.DEFAULT // ANDROID, DEFAULT, SMALL, ZOOM_PAN
        },
        
        streetViewControl: false,

        scaleControl: false,    // 지도 축적 보여줄 것인지.
        //scaleControlOptions: { position: google.maps.ControlPosition.TOP_RIGHT },
        
        mapTypeControl: false, // 지도,위성,하이브리드 등등 선택 컨트롤 보여줄 것인지
        mapTypeId: google.maps.MapTypeId.ROADMAP  // HYBRID, ROADMAP, SATELLITE, TERRAIN
    }; 

    globalMap = new google.maps.Map(document.getElementById("map_canvas"), myOptions); 

    google.maps.event.addListener(globalMap, 'dragend', function(){    // 드래그시 이벤트 추가
        showMapPos();
        showMapAddr();
    });
    google.maps.event.addListener(globalMap, 'click', function(event){        // 지도클릭시 마커이동
        moveMarker(event.latLng); 
    });
}
 
// 맵 드래그할 때 맵 중앙 좌표 보여주기
function showMapPos(){
    var pos=globalMap.getCenter();

    //alert(pos.lat()+"/"+pos.lng());
    //return {x:pos.lat(), y:pos.lng()};

    document.getElementById("centerX").value = pos.lat();
    document.getElementById("centerY").value = pos.lng();
}

// 드래그할 때 맵 중앙 좌표의 주소
function showMapAddr(){
    globalGeocoder.geocode( { 'location': globalMap.getCenter()}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            /*
            var str="";
            for(var i=0; i<results[0].address_components.length; i++){
                str += "/"+results[0].address_components[0].long_name
            }
            document.getElementById("txtAddress").innerHTML=str;

            document.getElementById("txtAddress").innerHTML=results[0].address_components[0].types;
            */

            
            var str="";
            for(var i=3; i>=0; i--){
                str += " "+results[0].address_components[i].short_name;
            }
            document.getElementById("txtAddress").innerHTML=str;
            //document.getElementById("txtAddress").innerHTML=results[0].address_components[0].long_name;
            

        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}

// 맵 중앙에 마크찍기
function setMark(){
    var myOptions = {
        position: globalMap.getCenter(),
        draggable: true,
        map: globalMap,
        //icon: "http://sstatic.naver.net/search/img2/ico_bal_a.gif", // 아이콘 설정할 때
        visible: true
    };

    globalMarker = new google.maps.Marker(myOptions);
}

// 마크 삭제하기
function removeMark(){
    globalMarker.setOptions({
        map: null,
        visible: false
    });
    globalMarker = null;
}

// 마크좌표 가져오기
function getMarkPos(){
    var pos=globalMarker.getPosition();

    //alert(pos.lat()+"/"+pos.lng());
    //return {x:pos.lat(), y:pos.lng()};

    document.getElementById("markerX").value = pos.lat();
    document.getElementById("markerY").value = pos.lng();
}

// 특정좌표로 이동하기
function setMapByCoord(x, y){
    var loc = new google.maps.LatLng(x, y);

    globalMap.setCenter(loc);
}

// 주소값으로 찾기
function codeAddress() {
    var address = document.getElementById("address").value;
    if(address=='검색할 주소를 입력하십시오.' || address==''){
        alert('검색할 주소를 입력하십시오.');
        document.getElementById("address").value='';
        document.getElementById("address").focus();
        return;
    }

    globalGeocoder.geocode( { 'address': address}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
            globalMap.setCenter(results[0].geometry.location);

            //var marker = new google.maps.Marker({
            globalMarker = new google.maps.Marker({
                map: globalMap, 
                position: results[0].geometry.location,
                draggable: true
            });
        } else {
            alert("Geocode was not successful for the following reason: " + status);
        }
    });
}

// 정보창 마크 찍기
function setInfoMark(){
    //var html = "<div><a href='http://www.findall.co.kr' target='_blank'>www.findall.co.kr</a></div>";
    //var html = "<div><iframe src='http://www.findall.co.kr' style='width:300px;height:120px;'></iframe></div>";

    var html = "";
    html += "<div>";
    html += "    <a href='http://www.findall.co.kr' target='_blank'>";
    html += "        <img src='http://image.findall.co.kr/FANew/Topmain/summer_logo.gif' border='0'>";
    html += "    </a>";
    html += "</div>";

    var infoWin = new google.maps.InfoWindow({content: html, maxWidth:1000});
    var loc = new google.maps.LatLng(37.500061375296184,127.03099206089973);
    
    var myOptions = {
        position: loc,
        draggable: false,
        map: globalMap,
        //icon: "http://sstatic.naver.net/search/img2/ico_bal_a.gif", // 아이콘 설정할 때
        visible: true
    };

    // 마커 생성
    globalMarker = new google.maps.Marker(myOptions);

    // 마커에 이벤트리스너 추가
    google.maps.event.addListener(globalMarker, 'click', function(){
        infoWin.open(globalMap, globalMarker);
    });

    // 지도 중심좌표 이동
    globalMap.setCenter(loc);
}

// 지도 위의 마크 모두 삭제 - Refresh 말고 방법 없을까?
function clearMark(){
    var loc = globalMap.getCenter(); // 현재의 지도의 위치를 가져온다.

    globalMap = null;
    globalMarker = null;
    globalGeocoder = null;

    initialize(loc.lat(), loc.lng());
}

// 지도 클릭시 마커 이동
function moveMarker(loc){
    //alert(loc);
    globalMarker.setPosition(loc);
}

function calcDistance(lat1, lon1, lat2, lon2){
	  var pos=globalMarker.getPosition();

	    //alert(pos.lat()+"/"+pos.lng());
	    //return {x:pos.lat(), y:pos.lng()};

	    //document.getElementById("markerX").value = pos.lat();
	    //document.getElementById("markerY").value = pos.lng();

    var EARTH_R, Rad, radLat1, radLat2, radDist; 
    var distance, ret;


    EARTH_R = 6371000.0;
    Rad 		= Math.PI/180;
    radLat1 = Rad * lat1;
    radLat2 = Rad * lat2;
    radDist = Rad * (lon1 - lon2);
    
    distance = Math.sin(radLat1) * Math.sin(radLat2);
    distance = distance + Math.cos(radLat1) * Math.cos(radLat2) * Math.cos(radDist);
    ret 		 = EARTH_R * Math.acos(distance);
				
    var rtn = Math.round(Math.round(ret) / 1000);
    
   	if(rtn <= 0)
   	{
   		rtn = Math.round(ret) + " m";
   	}else
   	{
   		rtn = rtn + " km";
   	}
    
    return  rtn;
}

var base_latlng, cur_latlng;

function GM_load() {
    var map = new GMap2(document.getElementById("map")); 
    map.setCenter(new GLatLng(36.615527, 127.353515), 12); 
    map.setUIToDefault();
    map.enableGoogleBar();

    GEvent.addListener(map, "click", function(overlay,point) {
        base_latlng = map.fromContainerPixelToLatLng(point);
        var lmarker = new GMarker(point);
        map.addOverlay(lmarker);
        lmarker.setImage("http://maps.google.com/mapfiles/ms/icons/red-pushpin.png");
    });

    GEvent.addListener(map, "singlerightclick", function(point, src, overlay){
        cur_latlng = map.fromContainerPixelToLatLng(point);

        var rmarker = new GMarker(cur_latlng);
        map.addOverlay(rmarker);
        rmarker.setImage("http://maps.google.com/mapfiles/ms/icons/purple-pushpin.png");

        var dist = cur_latlng.distanceFrom(base_latlng);
        var myHtml = "Distance: " + dist;
        map.openInfoWindow(cur_latlng, myHtml);
    });
}


</script> 
</head> 
<body onload="initialize(0,0)"> 
  <div id="map_canvas"></div> 

    <div id="control">
        <dl>
            <dt><strong>[Control]</strong></dt>
            <dd>기본좌표(x,y) : 37.50075507977441, 127.03690767288208</dd>
            <dd>&nbsp;</dd>
            <dd>맵 주소 : <span id="txtAddress"></span></dd>
            <dd>맵X좌표:&nbsp;&nbsp;&nbsp; <input type="text" id="centerX"></dd>
            <dd>맵Y좌표:&nbsp;&nbsp;&nbsp; <input type="text" id="centerY"></dd>

            <dd><hr/></dd>

            <dd>
                <input type="button" value="맵 중앙에 마크찍기" onClick="setMark();">
                <input type="button" value="마크삭제" onClick="removeMark();">
            </dd>
            <dd>
                <input type="button" value="마크좌표 보기" onClick="getMarkPos();">    <br>
                <span style="margin-left: 80px;">마크X좌표: <input type="text" id="markerX"></span> <br>
                <span style="margin-left: 80px;">마크Y좌표: <input type="text" id="markerY"></span>
            </dd>
            <dd>
                <input type="button" value="정보창 마크 찍기 - 파인드올" onClick="setInfoMark();">
            </dd>
            <dd>
                <input type="button" value="지도 위의 마크 모두 삭제" onClick="clearMark();">
            </dd>

            <dd><hr/></dd>

            <dd>
                <input type="button" value="송파구청" onClick="setMapByCoord(37.5145937754918, 127.10662364959717);">
                좌표(x,y): 37.5145937754918, 127.10662364959717
            </dd>

            <dd><hr/></dd>

            <dd>
                <input type="text" id="address" value="검색할 주소를 입력하십시오." style="width:210px;" onClick="this.value='';">
                <input type="button" value="GeoCode" onClick="codeAddress()">
            </dd>
            
            <dd>
            	<input type="button" value="거리체크" onClick="GM_load()">
       	          </dd>
        </td>
    </div>


</body>
</html>