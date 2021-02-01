<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
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
                	<a href="/user/userinfo">회원정보</a> <span class="mx-2">/</span> 
                	<a href="/user/userinfomodify">회원정보 수정</a> <span class="mx-2">/</span> 
                	<a href="/user/past">과거여행</a> <span class="mx-2">/</span> 
                	<a href="/user/current">미래여행</a> <span class="mx-2">/</span> 
                	<a href="/user/wishlist">찜한 붕붕이</a>
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
            <h2 class="section-heading"><strong>예약 상세</strong></h2>
            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>    
          </div>
        </div>
        

        <div class="row" style="justify-content: space-evenly">
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
                    <span class="caption">Luggage:</span>
                    <span class="number">8</span>
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
                  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quos eos at eum, voluptatem quibusdam.</p>
                </div>
              </div>

            </div>
          </div>


          <div class="col-md-6 col-lg-4 mb-4">

            <div class="listing d-block  align-items-stretch">
              <div class="listing-img h-100 mr-4">
                <img src="https://www.bloter.net/wp-content/uploads/2016/07/pokemongo-1-765x1097.png" alt="Image" height="350" width="350">
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
            <p class="mb-0 opa-7">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Obcaecati, laboriosam.</p>
          </div>
          <div class="col-lg-5 text-md-right">
            <a href="#" class="btn btn-primary btn-white">Rent a car now</a>
          </div>
        </div>
      </div>
    </div>


      

   <%@ include file="/WEB-INF/view/include/footer.jsp" %>   
    </div>
  <%@ include file="/WEB-INF/view/include/script.jsp" %>

  </body>

</html>
