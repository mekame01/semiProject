<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/include/head.jsp" %>    
 
 <head>
 <style type="text/css">
 
 
 
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


      
      <div class="hero inner-page" style="background-image: url('<%= request.getContextPath() %>/resources/images/hero_1_a.jpg');">
        
        <div class="container">
          <div class="row align-items-end ">
            <div class="col-lg-5">

              <div class="intro">
                <h1><strong>차량등록</strong></h1>
                <div class="custom-breadcrumbs"><a href="/index.jsp">Home</a> <span class="mx-2">/</span> <strong>About</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>

    

    <div class="site-section bg-light" id="contact-section">
      <div class="container">
        <div class="row justify-content-center text-center">
        <div class="col-7 text-center mb-5">
          <h2>Contact Us Or Use This Form To Rent A Car</h2>
          <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo assumenda, dolorum necessitatibus eius earum voluptates sed!</p>
        </div>
      </div>
        <div class="row justify-content-center text-center">
          <div class="col-lg-8 mb-5"  >
            <form action="#" method="post" >
            
              <div class="form-group row" >
                <div class="col-md-12">
                  <input type="text" class="form-control" placeholder="주차장소">
                </div>
                
              </div>
            
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="회원 아이디">
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" placeholder="차 번호">
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="차종">
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" placeholder="차 연비">
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="내비게이션 유무">
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" placeholder="후방카메라 유무">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="연료">
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" placeholder="가격">
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="number" class="form-control" placeholder="좌석 개수">
                </div>
                <div class="col-md-6">
                  <input type="number" class="form-control" placeholder="문 개수">
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                 <input type="file" id="image" accept="image/*" onchange="setThumbnail(event);" /> 
              </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-12">
                  <textarea name="" id="" class="form-control" placeholder="참고사항" cols="30" rows="10"></textarea>
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-6 mr-auto">
                  <input type="submit" class="btn btn-block btn-primary text-white py-3 px-5" value="등록하기">
                </div>
              </div>
            </form>
          </div>
          
        
              
             
              
				<script> 
				function setThumbnail(event) { var reader = new FileReader();reader.onload = function(event) 
				{ var img = document.createElement("img");img.setAttribute("src", event.target.result);
				document.querySelector("div#image_container").appendChild(img);};reader.readAsDataURL(event.target.files[0]);}
				</script> 
	
			
             
          </div>
        </div>
      </div>
    </div>


      
       	<%@ include file="/WEB-INF/view/include/footer.jsp" %>

    </div>
  <%@ include file="/WEB-INF/view/include/script.jsp" %>


  </body>

</html>


</body>
</html>