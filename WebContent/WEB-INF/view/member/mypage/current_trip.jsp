
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
                	<a href="/member/mypage/userinfo">회원정보</a> <span class="mx-2">/</span> 
                	<a href="/member/mypage/userinfomodify">회원정보 수정</a> <span class="mx-2">/</span> 
                	<a href="/member/mypage/past">과거여행</a> <span class="mx-2">/</span> 
                	<a href="/member/mypage/current">미래여행</a> <span class="mx-2">/</span> 
                	<a href="/member/mypage/wishlist">찜한 붕붕이</a>
                </div>
              </div>

            </div>
          </div>
        </div>
      </div>

    
    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-7" style="height:10vh">
            <h2 class="section-heading"><strong>미래여행</strong></h2>
             <c:if test="${empty requestScope.currentList}">
            <p class="mb-5">현재 예약 중인 여행이 없습니다.</p> 
            </c:if>    
          </div>
        </div>
    </div>
    </div>

    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
         <c:forEach var="res" items="${currentList}" varStatus="status">
          <div class="col-lg-4 col-md-6 mb-4">
            <div class="post-entry-1 h-100">
              <a href="/rent/detail?car_idx=${res.carIdx}">
                <img src="/resources/images/post_1.jpg" alt="Image" class="img-fluid">
              </a>
              <div class="post-entry-1-contents">
                <h2><a href="/rent/detail?car_idx=${res.carIdx}">${res.resParking}</a></h2>
                <span class="meta d-inline-block mb-3">${res.resPickupDate}<span class="mx-2">~</span> ${res.resReturnDate}</span>
                <p>이용요금:${res.resFee}원 </p>
                <c:if test="${requestScope.resStateList[status.index] eq 'RH02'}">
                <p><a href="/payment/payment?resIdx=${res.resIdx}&resFee=${res.resFee}&resDate=${res.resDate}&resPickupDate=${res.resPickupDate}" class="btn btn-primary btn-sm" style="color: white;">결제하기</a></p>
                </c:if>
              </div>
            </div>
          </div>
          </c:forEach>

        
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
</div>
</body>
</html>

