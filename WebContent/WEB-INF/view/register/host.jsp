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
                <h1><strong>호스트 안내</strong></h1>
                <div class="custom-breadcrumbs"><a href="index.jsp">Home</a> <span class="mx-2">/</span> <strong>host</strong></div>
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
            <h2>host</h2><br>
            <p>1. 자동차 등록 <br>
            	차량 등록 페이지에서 등록을 해주세요.
            </p>
             <p>2. 자동차 관리 <br>
            	평점제도가 있으니 차량 관리를 해주세요.
            </p>
             <p>3. 게스트와 체크인 <br>
            	게스트와의 체크인은 직접 연락을 통해 이루어집니다.
            </p>
          </div>
        </div>
      </div>
    </div>

   
   


    <div class="site-section bg-primary py-5">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-lg-7 mb-4 mb-md-0">
             <h2 class="mb-0 text-white">떠나고 싶으신가요?</h2>
            <p class="mb-0 opa-7">지금 바로 출발하세요!</p>
          </div>
          <div class="col-lg-5 text-md-right">
            <a href="/index" class="btn btn-primary btn-white">예약하러가기</a>
          </div>
        </div>
      </div>
    </div>

      
       	<%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>

   

  <%@ include file="/WEB-INF/view/include/script.jsp" %>

  </body>

</html>

