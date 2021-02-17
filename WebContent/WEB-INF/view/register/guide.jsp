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
                <h1><strong>안내</strong></h1>
                <div class="custom-breadcrumbs"><a href="/index.jsp">Home</a> <span class="mx-2">/</span> <strong>guide</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>

    

      <div class="site-section">
        <div class="container">
          <h2 class="section-heading"><strong>무엇을 도와드릴까요?</strong></h2>
          <p class="mb-5">무엇이든 물어보세요</p>    

          <div class="row mb-5">
            <div class="col-lg-4 mb-4 mb-lg-0">
              <div class="step">
                <span>1</span>
                <div class="step-inner">
                  <span class="number text-primary">01.</span>
                  <h3><a href="/register/host">호스트 안내</a></h3>
                  <p>호스트 안내입니다. 참고해 주세요!</p>
                </div>
              </div>
            </div>
            <div class="col-lg-4 mb-4 mb-lg-0">
              <div class="step">
                <span>2</span>
                <div class="step-inner">
                  <span class="number text-primary">02.</span>
                  <h3><a href="/register/guest">게스트 안내</a></h3>
                  <p>게스트 안내입니다. 참고해 주세요!</p>
                </div>
              </div>
            </div>
            <div class="col-lg-4 mb-4 mb-lg-0">
              <div class="step">
                <span>3</span>
                <div class="step-inner">
                  <span class="number text-primary">03.</span>
                  <h3><a href="/question/faq">FAQ</h3>
                  <p>자주 묻는 질문으로 가기!</p>
                </div>
              </div>
            </div>
          </div>
      
        </div>
      </div>

    <div class="site-section bg-light">
      <div class="container">
        <div class="row justify-content-center text-center mb-5 section-2-title">
          <div class="col-md-6">
            <h2 class="mb-4">Meet Our Team</h2>
          </div>
        </div>
        <div class="row align-items-stretch">

          <div class="col-lg-4 col-md-6 mb-5">
   
          </div>
          <div class="col-lg-4 col-md-6 mb-5">
            <div class="post-entry-1 h-100 person-1">
              
                <img src="<%= request.getContextPath() %>/resources/images/person_2.jpg" alt="Image"
                 class="img-fluid">
            
              <div class="post-entry-1-contents">
                <span class="meta">조장</span>
                <h2>왕상준</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, sapiente.</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-5">
          
          </div>

          <div class="col-lg-4 col-md-6 mb-5">
            <div class="post-entry-1 h-100 person-1">
              
                <img src="<%= request.getContextPath() %>/resources/images/person_5.jpg" alt="Image"
                 class="img-fluid">
            
              <div class="post-entry-1-contents">
                <span class="meta">조원</span>
                <h2>이혜령</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, sapiente.</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-5">
            <div class="post-entry-1 h-100 person-1">
              
                <img src="<%= request.getContextPath() %>/resources/images/person_4.jpg" alt="Image"
                 class="img-fluid">
            
              <div class="post-entry-1-contents">
                <span class="meta">조원</span>
                <h2>하은지</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, sapiente.</p>
              </div>
            </div>
          </div>

          <div class="col-lg-4 col-md-6 mb-5">
            <div class="post-entry-1 h-100 person-1">
              
                <img src="<%= request.getContextPath() %>/resources/images/person_1.jpg" alt="Image"
                 class="img-fluid">
            
              <div class="post-entry-1-contents">
                <span class="meta">조원</span>
                <h2>한소희</h2>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ipsa, sapiente.</p>
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

