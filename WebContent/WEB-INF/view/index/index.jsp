<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp"%>
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

	<div class="hero" style="background-image: url('/resources/images/hero_1_a.jpg');">
		<div class="container">
			<div class="row align-items-center justify-content-center">
				<div class="col-lg-10">
					<div class="row mb-5">
						<div class="col-lg-7 intro">
							<h1>
								<strong>Rent a car</strong>is within your finger tips.
							</h1>
						</div>
					</div>

					<form action="/rent/load" class="trip-form" id="frm_select">
						<input type="hidden" name="kakaoAddress" id="kakaoAddress" value="">
						<input type="hidden" name="centerLat" id="centerLat">
						<input type="hidden" name="centerLng" id="centerLng">
						<div class="row align-items-center">
							<div class="mb-3 mb-md-0 col-md-3">
								<input name="address" id="address" type="text" placeholder="주소입력" class="form-control" required="required">
							</div>
							<div class="mb-3 mb-md-0 col-md-3">
								<div class="form-control-wrap">
									<input type="text" name="pickup_date" id="pickup_date" placeholder="픽업 날짜" class="form-control datepicker px-3" required="required">
									<span class="icon icon-date_range"> </span>
								</div>
								<div>
									<input type="number" min="0" max="23" name="pickup_hour" id="pickup_hour" placeholder="픽업 시각" class="form-control px-3" required="required">
								</div>
							</div>
							<div class="mb-3 mb-md-0 col-md-3">
								<div class="form-control-wrap">
									<input type="text" name="return_date" id="return_date" placeholder="반환 날짜" class="form-control datepicker px-3" required="required">
									<span class="icon icon-date_range"> </span>
								</div>
								<div>
									<input type="number" min="0" max="23" name="return_hour" id="return_hour" placeholder="반환 시각" class="form-control px-3" required="required">
								</div>
							</div>
							<div class="mb-3 mb-md-0 col-md-3">
								<button type="button" value="Search Now" class="btn btn-primary btn-block py-3"	onclick="kakaoAddr()">Search Now</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section">
		<div class="container">
			<h2 class="section-heading">
				<strong>How it works?</strong>
			</h2>
			<p class="mb-5">Easy steps to get you started</p>

			<div class="row mb-5">
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="step">
						<span>1</span>
						<div class="step-inner">
							<span class="number text-primary">01.</span>
							<h3>Select a car</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Vero, laboriosam!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="step">
						<span>2</span>
						<div class="step-inner">
							<span class="number text-primary">02.</span>
							<h3>Fill up form</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Vero, laboriosam!</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="step">
						<span>3</span>
						<div class="step-inner">
							<span class="number text-primary">03.</span>
							<h3>Payment</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Vero, laboriosam!</p>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 mx-auto">
					<a href="#" class="d-flex align-items-center play-now mx-auto">
						<span class="icon">
							<span class="icon-play"></span>
						</span>
						<span class="caption">Video how it works</span>
					</a>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7 text-center order-lg-2">
					<div class="img-wrap-1 mb-5">
						<img src="resources/images/feature_01.png" alt="Image" class="img-fluid">
					</div>
				</div>
				<div class="col-lg-4 ml-auto order-lg-1">
					<h3 class="mb-4 section-heading">
						<strong>You can easily avail our promo for renting a car.</strong>
					</h3>
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Repudiandae, explicabo iste a labore id est
						quas, doloremque veritatis! Provident odit pariatur dolorem
						quisquam, voluptatibus voluptates optio accusamus, vel quasi
						quidem!</p>

					<p>
						<a href="#" class="btn btn-primary">Meet them now</a>
					</p>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<h2 class="section-heading">
						<strong>Car Listings</strong>
					</h2>
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit.</p>
				</div>
			</div>


			<div class="row">
				<div class="col-md-6 col-lg-4 mb-4">

					<div class="listing d-block  align-items-stretch">
						<div class="listing-img h-100 mr-4">
							<img src="/resources/images/car_6.jpg" alt="Image" class="img-fluid">
						</div>
						<div class="listing-contents h-100">
							<h3>Mitsubishi Pajero</h3>
							<div class="rent-price">
								<strong>$389.00</strong><span class="mx-1">/</span>day
							</div>
							<div class="d-block d-md-flex mb-3 border-bottom pb-3">
								<div class="listing-feature pr-4">
									<span class="caption">Luggage:</span> <span class="number">8</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Doors:</span> <span class="number">4</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Passenger:</span> <span class="number">4</span>
								</div>
							</div>
							<div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit. Quos eos at eum, voluptatem quibusdam.</p>
								<p>
									<a href="#" class="btn btn-primary btn-sm">Rent Now</a>
								</p>
							</div>
						</div>

					</div>
				</div>

				<div class="col-md-6 col-lg-4 mb-4">

					<div class="listing d-block  align-items-stretch">
						<div class="listing-img h-100 mr-4">
							<img src="/resources/images/car_5.jpg" alt="Image"class="img-fluid">
						</div>
						<div class="listing-contents h-100">
							<h3>Nissan Moco</h3>
							<div class="rent-price">
								<strong>$389.00</strong><span class="mx-1">/</span>day
							</div>
							<div class="d-block d-md-flex mb-3 border-bottom pb-3">
								<div class="listing-feature pr-4">
									<span class="caption">Luggage:</span> <span class="number">8</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Doors:</span> <span class="number">4</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Passenger:</span> <span class="number">4</span>
								</div>
							</div>
							<div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit. Quos eos at eum, voluptatem quibusdam.</p>
								<p>
									<a href="#" class="btn btn-primary btn-sm">Rent Now</a>
								</p>
							</div>
						</div>

					</div>
				</div>


				<div class="col-md-6 col-lg-4 mb-4">

					<div class="listing d-block  align-items-stretch">
						<div class="listing-img h-100 mr-4">
							<img src="/resources/images/car_4.jpg" alt="Image" class="img-fluid">
						</div>
						<div class="listing-contents h-100">
							<h3>Honda Fitta</h3>
							<div class="rent-price">
								<strong>$389.00</strong><span class="mx-1">/</span>day
							</div>
							<div class="d-block d-md-flex mb-3 border-bottom pb-3">
								<div class="listing-feature pr-4">
									<span class="caption">Luggage:</span> <span class="number">8</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Doors:</span> <span class="number">4</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Passenger:</span> <span class="number">4</span>
								</div>
							</div>
							<div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit. Quos eos at eum, voluptatem quibusdam.</p>
								<p>
									<a href="#" class="btn btn-primary btn-sm">Rent Now</a>
								</p>
							</div>
						</div>

					</div>
				</div>

				<div class="col-md-6 col-lg-4 mb-4">

					<div class="listing d-block  align-items-stretch">
						<div class="listing-img h-100 mr-4">
							<img src="/resources/images/car_3.jpg" alt="Image" class="img-fluid">
						</div>
						<div class="listing-contents h-100">
							<h3>Skoda Laura</h3>
							<div class="rent-price">
								<strong>$389.00</strong><span class="mx-1">/</span>day
							</div>
							<div class="d-block d-md-flex mb-3 border-bottom pb-3">
								<div class="listing-feature pr-4">
									<span class="caption">Luggage:</span> <span class="number">8</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Doors:</span> <span class="number">4</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Passenger:</span> <span class="number">4</span>
								</div>
							</div>
							<div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit. Quos eos at eum, voluptatem quibusdam.</p>
								<p>
									<a href="#" class="btn btn-primary btn-sm">Rent Now</a>
								</p>
							</div>
						</div>

					</div>
				</div>

				<div class="col-md-6 col-lg-4 mb-4">

					<div class="listing d-block  align-items-stretch">
						<div class="listing-img h-100 mr-4">
							<img src="/resources/images/car_2.jpg" alt="Image" class="img-fluid">
						</div>
						<div class="listing-contents h-100">
							<h3>Mazda LaPuta</h3>
							<div class="rent-price">
								<strong>$389.00</strong><span class="mx-1">/</span>day
							</div>
							<div class="d-block d-md-flex mb-3 border-bottom pb-3">
								<div class="listing-feature pr-4">
									<span class="caption">Luggage:</span> <span class="number">8</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Doors:</span> <span class="number">4</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Passenger:</span> <span class="number">4</span>
								</div>
							</div>
							<div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit. Quos eos at eum, voluptatem quibusdam.</p>
								<p>
									<a href="#" class="btn btn-primary btn-sm">Rent Now</a>
								</p>
							</div>
						</div>

					</div>
				</div>

				<div class="col-md-6 col-lg-4 mb-4">

					<div class="listing d-block  align-items-stretch">
						<div class="listing-img h-100 mr-4">
							<img src="/resources/images/car_1.jpg" alt="Image" class="img-fluid">
						</div>
						<div class="listing-contents h-100">
							<h3>Buick LaCrosse</h3>
							<div class="rent-price">
								<strong>$389.00</strong><span class="mx-1">/</span>day
							</div>
							<div class="d-block d-md-flex mb-3 border-bottom pb-3">
								<div class="listing-feature pr-4">
									<span class="caption">Luggage:</span> <span class="number">8</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Doors:</span> <span class="number">4</span>
								</div>
								<div class="listing-feature pr-4">
									<span class="caption">Passenger:</span> <span class="number">4</span>
								</div>
							</div>
							<div>
								<p>Lorem ipsum dolor sit amet, consectetur adipisicing
									elit. Quos eos at eum, voluptatem quibusdam.</p>
								<p>
									<a href="#" class="btn btn-primary btn-sm">Rent Now</a>
								</p>
							</div>
						</div>

					</div>
				</div>

			</div>
		</div>
	</div>

	<div class="site-section">
		<div class="container">
			<div class="row">
				<div class="col-lg-7">
					<h2 class="section-heading">
						<strong>Features</strong>
					</h2>
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit.</p>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-4 mb-5">
					<div class="service-1 dark">
						<span class="service-1-icon"> <span class="icon-home"></span>
						</span>
						<div class="service-1-contents">
							<h3>Lorem ipsum dolor</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Obcaecati, laboriosam.</p>
							<p class="mb-0">
								<a href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-5">
					<div class="service-1 dark">
						<span class="service-1-icon"> <span class="icon-gear"></span>
						</span>
						<div class="service-1-contents">
							<h3>Lorem ipsum dolor</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Obcaecati, laboriosam.</p>
							<p class="mb-0">
								<a href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-5">
					<div class="service-1 dark">
						<span class="service-1-icon"> 
							<span class="icon-watch_later"></span>
						</span>
						<div class="service-1-contents">
							<h3>Lorem ipsum dolor</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Obcaecati, laboriosam.</p>
							<p class="mb-0">
								<a href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>

				<div class="col-lg-4 mb-5">
					<div class="service-1 dark">
						<span class="service-1-icon">
							<span	class="icon-verified_user"></span>
						</span>
						<div class="service-1-contents">
							<h3>Lorem ipsum dolor</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Obcaecati, laboriosam.</p>
							<p class="mb-0">
								<a href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-5">
					<div class="service-1 dark">
						<span class="service-1-icon">
							<span class="icon-video_library"></span>
						</span>
						<div class="service-1-contents">
							<h3>Lorem ipsum dolor</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Obcaecati, laboriosam.</p>
							<p class="mb-0">
								<a href="#">Learn more</a>
							</p>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-5">
					<div class="service-1 dark">
						<span class="service-1-icon">
							<span class="icon-vpn_key"></span>
						</span>
						<div class="service-1-contents">
							<h3>Lorem ipsum dolor</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
								Obcaecati, laboriosam.</p>
							<p class="mb-0">
								<a href="#">Learn more</a>
							</p>
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
					<h2 class="section-heading">
						<strong>Testimonials</strong>
					</h2>
					<p class="mb-5">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit.</p>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="testimonial-2">
						<blockquote class="mb-4">
							<p>"Lorem ipsum dolor sit amet, consectetur adipisicing
								elit. Voluptatem, deserunt eveniet veniam. Ipsam, nam,
								voluptatum"</p>
						</blockquote>
						<div class="d-flex v-card align-items-center">
							<img src="/resources/images/person_1.jpg" alt="Image"
								class="img-fluid mr-3">
							<div class="author-name">
								<span class="d-block">Mike Fisher</span> <span>Owner,
									Ford</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="testimonial-2">
						<blockquote class="mb-4">
							<p>"Lorem ipsum dolor sit amet, consectetur adipisicing
								elit. Voluptatem, deserunt eveniet veniam. Ipsam, nam,
								voluptatum"</p>
						</blockquote>
						<div class="d-flex v-card align-items-center">
							<img src="/resources/images/person_2.jpg" alt="Image" class="img-fluid mr-3">
							<div class="author-name">
								<span class="d-block">Jean Stanley</span> <span>Traveler</span>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 mb-4 mb-lg-0">
					<div class="testimonial-2">
						<blockquote class="mb-4">
							<p>"Lorem ipsum dolor sit amet, consectetur adipisicing
								elit. Voluptatem, deserunt eveniet veniam. Ipsam, nam,
								voluptatum"</p>
						</blockquote>
						<div class="d-flex v-card align-items-center">
							<img src="/resources/images/person_3.jpg" alt="Image"
								class="img-fluid mr-3">
							<div class="author-name">
								<span class="d-block">Katie Rose</span> <span>Customer</span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="site-section bg-primary py-5">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-7 mb-4 mb-md-0">
					<h2 class="mb-0 text-white">What are you waiting for?</h2>
					<p class="mb-0 opa-7">Lorem ipsum dolor sit amet, consectetur
						adipisicing elit. Obcaecati, laboriosam.</p>
				</div>
				<div class="col-lg-5 text-md-right">
					<a href="#" class="btn btn-primary btn-white">Rent a car now</a>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/view/include/footer.jsp"%>
</div>

<%@ include file="/WEB-INF/view/include/script.jsp"%>
<script type="text/javascript">
//일자, 시각 초기화
pickup_date.value = getToday();
return_date.value = getTomorrow();
let hours = getHours();
pickup_hour.value = hours;
return_hour.value = hours;

function getToday(){
	let date = new Date();
	date.setHours(date.getHours()+2);
	let year = date.getFullYear();
	let month = ("0" + (1 + date.getMonth())).slice(-2);
	let day = ("0" + date.getDate()).slice(-2);

	return month + "/" + day + "/" + year;
}

function getTomorrow(){
	let date = new Date();
	date.setDate(date.getDate() + 1);
	date.setHours(date.getHours()+2);
	let year = date.getFullYear();
	let month = ("0" + (1 + date.getMonth())).slice(-2);
	let day = ("0" + (date.getDate())).slice(-2);

	return month + "/" + day + "/" + year;
}

function getHours(){
	let date = new Date();
	date.setHours(date.getHours()+2);
	return date.getHours();
}

let kakaoAddr = async (e)=>{
	//입력값 검증
	let regDate = /^([1-9]|0[1-9]|1[0-2])\/([1-9]|0[1-9]|[1-2][0-9]|3[0-1])\/[0-9]{4}$/;
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
	console.dir(response);
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


/* $("#frm_select").on("submit", async (e)=>{
	//e.preventDefault();
	let keyword = $("#address").val();
	console.dir($("#address").val());
	console.dir(keyword);
	const KAKAO_API_IEY = "KakaoAK 8f0a8bf7d90077ec52cc56e4a88c0fcd";
	
	let url = "https://dapi.kakao.com/v2/local/search/address.json?query="+keyword;
	console.dir(url);
	let headerObj = new Headers();
	headerObj.append("Authorization",KAKAO_API_IEY);
	await fetch(url,{
		"method": "get",
		"headers": headerObj
	})
	.then((response)=>response.json())
	.then((obj)=>{
		console.dir(obj);
		console.dir(obj.documents[0].address_name);
		let adrressNameArr = obj.documents[0].address_name.split(" ");
		
		$("#address").val(adrressNameArr[0] + " " + adrressNameArr[1]);
		//$("#address").val(obj.documents[0].address_name);
		$("#kakaoAddress").val(adrressNameArr[0] + " " + adrressNameArr[1]);
		console.dir($("#address").val());
		console.dir($("#kakaoAddress").val());
	})
}); */


</script>
</body>

</html>

