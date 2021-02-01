<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/include/head.jsp" %>
<head>
<style type="text/css">
	.valid_info{
		display: block;
		color: red;
		font-size: 0.5vw;
	}
	.btn-id{
		width:32%; 
		background-color:gainsboro!important;
	}
	.uu{
		margin-left: 20%;
	}
</style>
</head>
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

              <div class="intro">
                <h1><strong>회원가입</strong></h1>
                <div class="custom-breadcrumbs"><a href="index.html">Home</a> <span class="mx-2">/</span> <strong>About</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>

    

    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row justify-content-center text-center">
        <div class="col-7 text-center mb-5">
          <h2>회원정보를 입력해주세요</h2>
          <p></p>
        </div>
      </div>
        <div class="row">
          <div class="col-lg-8 mb-5 uu" >
            <form action="#" method="post">
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="이름" required="required">
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="아이디" required="required">
                </div>
                <div class="col-md-6">
                  <button class="form-control btn-id" type="button" onclick="idCheck()">중복확인</button>
                 <span class="valid_info" id="id_check"></span>
                </div>
              </div>
              
              
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="password" class="form-control" placeholder="비밀번호 8~12이상 영문, 숫자, 특수문자" required="required">
                </div>
                <div class="col-md-6">
                  <input type="password" class="form-control" placeholder="비밀번호 확인" required="required">
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <input type="email" class="form-control" placeholder="이메일주소 : example@example.com" required="required">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <input type="tel" class="form-control" placeholder="전화번호 010-0000-0000" required="required">
                </div>
              </div>
              
			  <div class="form-group row">
                <div class="col-md-12">
                  <input type="text" class="form-control" placeholder="운전면허 번호 : " required="required">
                </div>
              </div>
              
              
              <div class="form-group row">
                <div class="col-md-6 mr-auto">
                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="가입하기">
                </div>
              </div>
            </form>
          </div>
          
         
        </div>
      </div>
    </div>

   <%@ include file="/WEB-INF/view/include/footer.jsp" %>   
    </div>
  <%@ include file="/WEB-INF/view/include/script.jsp" %>

  </body>

</html>

