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

      
      <div class="hero inner-page" style="background-image: url('<%= request.getContextPath() %>/resources/images/hero_1_a.jpg');">
        
        <div class="container">
          <div class="row align-items-end ">
            <div class="col-lg-5">

              <div class="intro">
                <h1><strong>게스트 안내</strong></h1>
                <div class="custom-breadcrumbs"><a href="index.jsp">Home</a> <span class="mx-2">/</span> <strong>guest</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>

    

    <div class="site-section">
      <div class="container">
        <div class="row">
          <div class="col-lg-6 mb-5 mb-lg-0 order-lg-2">
            <img src="<%= request.getContextPath() %>/resources/images/hero_2.jpg" alt="Image" class="img-fluid rounded">
          </div>
          <div class="col-lg-4 mr-auto">
            <h2>guest</h2><br>
            <p>1. 자동차 찾기 <br>
            	위치와 날짜를 입력하고 현지 호스트가 공유하는 수천 대의 차량을 검색할 수 있습니다.
            </p>
             <p>2. 자동차 예약 <br>
            	온라인에서 예약하고 호스트에게 연락하세요.
            </p>
             <p>3. 길을 나서다 <br>
            	호스트에게서 픽업하십시오. 체크인을 한 후 사용하세요.
            </p>
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

