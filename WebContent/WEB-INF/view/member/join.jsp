<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

  <head>
    <title charset="utf-8">Every붕붕</title>
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

              <div class="intro">
                <h1><strong>회원가입하기</strong></h1>
                <div class="custom-breadcrumbs"><a href="index.html">Home</a> <span class="mx-2">/</span> <strong>About</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>

    

    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row justify-content-center text-center">
        <div class="col-7 text-center mb-5">
          <h2>회원정보를 입력해주세요</h2>
          <p>아이디 이름같은거 따로 안빼고 placeholder에 넣어도갠춘? Nemo assumenda, dolorum necessitatibus eius earum voluptates sed!</p>
        </div>
      </div>
        <div class="row">
          <div class="col-lg-8 mb-5" >
            <form action="#" method="post">
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="이름" required="required">
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" placeholder="아이디" required="required">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="password" class="form-control" placeholder="비밀번호 8 ~ 12자 영문, 숫자, 특수문자" required="required">
                </div>
                <div class="col-md-6">
                  <input type="password" class="form-control" placeholder="비밀번호 확인" required="required">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <input type="email" class="form-control" placeholder="이메일주소 : example@example.com" required="required">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <input type="tel" class="form-control" placeholder="전화번호 010-0000-0000" required="required">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <input type="text" class="form-control" placeholder="주소 : 우편번호 검색기능 추가?" required="required">
                </div>
              </div>

			  <div class="form-group row">
                <div class="col-md-12">
                  <input type="text" class="form-control" placeholder="운전면허 번호 : 앞뒤 사진으로 받을지.. 번호입력만받을지.." required="required">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <input type="text" class="form-control" placeholder="카드 번호 : 받을지 말지.. 가짜인지아닌지 어떻게 알지" required="required">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <textarea name="" id="" class="form-control" placeholder="Write your message." cols="30" rows="10"></textarea>
                </div>
              </div>
              <div class="form-group row">
                <div class="col-md-6 mr-auto">
                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="가입하기">
                </div>
              </div>
            </form>
          </div>
          <div class="col-lg-4 ml-auto">
            <div class="bg-white p-3 p-md-5">
              <h3 class="text-black mb-4">Contact Info</h3>
              <ul class="list-unstyled footer-link">
                <li class="d-block mb-3">
                  <span class="d-block text-black">Address:</span>
                  <span>34 Street Name, City Name Here, United States</span></li>
                <li class="d-block mb-3"><span class="d-block text-black">Phone:</span><span>+1 242 4942 290</span></li>
                <li class="d-block mb-3"><span class="d-block text-black">Email:</span><span>info@yourdomain.com</span></li>
              </ul>
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

