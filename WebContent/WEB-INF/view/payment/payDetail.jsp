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
                <div class="custom-breadcrumbs"><a href="/">Home</a> <span class="mx-2">/</span> <strong>결제정보</strong></div>
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
    
    <script type="text/javascript">
	    app.use(bodyParser.json());
	    // "/payments/complete"에 대한 POST 요청을 처리
	    app.post("/payDetail", async (req, res) => {
	      try {
	        const { imp_uid, merchant_uid } = req.body; // req의 body에서 imp_uid, merchant_uid 추출
	        // 액세스 토큰(access token) 발급 받기
	        const getToken = await axios({
	          url: "https://api.iamport.kr/users/getToken",
	          method: "post", // POST method
	          headers: { "Content-Type": "application/json" }, // "Content-Type": "application/json"
	          data: {
	            imp_key: "9480974923695375", // REST API키
	            imp_secret: "KZIXelchcEH8SE9gysyV62914QdlvhxfgfcvBpMN4uVX85eGxMCDPLFUCSg7aNnq3AVF0It4co2lug21" // REST API Secret
	          }
	        });
	        const { access_token } = getToken.data.response; <%-- 인증 토큰 --%>
	        <%-- imp_uid로 아임포트 서버에서 결제 정보 조회 --%>
	        var url = 'https://api.iamport.kr/payments/\${imp_uid}';
	        const getPaymentData = await axios({
	          url: \`url\`,
	          method: "get",
	          headers: { "Authorization": access_token } <%-- 인증 토큰 Authorization header에 추가 --%>
	        });
	        const paymentData = getPaymentData.data.response; // 조회한 결제 정보
	     	// DB에서 결제되어야 하는 금액 조회
	        const order = await Orders.findById(paymentData.merchant_uid);
	        const amountToBePaid = order.amount; // 결제 되어야 하는 금액
	        // 결제 검증하기
	        const { amount, status } = paymentData;
	        if (amount === amountToBePaid) { // 결제 금액 일치. 결제 된 금액 === 결제 되어야 하는 금액
	          await Orders.findByIdAndUpdate(merchant_uid, { $set: paymentData }); // DB에 결제 정보 저장
	          switch (status) {
	            <%-- case "ready": // 가상계좌 발급
	              // DB에 가상계좌 발급 정보 저장
	              const { vbank_num, vbank_date, vbank_name } = paymentData;
	              await Users.findByIdAndUpdate("/* 고객 id */", { $set: { vbank_num, vbank_date, vbank_name }});
	              // 가상계좌 발급 안내 문자메시지 발송
	              SMS.send({ text: \`가상계좌 발급이 성공되었습니다. 계좌 정보 \${vbank_num} \${vbank_date} \${vbank_name}\`});
	              res.send({ status: "vbankIssued", message: "가상계좌 발급 성공" });
	              break; --%>
	            case "paid": <%-- 결제 완료 --%>
	              res.send({ status: "success", message: "일반 결제 성공" });
	              break;
	          }
	        } else { <%-- 결제 금액 불일치. 위/변조 된 결제 --%>
	          throw { status: "forgery", message: "위조된 결제시도" };
	        }
	      } catch (e) {
	        res.status(400).send(e);
	      }
	    });
    </script>
</body>
</html>