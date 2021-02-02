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
                <div class="custom-breadcrumbs"><a href="/index.jsp">Home</a> <span class="mx-2">/</span> <strong>FAQ</strong></div>
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
            <p class="mb-5">Frequently Asked Questions</p>  
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
	                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis erat cursus, facilisis nulla et, volutpat est. Cras ultrices eu leo ut dapibus. In sollicitudin consectetur est sed laoreet. Cras imperdiet, tortor ac aliquam ullamcorper, eros lorem volutpat odio, ut aliquet elit orci sit amet magna. Quisque in pretium ante, nec maximus ipsum. Ut semper arcu sit amet felis feugiat, ut tempus eros blandit. Donec fermentum elit purus, convallis commodo arcu posuere et. Proin convallis tristique ante, ac auctor magna sodales sit amet. Nulla facilisi. Quisque feugiat sit amet mauris efficitur facilisis. Mauris vitae magna efficitur, vulputate risus facilisis, viverra lorem. Praesent vulputate, felis quis ultrices porta, sapien massa imperdiet metus, eget tincidunt ante ipsum quis lectus. Vivamus placerat pretium euismod. Praesent mattis varius risus eget luctus. Quisque odio risus, tristique in erat eget, dapibus maximus ligula.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-2" role="tabpanel" aria-labelledby="v-pills-2-tab">
	                            <h3 class="mb-4">차량 이용 시 주의할 사항이 있나요?</h3>
	                            <div class="bg-light p-4">
	                                Etiam at posuere metus, in molestie libero. Cras eleifend turpis vel libero vehicula, interdum gravida lacus consectetur. Proin id sodales nunc, sit amet varius orci. Nulla malesuada consectetur ipsum a dapibus. Cras rhoncus justo ex, ac tincidunt mauris fermentum in. Vestibulum hendrerit metus pharetra arcu convallis dictum. Vestibulum leo erat, vehicula eu ex a, convallis faucibus nunc. Duis ultrices lacus quis vulputate iaculis. Ut magna sem, vulputate non tristique sit amet, egestas et purus. Mauris euismod sapien id pretium vulputate. In molestie, enim id finibus hendrerit, velit ante sodales nisi, vitae aliquam nulla tortor nec ligula.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-3" role="tabpanel" aria-labelledby="v-pills-3-tab">
	                            <h3 class="mb-4">결제 금액과 결제 방법</h3>
	                            <div class="bg-light p-4">
	                                Cras in odio facilisis, convallis ex in, euismod elit. Quisque a tortor id nisl egestas mollis. Integer eleifend sapien a rutrum laoreet. Ut mattis tempus ipsum, sed porttitor nulla blandit non. Nulla quis magna id nisl efficitur vestibulum sit amet eget lorem. Pellentesque pharetra porta erat, sed rhoncus libero. Proin nec pellentesque leo. Cras vehicula bibendum rutrum. Duis vel sem vel libero luctus volutpat sagittis eget nunc. Sed vehicula massa mi, ut tempor est maximus ut. Pellentesque ullamcorper odio quis est tincidunt iaculis. Sed viverra ligula in nisi molestie sagittis. Etiam nec dictum tellus. Maecenas orci mi, dignissim id pulvinar nec, venenatis at mauris. Mauris sit amet leo eu metus scelerisque feugiat.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-4" role="tabpanel" aria-labelledby="v-pills-4-tab">
	                            <h3 class="mb-4">차량 반납은 어떻게 하나요?</h3>
	                            <div class="bg-light p-4">
	                                Vivamus viverra diam id erat porttitor condimentum. Nunc et metus aliquam, maximus felis et, porta erat. Nam laoreet pretium felis, vitae dictum sapien congue vel. Quisque a augue lobortis, molestie odio non, finibus nibh. Cras ut tempus sapien, in porta dolor. Mauris vitae mi ultricies, semper dolor at, rhoncus est. Proin dictum lobortis tortor, vel sodales felis hendrerit eu. Maecenas volutpat dignissim justo, sit amet ultrices libero tristique id. Proin euismod, odio quis tincidunt ullamcorper, nisl leo auctor est, eget facilisis ligula dui non ex. Morbi non sagittis quam, non pharetra libero. Nunc id nibh cursus, dapibus mauris eu, efficitur ligula. Vivamus tempor erat sem, sed sodales urna mattis cursus. Donec at tempus lacus. Aenean scelerisque nibh tellus, in euismod turpis ornare at. Proin pellentesque blandit dignissim. Vestibulum tristique odio ut mauris fermentum, et lobortis diam tincidunt.
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
	                                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam quis erat cursus, facilisis nulla et, volutpat est. Cras ultrices eu leo ut dapibus. In sollicitudin consectetur est sed laoreet. Cras imperdiet, tortor ac aliquam ullamcorper, eros lorem volutpat odio, ut aliquet elit orci sit amet magna. Quisque in pretium ante, nec maximus ipsum. Ut semper arcu sit amet felis feugiat, ut tempus eros blandit. Donec fermentum elit purus, convallis commodo arcu posuere et. Proin convallis tristique ante, ac auctor magna sodales sit amet. Nulla facilisi. Quisque feugiat sit amet mauris efficitur facilisis. Mauris vitae magna efficitur, vulputate risus facilisis, viverra lorem. Praesent vulputate, felis quis ultrices porta, sapien massa imperdiet metus, eget tincidunt ante ipsum quis lectus. Vivamus placerat pretium euismod. Praesent mattis varius risus eget luctus. Quisque odio risus, tristique in erat eget, dapibus maximus ligula.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-6" role="tabpanel" aria-labelledby="v-pills-6-tab">
	                            <h3 class="mb-4">차량 관리는 어떻게 이루어져야 하나요?</h3>
	                            <div class="bg-light p-4">
	                                Etiam at posuere metus, in molestie libero. Cras eleifend turpis vel libero vehicula, interdum gravida lacus consectetur. Proin id sodales nunc, sit amet varius orci. Nulla malesuada consectetur ipsum a dapibus. Cras rhoncus justo ex, ac tincidunt mauris fermentum in. Vestibulum hendrerit metus pharetra arcu convallis dictum. Vestibulum leo erat, vehicula eu ex a, convallis faucibus nunc. Duis ultrices lacus quis vulputate iaculis. Ut magna sem, vulputate non tristique sit amet, egestas et purus. Mauris euismod sapien id pretium vulputate. In molestie, enim id finibus hendrerit, velit ante sodales nisi, vitae aliquam nulla tortor nec ligula.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-7" role="tabpanel" aria-labelledby="v-pills-7-tab">
	                            <h3 class="mb-4">게스트와의 체크인은 어떤 방식으로 진행되나요?</h3>
	                            <div class="bg-light p-4">
	                                Cras in odio facilisis, convallis ex in, euismod elit. Quisque a tortor id nisl egestas mollis. Integer eleifend sapien a rutrum laoreet. Ut mattis tempus ipsum, sed porttitor nulla blandit non. Nulla quis magna id nisl efficitur vestibulum sit amet eget lorem. Pellentesque pharetra porta erat, sed rhoncus libero. Proin nec pellentesque leo. Cras vehicula bibendum rutrum. Duis vel sem vel libero luctus volutpat sagittis eget nunc. Sed vehicula massa mi, ut tempor est maximus ut. Pellentesque ullamcorper odio quis est tincidunt iaculis. Sed viverra ligula in nisi molestie sagittis. Etiam nec dictum tellus. Maecenas orci mi, dignissim id pulvinar nec, venenatis at mauris. Mauris sit amet leo eu metus scelerisque feugiat.
	                            </div>
	                        </div>
	                        <div class="tab-pane fade" id="v-pills-8" role="tabpanel" aria-labelledby="v-pills-8-tab">
	                            <h3 class="mb-4">평점의 기준은 무엇인가요?</h3>
	                            <div class="bg-light p-4">
	                                Vivamus viverra diam id erat porttitor condimentum. Nunc et metus aliquam, maximus felis et, porta erat. Nam laoreet pretium felis, vitae dictum sapien congue vel. Quisque a augue lobortis, molestie odio non, finibus nibh. Cras ut tempus sapien, in porta dolor. Mauris vitae mi ultricies, semper dolor at, rhoncus est. Proin dictum lobortis tortor, vel sodales felis hendrerit eu. Maecenas volutpat dignissim justo, sit amet ultrices libero tristique id. Proin euismod, odio quis tincidunt ullamcorper, nisl leo auctor est, eget facilisis ligula dui non ex. Morbi non sagittis quam, non pharetra libero. Nunc id nibh cursus, dapibus mauris eu, efficitur ligula. Vivamus tempor erat sem, sed sodales urna mattis cursus. Donec at tempus lacus. Aenean scelerisque nibh tellus, in euismod turpis ornare at. Proin pellentesque blandit dignissim. Vestibulum tristique odio ut mauris fermentum, et lobortis diam tincidunt.
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