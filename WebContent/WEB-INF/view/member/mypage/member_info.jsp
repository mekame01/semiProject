
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

  <head>
    <title>Every붕붕</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700;900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/jquery.fancybox.min.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/resources/css/aos.css">

    <!-- MAIN CSS -->
    <link rel="stylesheet" href="/resources/css/style.css">

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

 <%@ include file="/WEB-INF/view/include/header.jsp" %>


<div class="hero inner-page" style="background-image: url('/resources/images/hero_1_a.jpg');">
        
        <div class="container">
          <div class="row align-items-end ">
            <div class="col-lg-5">

              <div class="intro" style="width:500px">
                <h1><strong>마이페이지</strong></h1>
                <div class="custom-breadcrumbs">
                	<a href="/member/memberinfo">회원정보</a> <span class="mx-2">/</span> 
                	<a href="index.html">회원정보 수정</a> <span class="mx-2">/</span> 
                	<a href="/member/past">과거여행</a> <span class="mx-2">/</span> 
                	<a href="/member/current">미래여행</a> <span class="mx-2">/</span> 
                	<a href="/member/wishlist">찜한 붕붕이</a>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>









   <%@ include file="/WEB-INF/view/include/footer.jsp" %>   
    </div>
  <%@ include file="/WEB-INF/view/include/script.jsp" %>

  </body>

</html>