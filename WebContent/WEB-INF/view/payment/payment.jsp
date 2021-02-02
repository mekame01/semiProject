<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<body>
<%@ include file="/WEB-INF/view/include/header.jsp" %>
    <div class="site-wrap" id="home-section">

      <div class="site-mobile-menu site-navbar-target">
        <div class="site-mobile-menu-header">
          <div class="site-mobile-menu-close mt-3">
            <span class="icon-close2 js-menu-toggle"></span>
          </div>
        </div>
        <div class="site-mobile-menu-body"></div>
      </div>
      
      <div class="hero inner-page" style="background-image: url('<%= request.getContextPath() %>/resources/images/hero_1_a.jpg');">    
        <div class="container">
          <div class="row align-items-end ">
            <div class="col-lg-5">
              <div class="intro">
                <h1><strong>결제</strong></h1>
                <div class="custom-breadcrumbs"><a href="/index.jsp">Home</a> <span class="mx-2">/</span> <strong>결제</strong></div>
              </div>
            </div>
          </div>
        </div>
      </div>
	  
	  <div class="site-section">
      	<div class="container">
	     <div class="row">
	        <div class="col-lg-7">
	          <h2 class="section-heading"><strong>결제</strong></h2>
	          <p class="mb-5">Payment</p>  
	        </div>
	      </div>
          <div class="row mb-5">
          	<form class="col-md-12" method="post">
              <div class="site-blocks-table">
               	<table class="table table-bordered">
                 <thead>
                  <tr>
                    <th class="product-thumbnail">차량이미지</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="product-thumbnail">
                      <img src="<%= request.getContextPath() %>/resources/images/car_2.jpg" alt="Image" class="img-fluid">
                    </td> 
                </tbody>
               </table>  
               <table class="table table-bordered">
                 <thead>
                  <tr>
                    <th class="product-name">차량</th>
                    <th class="product-price">가격</th>
                    <th class="product-regDate">예약날짜</th>
                    <th class="product-pickDate">픽업날짜</th>
                    <th class="product-total">총가격</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td class="product-name">
                      <h2 class="h5 text-black">Sonata</h2>
                    </td>
                    <td>$55.00</td>
                    <td>2021.02.02</td>
                    <td>2021.02.05</td>
                    <td>$57.00</td>
                  </tr>
                </tbody>
               </table>
            </div>
          </form>
        </div>
    
        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6">
                <button class="btn btn-outline-primary btn-md btn-block">예약내역으로 돌아가기</button>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                <label class="text-black h4" for="coupon">Coupon</label>
                <p>Enter your coupon code if you have one.</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <input type="text" class="form-control py-3" id="coupon" placeholder="Coupon Code">
              </div>
              <div class="col-md-4">
                <button class="btn btn-primary btn-md px-4">Apply Coupon</button>
              </div>
            </div>
          </div>
          <div class="col-md-6 pl-5">
            <div class="row justify-content-end">
              <div class="col-md-7">
                <div class="row">
                  <div class="col-md-12 text-right border-bottom mb-5">
                    <h3 class="text-black h4 text-uppercase">결제 금액</h3>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">Subtotal</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">$230.00</strong>
                  </div>
                </div>
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">fee</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">$2.00</strong>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">$232.00</strong>
                  </div>
                </div>
    
                <div class="row">
                  <div class="col-md-12">
                  	<img src='<%= request.getContextPath() %>/resources/images/kakaopay.png'>
                    <button class="btn btn-primary btn-lg btn-block" onclick="window.location='checkout.html'">결제</button>
                  </div>
                </div>
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