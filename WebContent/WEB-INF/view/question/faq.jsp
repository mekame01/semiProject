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
                <h1><strong>FAQ</strong></h1>
                <div class="custom-breadcrumbs"><a href="/">Home</a> <span class="mx-2">/</span> <strong>FAQ</strong></div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="site-section">
	   <div class="container">
	    <div class="row">
          <div class="col-lg-7">
            <h2 class="section-heading"><strong>FAQ</strong></h2>
            <p class="mb-5">자주 묻는 질문들</p>  
          </div>
        </div>
        <div class="card mb-4">
	        <div class="card-header bg-white font-weight-bold">
	            Guest
	        </div>
	        <div class="card-body">
	            <div class="row">
	                <div class="col-3">
	                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	                        <a class="nav-link active" id="v-pills-1-tab" data-toggle="pill" href="#v-pills-1" role="tab" aria-controls="v-pills-1" aria-selected="true">
	                            차량 이용
	                        </a>
	                        <a class="nav-link" id="v-pills-2-tab" data-toggle="pill" href="#v-pills-2" role="tab" aria-controls="v-pills-2" aria-selected="false">
	                            차량 주의사항
	                        </a>
	                        <a class="nav-link" id="v-pills-3-tab" data-toggle="pill" href="#v-pills-3" role="tab" aria-controls="v-pills-3" aria-selected="false">
	                            결제 방법
	                        </a>
	                        <a class="nav-link" id="v-pills-4-tab" data-toggle="pill" href="#v-pills-4" role="tab" aria-controls="v-pills-4" aria-selected="false">
	                            차량 반납
	                        </a>
	                    </div>
	                </div>
	                <div class="col-9">
	                    <div class="tab-content" id="v-pills-tabContent">
	                        <div class="tab-pane fade show active" id="v-pills-1" role="tabpanel" aria-labelledby="v-pills-1-tab">
	                            <h3 class="mb-4">차량을 이용하려면 어떻게 해야 하나요?</h3>
	                            <div class="bg-light p-4">
	                            	차량을 이용하려면 먼저 에브리붕붕 사이트의 회원이 되어야 합니다.<br>
	                            	회원가입을 하고 난 후에 로그인을 하시고 원하는 차량을 골라 예약하시면 됩니다.<br>
	                            	저희 사이트는 차량을 공유하는 사이트이므로 운전면허증이 있어야 예약이 가능합니다.<br>
	                            	특별히 원하시는 지역이 있을 경우 차량 검색을 통해 찾으실 수 있습니다.<br>
	                            	원하시는 날짜와 시간에 맞춰서 예약을 진행하실 수 있습니다.<br>
	                            	예약을 진행하신 후 소유주가 수락하면 결제가 진행됩니다.<br>
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
	                            <h3 class="mb-4">차량 이용 시 주의할 사항이 있나요?</h3>
	                            <div class="bg-light p-4">
	                            	저희 사이트에 등록된 차량은 전부 개인의 소유입니다.<br>
	                            	다른 사람의 차량을 이용하는 만큼 자신의 차량처럼 깔끔하게 이용해주시길 바랍니다.<br>
	                            	특별히 주의할 사항은 차량을 등록하시는 차량의 소유주 분이 작성해주신 내용을 참고하시길 바랍니다.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
	                            <h3 class="mb-4">결제 금액과 결제 방법</h3>
	                            <div class="bg-light p-4">
									결제는 예약을 먼저 진행한 후에 이루어집니다.<br>
									예약 과정에서 금액이 정해지며, 시간당 계산됩니다.<br>
									예약 신청을 하고 나면 메일을 통해 차주에게 수락 여부를 묻게 됩니다.<br>
									예약 확정이 되면 마이페이지에서 결제가 가능합니다.<br>
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
	                            <h3 class="mb-4">차량 반납은 어떻게 하나요?</h3>
	                            <div class="bg-light p-4">
	                            	차량 예약 시 정하신 장소에 가져다 두시면 됩니다.<br>
	                            	따로 원하시는 사항이 있다면 차량 소유주에게 문의하여 진행하시면 됩니다.<br>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
        	</div>
    	</div>
    	
    	<div class="card mb-4">
	        <div class="card-header bg-white font-weight-bold">
	            Host
	        </div>
	        <div class="card-body">
	            <div class="row">
	                <div class="col-3">
	                    <div class="nav flex-column nav-pills" id="v-pills-tab" role="tablist" aria-orientation="vertical">
	                        <a class="nav-link active" id="v-pills-5-tab" data-toggle="pill" href="#v-pills-5" role="tab" aria-controls="v-pills-1" aria-selected="true">
	                            차량 등록
	                        </a>
	                        <a class="nav-link" id="v-pills-6-tab" data-toggle="pill" href="#v-pills-6" role="tab" aria-controls="v-pills-2" aria-selected="false">
	                            차량 관리
	                        </a>
	                        <a class="nav-link" id="v-pills-7-tab" data-toggle="pill" href="#v-pills-7" role="tab" aria-controls="v-pills-3" aria-selected="false">
	                            게스트와 체크인
	                        </a>
	                        <a class="nav-link" id="v-pills-8-tab" data-toggle="pill" href="#v-pills-8" role="tab" aria-controls="v-pills-4" aria-selected="false">
	                            평점
	                        </a>
	                    </div>
	                </div>
	                <div class="col-9">
	                    <div class="tab-content" id="v-pills-tabContent">
	                        <div class="tab-pane fade show active" id="v-pills-5" role="tabpanel" aria-labelledby="v-pills-5-tab">
	                            <h3 class="mb-4">차량 등록은 어떻게 하나요?</h3>
	                            <div class="bg-light p-4">
	                            	차량 등록 페이지에서 등록하면 됩니다.<br>
	                            	차량의 사진이 필요하고, 차량에 대한 기본적인 정보와<br>
	                            	추가적으로 주의해야 하는 사항이나 필요한 사항을 적어주면 됩니다.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-6" role="tabpanel" aria-labelledby="v-pills-6-tab">
	                            <h3 class="mb-4">차량 관리는 어떻게 이루어져야 하나요?</h3>
	                            <div class="bg-light p-4">
	                            	차량 관리는 차량 소유주에 의해 이루어지며, 관리가 잘되지 않는<br>
	                            	문제점이 생길 것을 대비하여 평점제도를 도입하고 있습니다.<br>
	                            	차량을 공유하는 것이므로 서로 서로 조심해야 합니다.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-7" role="tabpanel" aria-labelledby="v-pills-7-tab">
	                            <h3 class="mb-4">게스트와의 체크인은 어떤 방식으로 진행되나요?</h3>
	                            <div class="bg-light p-4">
	                            	게스트와의 체크인은 직접 연락을 통해 변경 사항이 있다면<br>
	                            	변경하여 진행하셔도 되나, 기본적으로는 예약 시 지정한<br>
	                            	픽업 장소에서 이루어집니다.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-8" role="tabpanel" aria-labelledby="v-pills-8-tab">
	                            <h3 class="mb-4">평점의 기준은 무엇인가요?</h3>
	                            <div class="bg-light p-4">
	                            	차량을 이용한 사용자들의 차량 자체에 불편사항이 없다면 좋은 평점을 받을 수 있습니다.<br>
	                            	이것은 차량의 청결 상태, 외관이나 내부에 문제가 없는 지,<br>
	                            	차주의 태도 등 다양한 기준이 있습니다.<br>
	                            	무분별한 평점테러는 추후에 관리할 예정입니다.
	                            </div>
	                        </div>
	                    </div>
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
            <h2 class="mb-0 text-white">떠나고 싶으신가요?</h2>
            <p class="mb-0 opa-7">지금 바로 출발하세요!</p>
          </div>
          <div class="col-lg-5 text-md-right">
            <a href="/" class="btn btn-primary btn-white">예약하러 가기</a>
          </div>
        </div>
      </div>
    </div>
      
      <%@ include file="/WEB-INF/view/include/footer.jsp" %>
    </div>

   <%@ include file="/WEB-INF/view/include/script.jsp" %>

</body>
</html>