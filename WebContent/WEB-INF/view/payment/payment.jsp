<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<head>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
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
                <div class="custom-breadcrumbs"><a href="/">Home</a> <span class="mx-2">/</span> <strong>결제</strong></div>
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
    
                <div class="row">
                  <div class="col-md-12">
                    <button class="btn btn-primary btn-lg btn-block" id="pay">결제</button>
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
   
   <script type="text/javascript">
	   $('#pay').click(function(){
		   var IMP = window.IMP;
	       IMP.init('imp13888665'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	       var msg;
	       
	       IMP.request_pay({
	           pg : 'html5_inicis',
	           pay_method : 'card',
	           merchant_uid : 'merchant_' + new Date().getTime(),
	           name : '결제테스트',
	           amount : 100
	           /* buyer_name : ,
	           buyer_phone : ,
	           buyer_email : ,
	           buyer_license :  */
	       }, function(rsp) {
	           if ( rsp.success ) {
	               //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	               jQuery.ajax({
	                   url: "/payDetail", //cross-domain error가 발생하지 않도록 주의해주세요
	                   type: 'POST',
	                   dataType: 'json',
	                   data: {
	                       imp_uid : rsp.imp_uid //기타 필요한 데이터가 있으면 추가 전달
	                       
	                   }
	               }).done(function(data) {
	                   //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                   if ( everythings_fine ) {
	                       msg = '결제가 완료되었습니다.';
	                       msg += '\n고유ID : ' + rsp.imp_uid;
	                       msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                       msg += '\결제 금액 : ' + rsp.paid_amount;
	                       msg += '카드 승인번호 : ' + rsp.apply_num;
	                       
	                       alert(msg);
	                   } else {
	                       //[3] 아직 제대로 결제가 되지 않았습니다.
	                       //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                   }
	               });
	               //성공시 이동할 페이지
	               location.href='<%=request.getContextPath()%>/payment/payDetail?msg='+msg;
	           } else {
	               msg = '결제에 실패하였습니다.';
	               msg += ' 에러내용 : ' + rsp.error_msg;
	               //실패시 이동할 페이지
	               <%-- location.href="<%=request.getContextPath()%>/order/payFail"; --%>
	               alert(msg);
	           }
	       });   
	   });
   </script>
</body>
</html>