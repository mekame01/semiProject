<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<head>
<script src="/resources/js/jquery-3.3.1.min.js"></script>

<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.css" rel="stylesheet">
<link href="/resources/css/star-rating.css" media="all" rel="stylesheet" type="text/css" >
 
<!-- optionally if you need to use a theme, then include the theme file as mentioned below -->
<link href="/resources/themes/krajee-svg/theme.css" media="all" rel="stylesheet" type="text/css" >
 
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.0/jquery.js"></script>
<script src="/resources/js/star-rating.js" type="text/javascript"></script>
 
<!-- optionally if you need to use a theme, then include the theme file as mentioned below -->
<script src="/resources/themes/krajee-svg/theme.js"></script>
 
<!-- optionally if you need translation for your language then include locale file as mentioned below -->
<link href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css" rel="stylesheet">
<style type="text/css">
.body_split {
	display: flex;
}

.left {
	width: 60%;
}

.right {
	width: 40%;
}

.btn:focus {
	outline: none
}

.review > form {
	display: flex;
}

.user_id {
	display: flex;
	align-items: center;
	justify-content: center;
}

.desc {
	display: inline-block;
	text-align: right;
	width: 20%;
	margin: 0;
	min-width: 100px;
}

.updel {
	min-width: 25px;
}

.glyphicon .glyphicon-minus-sign:nover {
	background-color: black;
	display: none;
}

.caption {
	display: none;
}
.label .label-default .badge-secondary{
	display: none;
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
		</div>
	</div>
	
	<div class="site-section bg-light">
		<div class="container body_split">
			<div class="left">
				<div class="row">
					<h1 class="col-md-6 col-lg-12 mb-4"><strong>${requestScope.car.carModel}</strong></h1>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">아이디 : </p>${requestScope.car.userId}</div>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">연비 : </p>${requestScope.car.carFuelEffi}</div>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">연료 : </p>${requestScope.car.carFuelType}</div>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">문 : </p>${requestScope.car.carDoorNum}</div>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">좌석 : </p>${requestScope.car.carSeatNum}</div>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">변속기 : </p>${requestScope.car.carTransmission}</div>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">내비게이션 : </p>${requestScope.car.carNavi}</div>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">후방카메라 : </p>${requestScope.car.carBackCam}</div>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">참고사항 : </p>${requestScope.car.carNote}</div>
					<div class="col-md-6 col-lg-6 mb-4"><p class="desc">평점	 : </p>${requestScope.car.carAvgScore}</div>
				</div>
			</div>
			<div class="right">
				<img alt="" src="">
				<form id="frm_reservation" action="/reservation/insert">
					<input type="hidden" name="car_idx" id="car_idx" value="${requestScope.car.carIdx}">
					<input type="hidden" name="user_id" id="user_id" value="${requestScope.car.userId}">
					<div>위치 : <input name="parking" id="parking" style="border: none; width: 300px;" value="${requestScope.car.carParking}" disabled="disabled"></div>
					<input class="time" type="date" placeholder="픽업날짜" name="pickup_date" id="pickup_date" value="${requestScope.pickup_date}">
					<input class="time" type="number" min="0" max="23"  placeholder="픽업시각" name="pickup_hour" id="pickup_hour" style="width: 25%;" value="${requestScope.pickup_hour}">
					<input class="time" type="date" placeholder="반환날짜" name="return_date" id="return_date" value="${requestScope.return_date}">
					<input class="time" type="number" min="0" max="23" placeholder="반환시각" name="return_hour" id="return_hour" style="width: 25%;" value="${requestScope.return_hour}">
					<div>가격 : <input name="price" id="price" style="border: none; width: auto; text-align: right;" disabled="disabled">원</div>
					<input class="btn btn-primary btn-block py-3" id="btn_res" value="예약하기" type="submit">
				</form>
			</div>
		</div>
		<div class="review">
			<c:if test="${not empty sessionScope.user.userId and sessionScope.user.userId eq requestScope.reservationHistoryList[0].userId}">
				<form action="/review/insert" id="inp_review">
					<input type="hidden" name="res_idx" value="${requestScope.reservationHistoryList[0].resIdx}">
					<input type="hidden" name="car_idx" value="${requestScope.car.carIdx}">
					<div class="user_id col-md-6 col-lg-2 mb-4">${sessionScope.user.userId}</div>
					<textarea id="review_content" name="review_content" class="review_content col-md-6 col-lg-5 mb-4"></textarea>
					<div class="col-md-6 col-lg-3 mb-4">
						<input id="input-review" name="review_score" class="rating rating-loading" data-min="0" data-max="5" data-step="0.5">
					</div>
					<input type="button" id="btn_review" value="등록" class="btn btn-primary" onclick="insertReview()">
					<input type="button" class="btn_update" value="수정" class="updel btn btn-primary" style="display: none;">
					<input type="button" class="btn_delete" value="삭제" class="updel btn btn-primary" style="display: none;">
				</form>
			</c:if>
			<c:forEach var="review" items="${requestScope.reviewList}" varStatus="status">
				<form>
					<input type="hidden" id="review_idx${status.index}" value="${review.reviewIdx}">
					<input type="hidden" id="car_idx${status.index}" value="${review.carIdx}">
					<div class="user_id col-md-6 col-lg-2 mb-4">${review.userId}</div>
					<c:if test="${sessionScope.user.userId eq review.userId}">
						<textarea id="review_content${status.index}" name="review_content" class="review_content col-md-6 col-lg-5 mb-4">${review.reviewContent}</textarea>
					</c:if>
					<c:if test="${sessionScope.user.userId ne review.userId}">
						<textarea id="review_content${status.index}" name="review_content" class="review_content col-md-6 col-lg-5 mb-4" disabled="disabled">${review.reviewContent}</textarea>
					</c:if>
					<div class="review_rating col-md-6 col-lg-3 mb-4">
						<c:if test="${sessionScope.user.userId eq review.userId}">
							<input id="input-review${status.index}" name="review_score" value="${review.reviewScore}" class="rating rating-loading" data-min="0" data-max="5" data-step="0.5">
							<input type="button" id="btn_review" value="등록" class="btn btn-primary" style="display: none;">
							<input type="button" class="btn_update" value="수정" class="updel btn btn-primary" onclick="updateReview(${status.index})">
							<input type="button" class="btn_delete" value="삭제" class="updel btn btn-primary" onclick="deleteReview(${status.index})">
						</c:if>
						<c:if test="${sessionScope.user.userId ne review.userId}">
							<input id="input-review${status.index}" name="review_score" value="${review.reviewScore}" class="rating rating-loading" data-min="0" data-max="5" data-step="0.5" disabled="disabled">
						</c:if>
					</div>
				</form>
			</c:forEach>
		</div>
	</div>
	<%@ include file="/WEB-INF/view/include/footer.jsp" %>

</div>
<script type="text/javascript">
//전역변수 선언 및 초기화
let prevPickupDate = document.querySelector("#pickup_date").value;
let prevPickupHour = document.querySelector("#pickup_hour").value;
let prevReturnDate = document.querySelector("#return_date").value;
let prevReturnHour = document.querySelector("#return_hour").value;

console.dir("sessionScope.user.userId");
console.dir("${sessionScope.user.userId}");
console.dir("requestScope.reservationHistoryList");
console.dir("${requestScope.reservationHistoryList[0]}");
console.dir("${requestScope.reservationHistoryList[0].userId}");
console.dir("${fn:length(requestScope.reviewList)}");
console.dir("${requestScope.reviewList}");
console.dir("${requestScope.reviewList[0]}");
console.dir("${requestScope.reviewList[0].reviewScore}");

<%--
//평점 변경에 따른 값 세팅
document.querySelectorAll("input[name=rating]").forEach((e,i)=>{
	//console.dir("==========input[name=rating]==========");
	//console.dir(e);
	//console.dir(i);
	e.addEventListener("click",(event)=>{
		console.dir("==========reviewScore==========");
		console.dir(e);
		console.dir(e.value);
		console.dir(event);
		console.dir(event.target.value);
		reviewScore = event.target.value;
		//console.dir(reviewScore);
	});
});
--%>

<%--
for(let i = 0; i < "${fn:length(requestScope.reviewList)}"; i++){
	reviewScoreList[i] = "${requestScope.reviewList[i].reviewScore}";
	console.dir("reviewScoreList[i]");
	console.dir(reviewScoreList[i]);
	document.querySelectorAll("input[name=rating"+i+"]").forEach((e)=>{
		console.dir("==========input[name=rating"+i+"]==========");
		console.dir(e);
		//console.dir(i);
		e.addEventListener("click",(event)=>{
			console.dir("==========reviewScore==========");
			console.dir(e);
			console.dir(e.value);
			console.dir(event);
			console.dir(event.target.value);
			reviewScoreList[i] = event.target.value;
			//console.dir(reviewScore);
		});
	});
}
--%>
//화면 입력값 초기화
/*
$("#car_idx").val("${requestScope.car.carIdx}");
$("#pickup_date").val("${requestScope.pickup_date}");
$("#pickup_hour").val("${requestScope.pickup_hour}");
$("#return_date").val("${requestScope.return_date}");
$("#return_hour").val("${requestScope.return_hour}");
*/

//시간 변경에 따른 가격 세팅
document.querySelectorAll("input[class=time]").forEach((e,i)=>{
	e.addEventListener("change",(event)=>{
		calculatePrice(event,i);
	});
});

//시간을 이전 값으로 변경
let setPrevValue = (event,i) => {
	if(i==0){
		document.querySelector("#pickup_date").value = prevPickupDate;
	}else if(i==1){
		document.querySelector("#pickup_hour").value = prevPickupHour;
	}else if(i==2){
		document.querySelector("#return_date").value = prevReturnDate;
	}else if(i==3){
		document.querySelector("#return_hour").value = prevReturnHour;
	}
}

//가격계산
let calculatePrice = (event,i) => {
	let pickupDateArr = document.querySelector("#pickup_date").value.split("-");
	let returnDateArr = document.querySelector("#return_date").value.split("-");
	let pickupDate = new Date(pickupDateArr[0], pickupDateArr[1]-1, pickupDateArr[2], document.querySelector("#pickup_hour").value);
	let returnDate = new Date(returnDateArr[0], returnDateArr[1]-1, returnDateArr[2], document.querySelector("#return_hour").value);
	const now = new Date();
	
	console.dir("==========pickupDate==========");
	console.dir(pickupDate);
	console.dir(returnDate);
	console.dir(now);
	
	if(pickupDate >= returnDate){
		alert("픽업시간이 반환시간보다 빠르거나 같습니다.");
		setPrevValue(event,i);
	}else if(pickupDate <= now){
		alert("픽업시간이 현재시간보다 빠르거나 같습니다.");
		setPrevValue(event,i);
	}else if(returnDate <= now){
		alert("반환시간이 현재시간보다 빠르거나 같습니다.");
		setPrevValue(event,i);
	}else{
		prevPickupDate = document.querySelector("#pickup_date").value;
		prevPickupHour = document.querySelector("#pickup_hour").value;
		prevReturnDate = document.querySelector("#return_date").value;
		prevReturnHour = document.querySelector("#return_hour").value;
		
		let hours = (returnDate.getTime()-pickupDate.getTime()) /1000 /60 /60;
		console.dir("==========hours시작==========");
		console.dir(pickupDateArr);
		console.dir(pickupDate);
		console.dir(returnDateArr);
		console.dir(returnDate);
		console.dir(hours); 
		console.dir("==========hours끝==========");
		
		console.dir(hours);
		console.dir("${requestScope.car.carFee}");
		console.dir(hours*"${requestScope.car.carFee}");
		console.dir(hours * Number("${requestScope.car.carFee}"));
		document.querySelector("#price").value = hours * "${requestScope.car.carFee}";
	}
}

//가격세팅 초기화
calculatePrice();

document.querySelector("#frm_reservation").addEventListener("submit",(e)=>{
	if(!"${sessionScope.user.userId}"){
		alert("예약하기 전에 로그인하셔야 합니다.");
		location.href="/member/login";
		e.preventDefault();
	}
});

//리뷰등록
/*
let insertReview = () => {
	if(document.querySelector("#input-review").value == 0) {
		alert("리뷰 평점이 없습니다.");
		return;
	}
	
	//리뷰 입력
	insertReviewStep1();
}
*/
//평점 검증
let insertReview = (e) => {
	if(document.querySelector("#input-review").value == 0) {
		alert("리뷰 평점이 없습니다.");
		return;
	} else{
		insertReviewStep1();
	}
}


let insertReviewStep1 = async () => {
	let url = "/review/insert?user_id=${sessionScope.user.userId}"
		+"&res_idx=${requestScope.reservationHistoryList[0].resIdx}"
		+"&car_idx=${requestScope.car.carIdx}"
		+"&review_score=" + document.querySelector("#input-review").value
		+"&review_content=" + document.querySelector("#review_content").value;
	console.dir(url);
	
	let response = await fetch(url,{
		"method": "get"
	});
	console.dir(response);
	
	if(response.status){
		alert("리뷰가 성공적으로 등록되었습니다.");
		
		//화면 다시 로딩
		//이럴거면 그냥 form 쓰면 되지 않나?
		window.location.reload();
	}else{
		alert("리뷰 등록에 실패하셨습니다.");
	}
}


let updateReview = (i) => {
	if(document.querySelector("#input-review"+i).value == 0) {
		alert("리뷰 평점이 없습니다.");
		return;
	} else{
		updateReviewStep(i);
	}
}

let updateReviewStep = async (i) => {
	let url = "/review/update?review_idx=" + document.querySelector("#review_idx"+i).value
		+"&car_idx=" + document.querySelector("#car_idx"+i).value
		+"&review_score=" + document.querySelector("#input-review"+i).value
		+"&review_content=" + document.querySelector("#review_content"+i).value;
	console.dir(url);
	
	let response = await fetch(url,{
		"method": "get"
	});
	console.dir(response);
	
	if(response.status){
		alert("리뷰가 성공적으로 수정되었습니다.");
		
		//화면 다시 로딩
		window.location.reload();
	}else{
		alert("리뷰 수정에 실패하셨습니다.");
	}
	
}

let deleteReview = (i) => {
	if(document.querySelector("#input-review"+i).value == 0) {
		alert("리뷰 평점이 없습니다.");
		return;
	} else{
		if(confirm("삭제하시겠습니까?")){
			deleteReviewStep(i);
		}
	}
}

let deleteReviewStep = async (i) => {
	let url = "/review/delete?review_idx=" + document.querySelector("#review_idx"+i).value
		+"&car_idx=" + document.querySelector("#car_idx"+i).value;
	console.dir(url);
	
	let response = await fetch(url,{
		"method": "get"
	});
	console.dir(response);
	
	if(response.status){
		alert("리뷰가 성공적으로 삭제되었습니다.");
		
		//화면 다시 로딩
		window.location.reload();
	}else{
		alert("리뷰 삭제에 실패하셨습니다.");
	}
	
}

//리뷰 페이징 필요하면 사용
/*
let page = 1;
window.addEventListener("scroll",()=>{
	if(window.scrollY >= document.body.clientHeight - window.innerHeight) {
		//리뷰 더 불러오기
		page++;
	}
});
*/


</script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.sticky.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/jquery.animateNumber.min.js"></script>
<script src="/resources/js/jquery.fancybox.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/bootstrap-datepicker.min.js"></script>
<script src="/resources/js/aos.js"></script>
<script src="/resources/js/main.js"></script>
</body>
</html>