<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<head>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=ff54c303c8682fcc772f6b39d0173146&libraries=services"></script>
<style type="text/css">
	.map{
		position: fixed;
		width: 33%;
		height: 60%;
		top: 40%;
		right: 0;
		z-index: 10;
	}
</style>
</head>
<body>
<div class="site-wrap" id="home-section">

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	
	<header class="site-navbar site-navbar-target" role="banner">

		<div class="container">
			<div class="row align-items-center position-relative">

				<div class="col-3">
					<div class="site-logo">
						<a href="index.html"><strong>자동차대여</strong></a>
					</div>
				</div>

				<div class="col-9 text-right">
					
					<span class="d-inline-block d-lg-none"><a href="#" class=" site-menu-toggle js-menu-toggle py-5 "><span class="icon-menu h3 text-black"></span></a></span>

					<nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
						<ul class="site-menu main-menu js-clone-nav ml-auto ">
							<li><a href="index.html" class="nav-link">Home</a></li>
							<li class="active"><a href="listing.html" class="nav-link">Listing</a></li>
							<li><a href="testimonials.html" class="nav-link">Testimonials</a></li>
							<li><a href="blog.html" class="nav-link">Blog</a></li>
							<li><a href="about.html" class="nav-link">About</a></li>
							<li><a href="contact.html" class="nav-link">Contact</a></li>
						</ul>
					</nav>
				</div>
			</div>
		</div>
	</header>

	<div class="hero inner-page" style="background-image: url('/resources/images/hero_1_a.jpg');">
		<div class="container">
			<div class="row align-items-end ">
				<div class="col-lg-12">

					<div class="intro">
						<h1><strong>차량검색</strong></h1>
						<div>
							<form action="/rent/list" id="frm_select" onclick="mapSelect()">
								<input type="hidden" name="kakaoAddress" id="kakaoAddress">
								<input type="hidden" name="centerLat" id="centerLat">
								<input type="hidden" name="centerLng" id="centerLng">
								<input type="search" placeholder="주소" name="address" id="address">
								<input type="date" placeholder="픽업날짜" name="pickup_date" id="pickup_date">
								<input type="number" placeholder="픽업시각" name="pickup_hour" id="pickup_hour" style="width: 10%">
								<input type="date" placeholder="반환날짜" name="return_date" id="return_date">
								<input type="number" placeholder="반환시각" name="return_hour" id="return_hour" style="width: 10%">
								<button onclick="kakaoAddr()">검색</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<h2 class="section-heading"><strong>Car Listings</strong></h2>
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>		
				</div>
			</div>
			
			<div id="result">
				<div class="carList">
					<c:forEach var="car" items="${carList}" varStatus="status">
						<c:if test="${status.count%2==1}">
							<div class="row">
								<div class="col-md-6 col-lg-4 mb-4">
									<div class="listing-img h-100 mr-4">
										<img src="/resources/images/car_6.jpg" alt="Image" class="img-fluid">
									</div>
									<div class="listing-contents h-100">
										<h3>${car.carModel}</h3>
										<div class="d-block d-md-flex mb-3 border-bottom pb-3">
											<div class="listing-feature pr-4">
												<span class="caption">평점:</span>
												<span class="number">${car.carAvgScore}</span>
											</div>
										</div>
									</div>
									<div class="rent-price">
										<strong>${car.carFee}</strong><span class="mx-1">/</span>hour
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${status.count%2==0}">
							<div class="col-md-6 col-lg-4 mb-4">
								<div class="listing-img h-100 mr-4">
									<img src="/resources/images/car_6.jpg" alt="Image" class="img-fluid">
								</div>
								<div class="listing-contents h-100">
									<h3>${car.carModel}</h3>
									<div class="d-block d-md-flex mb-3 border-bottom pb-3">
										<div class="listing-feature pr-4">
											<span class="caption">평점:</span>
											<span class="number">${car.carAvgScore}</span>
										</div>
									</div>
								</div>
								<div class="rent-price">
									<strong>${car.carFee}</strong><span class="mx-1">/</span>hour
								</div>
							</div>
						</c:if>
					</c:forEach>
				</div>
				<div class="map" id="map"></div>
			</div>
		</div>
	</div>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/view/include/script.jsp" %>
<script type="text/javascript">
//변수 선언
/*
let latMin;
let latMax;
let lngMin;
let lngMax;
let pickupDate;
let returnDate;
*/


//입력값 초기화
$("#address").val("${requestScope.address}");
$("#kakaoAddress").val("${requestScope.kakaoAddress}");
$("#pickup_date").val("${requestScope.pickup_date}");
$("#pickup_hour").val("${requestScope.pickup_hour}");
$("#return_date").val("${requestScope.return_date}");
$("#return_hour").val("${requestScope.return_hour}");
$("#centerLat").val("${requestScope.centerLat}");
$("#centerLng").val("${requestScope.centerLng}");
/*
if(${requestScope.from=="/index"}){
	let pickupDateArr = "${param.pickup_date}".split("/");
	let returnDateArr = "${param.return_date}".split("/");
	$("#address").val("${param.address}");
	$("#kakaoAddress").val("${param.kakaoAddress}");
	$("#pickup_date").val(pickupDateArr[2]+"-"+pickupDateArr[0]+"-"+pickupDateArr[1]);
	$("#pickup_hour").val("${param.pickup_hour}");
	$("#return_date").val(returnDateArr[2]+"-"+returnDateArr[0]+"-"+returnDateArr[1]);
	$("#return_hour").val("${param.return_hour}");
}else if(${requestScope.from=="/rent/list"}){
	$("#address").val("${requestScope.address}");
	$("#kakaoAddress").val("${requestScope.kakaoAddress}");
	$("#pickup_date").val("${requestScope.pickup_date}");
	$("#pickup_hour").val("${requestScope.pickup_hour}");
	$("#return_date").val("${requestScope.return_date}");
	$("#return_hour").val("${requestScope.return_hour}");
}else{
	alert("경로가 잘못됨");
}
*/
//검색 버튼 누를 때 DB조회하기
/*
$("#frm_select").on("submit",(e)=>{
	mapSelect();
	console.dir("${sessionScope.again}");
	if(${sessionScope.again==null}){
		alert("여기 찍음?");
		mapSelect();
		e.preventDefault();
	}else if(${sessionScope.again=='no'}){
		alert("아님 여기?");
		e.preventDefault();
	}else {
		alert("아님 요기?");
	}
	-->
	//dbSelect();
	//e.preventDefault();
})
*/

//DB조회
/*
let dbSelect = ()=>{
	$(".carList").innerHTML = "";
	pickupDate = $("#pickup_date").val() + ("0" + $("#pickup_hour").val()).slice(-2);
	returnDate = $("#return_date").val() + ("0" + $("#return_hour").val()).slice(-2);

	let url = '/rent/list?lat_min=' + latMin + '&lat_max=' + latMax 
			+ '&lng_min=' + lngMin + '&lng_max=' + lngMax
			+ '&pickup_date=' + pickupDate + '&return_date=' + returnDate;
	console.dir(url);
	fetch(url,{
		"method":"get"
	});
}
*/

//지도
let mapSelect = ()=>{
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		//center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		center: new kakao.maps.LatLng($("#centerLat").val(), $("#centerLng").val()), //지도의 중심좌표.
		level: 3 //지도의 레벨(확대, 축소 정도)
	};

	//지도 생성 및 객체 리턴
	var map = new kakao.maps.Map(container, options);

	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions  = [];
	<c:forEach items="${requestScope.carList}" var="car" varStatus="status">
		positions["${status.index}"] = {latlng: new kakao.maps.LatLng("${car.carParkingLat}", "${car.carParkingLng}")};
		console.dir("${status.index}");
		console.dir("car");
	</c:forEach>
	console.dir("${requestScope.carList}");
	console.dir(positions);
	for (var i = 0; i < positions.length; i ++) {
		
		// 마커 이미지의 이미지 크기 입니다
		// var imageSize = new kakao.maps.Size(24, 35); 
		
		// 마커 이미지를 생성합니다	
		//var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions[i].latlng // 마커를 표시할 위치
			//title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			//image : markerImage // 마커 이미지 
		});
	}

	/*
	// 장소 검색 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();

	// 키워드로 장소를 검색합니다
	var address = $("#address").val();
	geocoder.addressSearch(address, function(result, status) {
	console.dir("==========result==========");
	console.dir(result);
	let adrressNameArr = result[0].address_name.split(" ");
	$("#kakaoAddress").val(adrressNameArr[0] + " " + adrressNameArr[1]);
	console.dir($("#kakaoAddress").val());
	//alert($("#address").val());
	
		// 정상적으로 검색이 완료됐으면 
		if (status === kakao.maps.services.Status.OK) {

			var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

			// 결과값으로 받은 위치를 마커로 표시합니다
			var marker = new kakao.maps.Marker({
				map: map,
				position: coords
			});

			/*
			// 인포윈도우로 장소에 대한 설명을 표시합니다
			var infowindow = new kakao.maps.InfoWindow({
				content: '<div style="width:150px;text-align:center;padding:6px 0;">우리회사</div>'
			});
			infowindow.open(map, marker);
			

			// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
			map.setCenter(coords);
			
			console.dir("==========coords==========");
			console.dir(coords);
			console.dir("==========map.getBounds()==========");
			console.dir(map.getBounds());
			
			$("#lat_min").val(map.getBounds().ha);
			$("#lat_max").val(map.getBounds().oa);
			$("#lng_min").val(map.getBounds().qa);
			$("#lng_max").val(map.getBounds().pa);
			console.dir($("#lat_min").val());
			console.dir($("#lat_max").val());
			console.dir($("#lng_min").val());
			console.dir($("#lng_max").val());
			latMin = map.getBounds().ha;
			latMax = map.getBounds().oa;
			lngMin = map.getBounds().qa;
			lngMax = map.getBounds().pa;
			console.dir(latMin);
			console.dir(latMax);
			console.dir(lngMin);
			console.dir(lngMax);
			
			//DB조회
			//dbSelect();
		}
	});
	*/
}

mapSelect();


let kakaoAddr = async (e)=>{
	//e.preventDefault();
	let keyword = $("#address").val();
	console.dir($("#address").val());
	console.dir(keyword);
	const KAKAO_API_IEY = "KakaoAK 8f0a8bf7d90077ec52cc56e4a88c0fcd";
	
	let url = "https://dapi.kakao.com/v2/local/search/address.json?query="+keyword;
	console.dir(url);
	let headerObj = new Headers();
	headerObj.append("Authorization",KAKAO_API_IEY);
	
	let response = await fetch(url,{
		"method": "get",
		"headers": headerObj
	});
	
	let obj = await response.json();
	console.dir(obj);
	let adrressNameArr = obj.documents[0].address_name.split(" ");
	//$("#address").val(adrressNameArr[0] + " " + adrressNameArr[1]);
	//$("#address").val(obj.documents[0].address_name);
	document.querySelector('#kakaoAddress').value = adrressNameArr[0] + " " + adrressNameArr[1];
	document.querySelector('#centerLat').value = obj.documents[0].y;
	document.querySelector('#centerLng').value = obj.documents[0].x;
	console.dir($("#address").val());
	console.dir(document.querySelector('#address').value);
	console.dir('hidden : ' + document.querySelector('#kakaoAddress').value);	
	console.dir(document.querySelector('#frm_select'));
	//document.forms[0].submit();
	document.querySelector("#frm_select").submit();
};

/*
var ps = new kakao.maps.services.Places(); 
ps.keywordSearch("경리단길", placesSearchCB); 
function placesSearchCB (data, status, pagination) {
	console.dir("==========data==========");
	console.dir(data);
	
	
	if (status === kakao.maps.services.Status.OK) {

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
		// LatLngBounds 객체에 좌표를 추가합니다
		var bounds = new kakao.maps.LatLngBounds();

		for (var i=0; i<data.length; i++) {
			displayMarker(data[i]);	
			bounds.extend(new kakao.maps.LatLng(data[i].y, data[i].x));
			if(data[i].x > latMin && data[i].x < latMax && data[i].y > lngMin && data[i].y < lngMax){
				console.dir(i);
			}
		}	   

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
		console.dir("==========map.getCenter()==========");
		console.dir(map.getCenter());
		console.dir("==========map.getBounds()==========");
		console.dir(map.getBounds());
	} 
}

// 지도에 마커를 표시하는 함수입니다
function displayMarker(place) {
	
	// 마커를 생성하고 지도에 표시합니다
	var marker = new kakao.maps.Marker({
		map: map,
		position: new kakao.maps.LatLng(place.y, place.x) 
	});

	// 마커에 클릭이벤트를 등록합니다
	kakao.maps.event.addListener(marker, 'click', function() {
		// 마커를 클릭하면 장소명이 인포윈도우에 표출됩니다
		infowindow.setContent('<div style="padding:5px;font-size:12px;">' + place.place_name + '</div>');
		infowindow.open(map, marker);
	});
}
*/
</script>
</body>

</html>

