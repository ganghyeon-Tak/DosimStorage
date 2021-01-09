<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dcd1967942f030312f2789a036f32080"></script>

</head>
<body>
<div id="map" style="width:500px;height:400px;"></div>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.5581346, 126.9708856), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var marker = new kakao.maps.Marker({
	    map: map,
	    title: "광화문점",
	    position: new kakao.maps.LatLng(37.5581346, 126.9708856)
	});
</script>
</body>
</html>