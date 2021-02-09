
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/view/include/head.jsp" %>
    
<head>
<style type="text/css">
	
	
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


    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row justify-content-center text-center">
        <div class="col-7 text-center mb-5">
          <h2>회원정보 변경</h2>
          <p>이름, 아이디, 이메일은 변경이 불가합니다. </p>
          <p> 만약 전화번호만 변경한다면 나머지 두개를 불러올수 있을지.. </p>
        </div>
      </div>
      
      
        <div class="row">
          <div class="col-lg-8 mb-5 uu" >
            <form action="./userinfomodifyimpl" method="post" class="modify-btn">
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" required="required" readonly="readonly" value="${sessionScope.user.userId}">
                	
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" required="required" readonly="readonly" value="${sessionScope.user.userName}">
                </div>
                
              </div>
              
              
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="password" class="form-control pwd" id="pw" name="pw" required="required" value="${sessionScope.user.userPwd}">
                </div>
                <div class="col-md-6">
                  <input type="password" class="form-control pwd" id="pw_check" placeholder="비밀번호 확인" required="required">
                  	<span id="alert-success" style="display: none;">비밀번호가 일치합니다.</span>
    				 <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; ">비밀번호가 일치하지 않습니다.</span>
                </div>
              </div>

              <div class="form-group row">
                <div class="col-md-12">
                  <input type="email" class="form-control" required="required" readonly="readonly" value="${sessionScope.user.userEmail}">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <input type="tel" class="form-control" name="tell" required="required" value="${sessionScope.user.userPhone}">
                </div>
              </div>
              
			  <div class="form-group row">
                <div class="col-md-12">
                  <input type="text" class="form-control" name="license" required="required" value="${sessionScope.user.userLicense}">
                </div>
              </div>
              
              
              <div class="form-group row">
                <div class="col-md-6 mr-auto">
                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="수정완료">
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
<script type="text/javascript">

document.querySelector('.modify-btn').addEventListener('submit',(e)=>{
	   let password = pw.value;
	   let regExp = /^(?!.*[ㄱ-힣])(?=.*\W)(?=.*\d)(?=.*[a-zA-Z])(?=.{8,})/;
	   
	   if(!(regExp.test(password))){
		   e.preventDefault();
		   pw_confirm.innerHTML = '비밀번호는 숫자,영문자,특수문자 조합의 8글자 이상인 문자열입니다.';
		   pw.value='';
	   }
   });
   
$('.pwd').focusout(function(){
	var pwd1 = $("#pw").val();
	var pwd2 = $("#pw_check").val();
	
	if ( pwd1 != '' && pwd2 == '' ) {
        null;
    } else if (pwd1 != "" || pwd2 != "") {
        if (pwd1 == pwd2) {
            $("#alert-success").css('display', 'inline-block');
            $("#alert-danger").css('display', 'none');
        } else {
            alert("비밀번호가 일치하지 않습니다. 비밀번호를 재확인해주세요.");
            $("#alert-success").css('display', 'none');
            $("#alert-danger").css('display', 'inline-block');
        }
    }
});







</script>



  </body>

</html>
</head>
