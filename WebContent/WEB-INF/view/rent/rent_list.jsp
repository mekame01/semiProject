<%@page import="everyBB.common.code.Code"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<head>
<script type="text/javascript" src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=8f0a8bf7d90077ec52cc56e4a88c0fcd&libraries=services"></script>
<style type="text/css">
body {
	padding-top: 25vh;
}

.site-navbar {
	margin-bottom: 0px;
	position: fixed;
	z-index: 9;
	top: 0;
	width: 100%;
	padding: 1rem;
}

.hero.inner-page {
	height: 25vh !important;
	position: fixed;
	top: 0;
	width: 100vw;
	z-index: 8;
}

.hero, .hero > .container > .row {
	max-height: 25vh;
	z-index: 8;
}

.hero .container {
	height: 25vh;
	z-index: 8;
}

.heart {
	margin: 0;
	padding: 0;
	cursor: pointer;
}

.col-lg-4 {
	-webkit-box-flex: 0;
	-ms-flex: 0 0 34%;
	flex: 0 0 34%;
	max-width: 34%; 
}

a:not([href]):not([tabindex]) {
	cursor: pointer;
	color: white;
	text-decoration: none;
}
a:not([href]):not([tabindex]):hover, a:not([href]):not([tabindex]):focus {
	color: white;
	text-decoration: none;
}
a:not([href]):not([tabindex]):focus {
	outline: 0;
}

.map{
	position: fixed;
	width: 35%;
	height: 75vh;
	top: 25vh;
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
	
	<%@ include file="/WEB-INF/view/include/header.jsp"%>

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
								<input type="search" placeholder="주소" name="address" id="address" required="required">
								<input type="date" placeholder="픽업날짜" name="pickup_date" id="pickup_date" required="required">
								<input type="number" placeholder="픽업시각" name="pickup_hour" id="pickup_hour" style="width: 10%" required="required">
								<input type="date" placeholder="반환날짜" name="return_date" id="return_date" required="required">
								<input type="number" placeholder="반환시각" name="return_hour" id="return_hour" style="width: 10%" required="required">
								<input type="button" value="검색" onclick="kakaoAddr()">
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
				<c:forEach var="car" items="${requestScope.carList}" varStatus="status">
				
					<script type="text/javascript">
					console.dir("requestScope.fileList");
					console.dir("${requestScope.fileList}");
					console.dir("${requestScope.fileList[status.index]}");
					console.dir("${requestScope.fileList[status.index][0]}");
					console.dir("${requestScope.fileList[status.index][0]}");
					<%--console.dir("<%=Code.UPLOAD%>${requestScope.fileList[status.index][0].savePath}${requestScope.fileList[status.index][0].renameFileName}");--%>
					</script>
				
					<c:set var="flg" value="no"></c:set>
					<div class="cars col-md-6 col-lg-4 mb-4">
						<div class="listing d-block  align-items-stretch">
							<div class="listing-img h-100 mr-4">
								<img src="/upload/${requestScope.fileList[status.index][0].savePath}${requestScope.fileList[status.index][0].renameFileName}" alt="Image" class="img-fluid">
								<c:if test="${not empty sessionScope.user.userId}">
									<c:forEach var="likey" items="${requestScope.likeyList}">
										<c:if test="${car.carIdx eq likey.carIdx}">
											<c:set var="flg" value="yes"></c:set>
										</c:if>
									</c:forEach>
									<c:if test="${flg eq 'yes'}">
													<div class="heart" style="position: absolute; right: 13%; top: -7%; color: rgba(255,0,0,0.5); font-size: 3em;" onclick="deleteLikey(${car.carIdx})">♥</div>
									</c:if>
									<c:if test="${flg ne 'yes'}">
										<div class="heart" style="position: absolute; right: 13%; top: -7%; color: rgba(255,0,0,0.5); font-size: 3em;" onclick="insertLikey(${car.carIdx})">♡</div>
									</c:if>
								</c:if>
							</div>
							<div class="listing-contents h-100">
								<h3>${car.carModel}</h3>
								<div class="rent-price">
									<strong>${car.carFee}</strong>원<span class="mx-1">/</span>시간
								</div>
								<div class="d-block d-md-flex mb-3 border-bottom pb-3">
									<div class="listing-feature pr-4">
										<span class="caption">평점:</span>
										<span class="number">${car.carAvgScore}</span>
									</div>
									<div class="listing-feature pr-4">
										<span class="caption">Doors:</span>
										<span class="number">4</span>
									</div>
									<div class="listing-feature pr-4">
										<span class="caption">Passenger:</span>
										<span class="number">4</span>
									</div>
								</div>
								<div>
									<p><a onclick="rentDetail(${car.carIdx})" class="btn btn-primary btn-sm">Rent Now</a></p>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="map" id="map"></div>
		</div>
	</div>

<%@ include file="/WEB-INF/view/include/footer.jsp" %>
</div>

<%@ include file="/WEB-INF/view/include/script.jsp" %>
<script type="text/javascript">

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

//
let rentDetail = (carIdx) => {
	let pickupDate = document.querySelector("#pickup_date").value;
	let pickupHour = document.querySelector("#pickup_hour").value;
	let returnDate = document.querySelector("#return_date").value;
	let returnHour = document.querySelector("#return_hour").value;
	location.href="/rent/detail?car_idx=" + carIdx
	+ "&pickup_date=" + pickupDate + "&pickup_hour=" + pickupHour
	+ "&return_date=" + returnDate + "&return_hour=" + returnHour;
}

//인포윈도우
let infowindow = (i,infowindows,markers,positions) => {
	document.querySelectorAll(".cars")[i].addEventListener("mouseenter",()=>{
		console.dir(infowindows);
		console.dir(markers);
		console.dir(positions[i]);
		infowindows[i].open(map, markers[i]);
	});

	document.querySelectorAll(".cars")[i].addEventListener("mouseleave",()=>{
		//infowindows[i].infowindow.close();
	});
}


//지도
let mapSelect = ()=>{
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var options = { //지도를 생성할 때 필요한 기본 옵션
		//center: new kakao.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
		center: new kakao.maps.LatLng($("#centerLat").val(), $("#centerLng").val()), //지도의 중심좌표.
		level: 5 //지도의 레벨(확대, 축소 정도)
	};

	//지도 생성 및 객체 리턴
	var map = new kakao.maps.Map(container, options);

	
	// 마커를 표시할 위치와 title 객체 배열입니다 
	var positions  = [];
	var contents = [];
	var markers = [];
	var infowindows = [];
	<c:forEach items="${requestScope.carList}" var="car" varStatus="status">
		positions["${status.index}"] = {"latlng": new kakao.maps.LatLng("${car.carParkingLat}", "${car.carParkingLng}")};
		contents["${status.index}"] = {"content": '<div style="padding:5px; text-align:center;">${car.carFee}</div>'};
		<%--console.dir("${status.index}");--%>
		<%--console.dir("${car}");--%>
	</c:forEach>
	<%--console.dir("${requestScope.carList}");--%>
	console.dir(positions);
	for (var i = 0; i < positions.length; i ++) {
		
		// 마커 이미지의 이미지 크기 입니다
		// var imageSize = new kakao.maps.Size(24, 35); 
		
		// 마커 이미지를 생성합니다	
		//var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
		
		// 마커를 생성합니다
		markers[i] = new kakao.maps.Marker({
			map: map, // 마커를 표시할 지도
			position: positions[i].latlng // 마커를 표시할 위치
			//title : positions[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
			//image : markerImage // 마커 이미지 
		});
		
		// 인포윈도우를 생성합니다
		infowindows[i] = new kakao.maps.InfoWindow({
			position : positions[i].latlng,
			content : contents[i].content
		});
		
		// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
		//infowindow.open(map, marker);
		document.querySelectorAll(".cars").forEach((e,index)=>{
			e.addEventListener("mouseenter",()=>{
				/*
				console.dir("index : " + index);
				console.dir(infowindows);
				console.dir(markers);
				*/
				infowindows[index].open(map, markers[index]);
			});
			
			e.addEventListener("mouseleave",()=>{
				/*
				console.dir("index : " + index);
				console.dir(infowindows);
				console.dir(markers);
				*/
				infowindows[index].close();
			});
		});
	}
	/*
	document.querySelectorAll(".cars").forEach((e,i)=>{
		e.addEventListener("mouseenter",()=>{
			infowindow.open();
		});
	});
	*/
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
	//입력값 검증
	let regDate = /^[0-9]{4}-([1-9]|0[1-9]|1[0-2])-([1-9]|0[1-9]|[1-2][0-9]|3[0-1])$/;
	let regHour = /^([0-9]|[0-1][0-9]|2[0-3])$/;
	
	if(!document.querySelector("#address").value.trim()){
		alert("주소를 입력하지 않았습니다.");
		return;
	}
	
	if(!regDate.test(document.querySelector("#pickup_date").value)){
		alert("픽업날짜가 형식에 맞지 않습니다.");
		return;
	}
	
	if(!regHour.test(document.querySelector("#pickup_hour").value)){
		alert("픽업시각이 형식에 맞지 않습니다.");
		return;
	}
	
	if(!regDate.test(document.querySelector("#return_date").value)){
		alert("반환날짜가 형식에 맞지 않습니다.");
		return;
	}
	
	if(!regHour.test(document.querySelector("#return_hour").value)){
		alert("반환시각이 형식에 맞지 않습니다.");
		return;
	}
	
	const now = new Date();
	
	let pickupDateHour = new Date(document.querySelector("#pickup_date").value);
	pickupDateHour.setHours(document.querySelector("#pickup_hour").value);
	if(pickupDateHour < now){
		alert("픽업시일을 지금보다 빠르게 설정할 수 없습니다.");
		return;
	}
	
	let returnDateHour = new Date(document.querySelector("#return_date").value);
	returnDateHour.setHours(document.querySelector("#return_hour").value);
	if(returnDateHour < now){
		alert("반환시일을 현재보다 빠르게 설정할 수 없습니다.");
		return;
	}
	
	if(returnDateHour <= pickupDateHour){
		alert("반환시일을 픽업시일보다 빠르거나 같도록 설정할 수 없습니다.");
		return;
	}
	
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

let insertLikey = async (carIdx) => {
	let url = "/likey/insert?car_idx="+carIdx;
	
	let response = await fetch(url,{
		"mehtod":"get"
	});
	
	console.dir(response);
	
	if(response.ok){
		//화면 다시 로딩
		window.location.reload();
	}
}

let deleteLikey = async (carIdx) => {
	let url = "/likey/delete?car_idx="+carIdx;
	
	let response = await fetch(url,{
		"mehtod":"get"
	});
	
	console.dir(response);
	
	if(response.ok){
		//화면 다시 로딩
		window.location.reload();
	}
}

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

