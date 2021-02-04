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
                <h1><strong>결제정보</strong></h1>
                <div class="custom-breadcrumbs"><a href="/index.jsp">Home</a> <span class="mx-2">/</span> <strong>결제정보</strong></div>
              </div>
            </div>
          </div>
        </div>
      </div>
	  
	  <div class="site-section">
      	<div class="container">
	     <div class="row">
	        <div class="col-lg-7">
	          <h2 class="section-heading"><strong>결제정보</strong></h2>
	          <p class="mb-5">결제 상세 정보</p>  
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
                  <tr>
                    <th class="product-name" style="width:30%">차량</th>
                    <td class="product-name"><h2 class="h5 text-black">Sonata</h2></td>
                  </tr>
                  <tr>
                    <th class="product-price">가격</th>
                    <td class="product-price">$55.00</td>
                  </tr>
                  <tr>
                    <th class="product-regDate">예약날짜</th>
                    <td class="product-regDate">2021.02.02</td>
                  </tr>
                  <tr>
                    <th class="product-pickDate">픽업날짜</th>
                    <td class="product-pickDate">2021.02.05</td>
                  </tr>
                  <tr>
                    <th class="product-total">총가격</th>
                    <td class="product-total">$57.00</td>
                  </tr>
               </table>
            </div>
          </form>
        </div>
    
        <div class="row">
          <div class="col-md-6">
            <div class="row">
              <div class="col-md-12">
                <label class="text-black h4">결제 수단</label>
                <p>결제 수다아아아안</p>
              </div>
              <div class="col-md-8 mb-3 mb-md-0">
                <div class="row mb-3">
                  <div class="col-md-6">
                    <span class="text-black">KG이니시스</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">결제일시 나오게..</strong>
                  </div>
                </div>
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
                    <strong class="text-black">$55.00</strong>
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
                    <strong class="text-black">$57.00</strong>
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