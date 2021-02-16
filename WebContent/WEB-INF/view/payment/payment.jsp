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
                    <td class="product-price">${param.resFee}원</td>
                  </tr>
                  <tr>
                    <th class="product-regDate">예약날짜</th>
                    <td class="product-regDate">${param.resDate}</td>
                  </tr>
                  <tr>
                    <th class="product-pickDate">픽업날짜</th>
                    <td class="product-pickDate">${param.resPickupDate}</td>
                  </tr>
                  <tr>
                    <th class="product-returnDate">반납날짜</th>
                    <td class="product-returnDate">${param.resReturnDate}</td>
                  </tr>
                  <tr>
                    <th class="product-total">총가격</th>
                    <td class="product-total">${param.resFee}원</td>
                  </tr>
               </table>
            </div>
          </form>
        </div>
    
        <div class="row">
          <div class="col-md-6">
            <div class="row mb-5">
              <div class="col-md-6">
                <%-- <button class="btn btn-outline-primary btn-md btn-block">예약내역으로 돌아가기</button> --%>
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
                    <strong class="text-black">${param.resFee}원</strong>
                  </div>
                </div>
                <div class="row mb-5">
                  <div class="col-md-6">
                    <span class="text-black">Total</span>
                  </div>
                  <div class="col-md-6 text-right">
                    <strong class="text-black">${param.resFee}원</strong>
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
   var paySendTid;
   var payMethod;
   var payFee;
   var payUserPhone;
   
   var payReTid;
   var payReFee;
   var payReDate;
   var payReStatus;
   var payReErrorCd;
   var payReErrorMsg;
   var payReYn;

	   $('#pay').click(function(){
		   var IMP = window.IMP;
	       IMP.init('imp13888665'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	       var msg;
	       
	       paySendTid = 'merchant_' + new Date().getTime();
	       payMethod = 'card';
	       payFee = ${param.resFee};
	       payUserPhone = "${sessionScope.user.userPhone}";
	       console.dir("payUserPhone");
	       console.dir(payUserPhone);
	       //여기가 통신 시작이니 이 전에 통신을 쏘겠습니다.
	       //통신을 호출
		   paymentSend();
	       
	       IMP.request_pay({
	           pg : 'html5_inicis',
	           pay_method : payMethod,
	           merchant_uid : paySendTid,
	           name : '결제테스트',
	           amount : payFee,
	           buyer_tel : payUserPhone
	       }, function(rsp) {
	    	   console.dir("rsp");
	    	   
	    	   //receive호출
	    	   payReTid = rsp.imp_uid;
	           payReFee = rsp.paid_amount;
	           payReDate = rsp.paid_at;
	           payReStatus = rsp.status;
	           payReErrorCd = rsp.error_code;
	           payReErrorMsg = rsp.error_msg;
	           payReYn = rsp.success;
	           
	    	   console.dir("payReYn");
	    	   console.dir(payReYn);
	    	   //paymentReceive();
	           if (rsp.success) {
	        	   
	        	   paymentReceive(rsp);
            		<%--
            	   $.ajax({
	                   url: "/payment/insertPaymentReceive", //cross-domain error가 발생하지 않도록 주의
	                   type: 'POST',
	                   dataType: 'json',
	                   data: {
	                	   resIdx : ${param.resIdx},
	                	   payReTid : rsp.imp_uid, //필요한 데이터 전달
	                	   payReFee : rsp.paid_amount,
	                	   payReDate : rsp.paid_at,
	                	   payReStatus : rsp.status,
	                	   payReErrorCd : rsp.error_code,
	                	   payReErrorMsg : rsp.error_msg,
	                	   payReYn : rsp.success
	                   }
            	   
	               }).done(function(data) {
	            	   console.dir("data");
	            	   console.dir(data);
	                   //[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	                   if ( everythings_fine ) {
		            	   console.dir("everythings_fine");
		            	   console.dir(everythings_fine);
		            	   console.dir("rsp");
		            	   console.dir(rsp);
		            	   
	                       msg = '결제가 완료되었습니다.';
	                       msg += '\n고유ID : ' + rsp.imp_uid;
	                       msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	                       msg += '\결제 금액 : ' + rsp.paid_amount;
	                       msg += '카드 승인번호 : ' + rsp.apply_num;
	                       console.dir(msg);
	                       alert(msg);              
	                   } else {
	                	   
	                       //[3] 아직 제대로 결제가 되지 않았습니다.
	                       //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	                   }
	               });
	               
            	   -->
            	   
	               //성공시 이동할 페이지
           		   <%--location.href='<%=request.getContextPath()%>/payment/payDetail?resIdx=?' + 1;--%>
	           	} else {
	               	msg = '결제에 실패하였습니다.';
	               	msg += ' 에러내용 : ' + rsp.error_msg;
	               	//실패시 이동할 페이지
	               	<%-- location.href="<%=request.getContextPath()%>/order/payFail"; --%>
	               	alert(msg);
	           	}
	       });   
	   });

	//payment_send에 보낼 function
	//async는 비동기 작업이 있을 경우 앞에 붙여주는 겁니다. 통신은 일반적으로 비동기 작업이니까요.
	let paymentSend = async () => {
		//이값은 전 화면에서 request.setAttribute("")로 받은 값
		//임시 하드코딩
		let url = "/payment/insertPaymentSend?resIdx="+${param.resIdx}
			//위에서 변수로 받은 값
			+"&paySendTid=" + paySendTid
			+"&payMethod=" + payMethod
			+"&payFee=" + payFee
			+"&payUserPhone=" + payUserPhone;
		console.dir(url);
		//alert("여기서 잠깐1");
		//이렇게만 해주면 알아서 통신을 쏨
		let response = await fetch(url,{
			"method": "get"
		});
		//alert("여기서 잠깐2");
	}
	
	let paymentReceive = async (rsp) => {
		let url = "/payment/insertPaymentReceive?resIdx="+${param.resIdx}
			+"&payReTid=" + payReTid
			+"&payReFee=" + payReFee
			+"&payReDate=" + payReDate
			+"&payReStatus=" + payReStatus
			+"&payReErrorCd=" + payReErrorCd
			+"&payReErrorMsg=" + payReErrorMsg
			+"&payReYn=" + payReYn;
		console.dir(url);
		//alert("여기서 잠깐1");

		let response = await fetch(url,{
			"method": "get"
		});
		//alert("여기서 잠깐2");
		console.dir("everythings_fine");
		
        msg = '결제가 완료되었습니다.';
        msg += '\n고유ID : ' + rsp.imp_uid;
        msg += '\n상점 거래ID : ' + rsp.merchant_uid;
        msg += '\결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
        console.dir(msg);
        alert(msg);              
	}
	
   </script>
</body>
</html>