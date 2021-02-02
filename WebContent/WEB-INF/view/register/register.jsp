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
                  <input type="text" id="address" class="form-control" placeholder="주차장소" required readonly>
                 
                 <div class="d-flex justify-content-end">
                 <button type="button" class="btn btn-info" onClick="goPopup();">주소검색</button>
                 </div>
                  	
                </div>
                
              </div> 
            
              <div class="form-group row">
                 <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="차종">
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" placeholder="차 번호">
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" list="depListFt" placeholder="연료">
               		<datalist id="depListFt">
       					 <option value="휘발유"></option>
       					 <option value="경유"></option>
				         <option value="수소"></option>
				         <option value="전기"></option>
				         <option value="하이브리드"></option>
				    </datalist>
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" placeholder="연비">
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" list="depListNv" placeholder="내비게이션 유무">
                  	<datalist id="depListNv">
       					 <option value="내비게이션 있음"></option>
       					 <option value="내비게이션 없음"></option>
				    </datalist>
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" list="depListBc" placeholder="후방카메라 유무">
               		 <datalist id="depListBc">
       					 <option value="후방카메라 있음"></option>
       					 <option value="후방카메라 없음"></option>
				    </datalist>
                
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
                  <input type="text" class="form-control" placeholder="가격">
                </div>
                <div class="col-md-6">
                 <input type="file" id="image" class="form-control" accept="image/*" onchange="setThumbnail(event);" /> 
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
          
        
          </div>
        </div>
      </div>
    </div>


      
  	<%@ include file="/WEB-INF/view/include/footer.jsp" %>

  <%@ include file="/WEB-INF/view/include/script.jsp" %>

     



<!-- jusoPopup -->
<script>
function goPopup(){
	// 주소검색을 수행할 팝업 페이지를 호출합니다.
	// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(https://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
	var pop = window.open("/register/register/jusoPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
}

function jusoCallBack(roadFullAddr){
	var addressEl=document.querySelector("#address");
		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록.
		addressEl.value=roadFullAddr;
}

</script>


<!-- 사진업로드 일단 대충한거....... -->
<script> 
function setThumbnail(event) { var reader = new FileReader();reader.onload = function(event) 
	{ var img = document.createElement("img");img.setAttribute("src", event.target.result);
	document.querySelector("div#image_container").appendChild(img);};reader.readAsDataURL(event.target.files[0]);}
</script> 


</body>
</html>