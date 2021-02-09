<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<head>
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

/* Ratings widget */
.rate {
	display: inline-block;
	border: 0;
}
/* Hide radio */
.rate > input {
	display: none;
}
/* Order correctly by floating highest to the right */
.rate > label {
	float: right;
}
/* The star of the show */
.rate > label:before {
	display: inline-block;
	font-size: 1.1rem;
	padding: .3rem .2rem;
	margin: 0;
	cursor: pointer;
	font-family: FontAwesome;
	content: "\f005 "; /* full star */
}
/* Zero stars rating */
.rate > label:last-child:before {
	content: "\f006 "; /* empty star outline */
}
/* Half star trick */
.rate .half:before {
	content: "\f089 "; /* half star no outline */
	position: absolute;
	padding-right: 0;
}
/* Click + hover color */
input:checked ~ label, /* color current and previous stars on checked */
label:hover, label:hover ~ label { color: #73B100;  } /* color previous stars on hover */

/* Hover highlights */
input:checked + label:hover, input:checked ~ label:hover, /* highlight current and previous stars */
input:checked ~ label:hover ~ label, /* highlight previous selected stars for new rating */
label:hover ~ input:checked ~ label /* highlight previous selected stars */ { color: #A6E72D;  } 
	
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

					<div class="col-9  text-right">
				  
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
					<form action="/reservation/insert">
						<input type="hidden" name="car_idx" id="car_idx" value="${requestScope.car.carIdx}">
						<input type="hidden" name="user_id" id="user_id" value="${requestScope.car.userId}">
						<div>위치 : <input name="parking" id="parking" style="border: none; width: auto;" value="${requestScope.car.carParking}"></div>
						<input class="time" type="date" placeholder="픽업날짜" name="pickup_date" id="pickup_date" value="${requestScope.pickup_date}">
						<input class="time" type="number" min="0" max="23"  placeholder="픽업시각" name="pickup_hour" id="pickup_hour" style="width: 25%;" value="${requestScope.pickup_hour}">
						<input class="time" type="date" placeholder="반환날짜" name="return_date" id="return_date" value="${requestScope.return_date}">
						<input class="time" type="number" min="0" max="23" placeholder="반환시각" name="return_hour" id="return_hour" style="width: 25%;" value="${requestScope.return_hour}">
						<div>가격 : <input name="price" id="price" style="border: none; width: auto; margin-bottom: 5px;">원</div>
						<input class="btn btn-primary btn-block py-3" id="btn_res" value="예약하기" type="submit">
					</form>
				</div>
			</div>
			<div class="review">
				<c:if test="${sessionScope.user.userId eq requestScope.reservationHistoryList[0].userId}">
					<form id="inp_review">
						<div class="user_id col-md-6 col-lg-2 mb-4">${sessionScope.user.userId}</div>
						<textarea id="review_content" class="review_content col-md-6 col-lg-6 mb-4"></textarea>
						<div class="col-md-6 col-lg-2 mb-4">
							<h1>평점</h1>
							<input type="hidden" id="review_score">
							<fieldset class="rate">
								<input type="radio" id="rating10" name="rating" value="5" /><label for="rating10" title="5"></label>
								<input type="radio" id="rating9" name="rating" value="4.5" /><label class="half" for="rating9" title="4.5"></label>
								<input type="radio" id="rating8" name="rating" value="4" /><label for="rating8" title="4"></label>
								<input type="radio" id="rating7" name="rating" value="3.5" /><label class="half" for="rating7" title="3.5"></label>
								<input type="radio" id="rating6" name="rating" value="3" /><label for="rating6" title="3"></label>
								<input type="radio" id="rating5" name="rating" value="2.5" /><label class="half" for="rating5" title="2.5"></label>
								<input type="radio" id="rating4" name="rating" value="2" /><label for="rating4" title="2"></label>
								<input type="radio" id="rating3" name="rating" value="1.5" /><label class="half" for="rating3" title="1.5"></label>
								<input type="radio" id="rating2" name="rating" value="1" /><label for="rating2" title="1"></label>
								<input type="radio" id="rating1" name="rating" value="0.5" /><label class="half" for="rating1" title="0.5"></label>
							</fieldset>
						</div>
						<input type="button" id="btn_review" value="등록" class="btn btn-primary">
						<input type="button" class="btn_update" value="수정" class="updel btn btn-primary" style="display: none;">
						<input type="button" class="btn_delete" value="삭제" class="updel btn btn-primary" style="display: none;">
					</form>
				</c:if>
				<c:forEach var="review" items="${requestScope.reviewList}" varStatus="status">
					<form>
						<div class="user_id col-md-6 col-lg-2 mb-4">${review.userId}</div>
						<textarea id="review_content" class="review_content col-md-6 col-lg-6 mb-4" disabled="disabled">${review.reviewContent}</textarea>
						<div class="review_rating col-md-6 col-lg-2 mb-4">
							<h1>평점</h1>
							<input type="hidden" class="review_score${status.index}" value="${review.reviewScore}">
							<fieldset class="rate" disabled="disabled">
								<c:if test="${review.reviewScore eq 5}">
									<input type="radio" id="rating${status.index}10" name="rating${status.index}" value="5" checked="checked"/><label for="rating10" title="5"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 5}">
									<input type="radio" id="rating${status.index}10" name="rating${status.index}" value="5"/><label for="rating10" title="5"></label>
								</c:if>
								<c:if test="${review.reviewScore eq 4.5}">
									<input type="radio" id="rating${status.index}9" name="rating${status.index}" value="4.5" checked="checked"/><label class="half" for="rating9" title="4.5"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 4.5}">
									<input type="radio" id="rating${status.index}9" name="rating${status.index}" value="4.5"/><label class="half" for="rating9" title="4.5"></label>
								</c:if>
								<c:if test="${review.reviewScore eq 4}">
									<input type="radio" id="rating${status.index}8" name="rating${status.index}" value="4" checked="checked"/><label for="rating8" title="4"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 4}">
									<input type="radio" id="rating${status.index}8" name="rating${status.index}" value="4"/><label for="rating8" title="4"></label>
								</c:if>
								<c:if test="${review.reviewScore eq 3.5}">
									<input type="radio" id="rating${status.index}7" name="rating${status.index}" value="3.5" checked="checked"/><label class="half" for="rating7" title="3.5"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 3.5}">
									<input type="radio" id="rating${status.index}7" name="rating${status.index}" value="3.5"/><label class="half" for="rating7" title="3.5"></label>
								</c:if>
								<c:if test="${review.reviewScore eq 3}">
									<input type="radio" id="rating${status.index}6" name="rating${status.index}" value="3" checked="checked"/><label for="rating6" title="3"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 3}">
									<input type="radio" id="rating${status.index}6" name="rating${status.index}" value="3"/><label for="rating6" title="3"></label>
								</c:if>
								<c:if test="${review.reviewScore eq 2.5}">
									<input type="radio" id="rating${status.index}5" name="rating${status.index}" value="2.5" checked="checked"/><label class="half" for="rating5" title="2.5"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 2.5}">
									<input type="radio" id="rating${status.index}5" name="rating${status.index}" value="2.5"/><label class="half" for="rating5" title="2.5"></label>
								</c:if>
								<c:if test="${review.reviewScore eq 2}">
									<input type="radio" id="rating${status.index}4" name="rating${status.index}" value="2" checked="checked"/><label for="rating4" title="2"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 2}">
									<input type="radio" id="rating${status.index}4" name="rating${status.index}" value="2"/><label for="rating4" title="2"></label>
								</c:if>
								<c:if test="${review.reviewScore eq 1.5}">
									<input type="radio" id="rating${status.index}3" name="rating${status.index}" value="1.5" checked="checked"/><label class="half" for="rating3" title="1.5"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 1.5}">
									<input type="radio" id="rating${status.index}3" name="rating${status.index}" value="1.5"/><label class="half" for="rating3" title="1.5"></label>
								</c:if>
								<c:if test="${review.reviewScore eq 1}">
									<input type="radio" id="rating${status.index}2" name="rating${status.index}" value="1" checked="checked"/><label for="rating2" title="1"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 1}">
									<input type="radio" id="rating${status.index}2" name="rating${status.index}" value="1"/><label for="rating2" title="1"></label>
								</c:if>
								<c:if test="${review.reviewScore eq 0.5}">
									<input type="radio" id="rating${status.index}1" name="rating${status.index}" value="0.5" checked="checked"/><label class="half" for="rating1" title="0.5"></label>
								</c:if>
								<c:if test="${review.reviewScore ne 0.5}">
									<input type="radio" id="rating${status.index}1" name="rating${status.index}" value="0.5"/><label class="half" for="rating1" title="0.5"></label>
								</c:if>
								<c:if test="${sessionScope.user.userId eq review.userId}">
									<input type="button" id="btn_review" value="등록" class="btn btn-primary" style="display: none;">
									<input type="button" class="btn_update" value="수정" class="updel btn btn-primary">
									<input type="button" class="btn_delete" value="삭제" class="updel btn btn-primary">
								</c:if>
							</fieldset>
						</div>
					</form>
				</c:forEach>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/footer.jsp" %>
	
	</div>
<%@ include file="/WEB-INF/view/include/script.jsp" %>
<script type="text/javascript">
//전역변수 선언 및 초기화
let prevPickupDate = document.querySelector("#pickup_date").value;
let prevPickupHour = document.querySelector("#pickup_hour").value;
let prevReturnDate = document.querySelector("#return_date").value;
let prevReturnHour = document.querySelector("#return_hour").value;
let reviewScore;

console.dir("sessionScope.user.userId");
console.dir("${sessionScope.user.userId}");
console.dir("requestScope.reservationHistoryList");
console.dir("${requestScope.reservationHistoryList[0]}");
console.dir("${requestScope.reservationHistoryList[0].userId}");

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
	let pickupDate = new Date(pickupDateArr[0], pickupDateArr[1], pickupDateArr[2], document.querySelector("#pickup_hour").value);
	let returnDate = new Date(returnDateArr[0], returnDateArr[1], returnDateArr[2], document.querySelector("#return_hour").value);
	let now = new Date();
	
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

//리뷰등록
document.querySelector("#btn_review").addEventListener("click",()=>{
	if(!reviewScore || reviewScore == 0) {
		alert("리뷰 평점이 없습니다.");
		return;
	}
	
	//리뷰 입력
	reviewInsert();
});

let reviewInsert = async () => {
	let url = "/review/insert?user_id=${sessionScope.user.userId}"
		+"&res_idx=${requestScope.reservationHistoryList[0].resIdx}"
		+"&car_idx=${requestScope.car.carIdx}"
		+"&review_score=" + reviewScore
		+"&review_content=" + document.querySelector("#review_content").value;
	console.dir(url);
	
	let response = await fetch(url,{
		"method": "get"
	});
	console.dir(response);
	
	if(response.status){
		alert("리뷰가 성공적으로 등록되었습니다.");
	}else{
		alert("리뷰 등록에 실패하셨습니다.");
	}
	
	//리뷰 제일 앞에 추가가 아니라 수정 삭제로 변경
	let inpReview = document.querySelector("#inp_review");
	console.dir(inpReview);
	inpReview[13].style="display: none";
	inpReview[14].style="display: block";
	inpReview[15].style="display: block";
	let reviewSect = document.querySelector(".review");
	//리뷰 입력창 삭제
}

//리뷰 페이징 필요하면 사용
let page = 1;
window.addEventListener("scroll",()=>{
	if(window.scrollY >= document.body.clientHeight - window.innerHeight) {
		//리뷰 더 불러오기
		page++;
	}
});



</script>
</body>
</html>