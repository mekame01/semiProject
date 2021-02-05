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
		
		<div class="hero inner-page" style="background-image: url('../resources/images/hero_1_a.jpg');">
			<div class="container">
			</div>
		</div>
		
		<div class="site-section bg-light">
			<div class="container body_split">
				<div class="left">
					<div class="row">
						<h1 class="col-md-6 col-lg-12 mb-4"><strong>차이름</strong></h1>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-6 mb-4">데이터1</div>
						<div class="col-md-6 col-lg-6 mb-4">데이터2</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-6 mb-4">데이터3</div>
						<div class="col-md-6 col-lg-6 mb-4">데이터4</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-6 mb-4">데이터5</div>
						<div class="col-md-6 col-lg-6 mb-4">데이터6</div>
					</div>
					<div class="row">
						<div class="col-md-6 col-lg-6 mb-4">데이터7</div>
						<div class="col-md-6 col-lg-6 mb-4">데이터8</div>
					</div>
				</div>
				<div class="right">
					<img alt="" src="">
					<form action="">
						<div>위치</div>
						<input type="date" placeholder="픽업날짜" id="pickup_date">
						<input type="number" min="0" max="23"  placeholder="픽업시각" id="pickup_hour" style="width: 25%;">
						<input type="date" placeholder="반환날짜" id="return_date">
						<input type="number" min="0" max="23" placeholder="반환시각" id="return_hour" style="width: 25%;">
						<div>가격:<span></span></div>
						<input class="btn btn-primary btn-block py-3" value="예약하기" type="submit">
					</form>
				</div>
			</div>
			<div class="review">
				<c:if test="true">
					<form action="">
						<div class="user_id col-md-6 col-lg-2 mb-4">아이디</div>
						<textarea class="review_content col-md-6 col-lg-6 mb-4"></textarea>
						<div class="review_rating col-md-6 col-lg-2 mb-4">
							<h1>평점</h1>
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
								<%-- <input type="radio" id="rating0" name="rating" value="0" /><label for="rating0" title="No star"></label> --%>
							</fieldset>
						</div>
						<input type="submit" value="등록" class="btn btn-primary">
					</form>
				</c:if>
			</div>
		</div>
		<%@ include file="/WEB-INF/view/include/footer.jsp" %>
	
	</div>
<%@ include file="/WEB-INF/view/include/script.jsp" %>
<script type="text/javascript">
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