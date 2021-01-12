<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=dcd1967942f030312f2789a036f32080"></script>
<style type="text/css">
#menu_wrap {
	position: absolute;
	top: 0; left: 0; bottom: 0;
	width: 200px; margin: 10px 0 30px 10px; padding: 5px;
	overflow-y: auto;
	background: rgba(255, 255, 255, 0.7);
	z-index: 1;
	font-size: 16px;
	border-radius: 10px;
}
.bg_white {background:#fff;}
.map_wrap {position:relative;width:100%;height:500px;}

ul {
	list-style: none;
	padding: 0;
	margin: 20px 0	
}
button {
	width: 200px;
	background: rgba(255, 255, 255, 0);
	border: none;
	border-bottom: solid 1px black;	
	border-collapse: collapse;
	border-spacing: 0;
	border-color: #999;
	padding: 0; 5px;	
	text-align: left;	
}
.last_bt{ border: none}
.b_bt_t {
	font-size: 18px;
	font-weight: bold;	
}
.b_bt_ad {color: #666}

</style>
<script type="text/javascript">
	function setCenter(a, b, num) {
		var moveLatLon = new kakao.maps.LatLng(a, b);
	    
	    // 지도 중심을 이동 시킵니다
	    map.setCenter(moveLatLon);
	    branchDetail(num);
	}
	function branchDetail(num) {
		var xhr = new XMLHttpRequest();
		xhr.open('get', 'branchDetail.do?br='+num, true);
		xhr.onload = function() {
			if (xhr.status >= 200 && xhr.status < 400) {	// https://developer.mozilla.org/en-US/docs/Web/HTTP/Status
				var dispLisp = xhr.responseText;

				document.getElementById('branch_info').innerHTML = dispLisp;
			}
		};
		xhr.send();
	}
	window.onpageshow = branchDetail(1);
</script>
</head>
<body>
<div class="map_wrap">
	<div id="map" style="width: 80%; max-width: 960px; height: 500px;"></div>
	<div id="menu_wrap" class="bg_white">
		<ul id="placesList">
			<li><button type="button" onclick="setCenter(37.5581346, 126.9708856, 1)">
					<p class="b_bt_t">도심창고 광화문점</p>
					<p class="b_bt_ad">서울특별시 종로구 세종대로 11</p>					
				</button>
			</li>						
			<li>
				<button type="button" onclick="setCenter(37.5199454, 127.0256598, 2)">
					<p class="b_bt_t">도심창고 신사점</p>
					<p class="b_bt_ad">서울특별시 강남구 도산대로 25</p>
				</button>
			</li>
			<li>
				<button type="button" class="last_bt" onclick="setCenter(37.390331, 127.082675, 3)">
					<p class="b_bt_t">도심창고 판교점</p>
					<p class="b_bt_ad">경기도 성남시 분당구 판교로 37</p>
				</button>
			</li>
		</ul>
	</div>
</div>
<div id="branch_info"></div>
<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		center: new kakao.maps.LatLng(37.5581346, 126.9708856), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
	
	var infowindow = new kakao.maps.InfoWindow({zIndex:1});
	var marker1 = new kakao.maps.Marker({
	    map: map,
	    title: "광화문점",
	    position: new kakao.maps.LatLng(37.5581346, 126.9708856)	
	});
	var marker2 = new kakao.maps.Marker({
	    map: map,
	    title: "신사점",
	    position: new kakao.maps.LatLng(37.5199454, 127.0256598)
	});
	var marker2 = new kakao.maps.Marker({
	    map: map,
	    title: "판교점",
	    position: new kakao.maps.LatLng(37.390331, 127.082675)
	});		
</script>
</body>
</html>