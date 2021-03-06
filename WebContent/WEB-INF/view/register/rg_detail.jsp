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
                <h1><strong>상세정보</strong></h1>
                <div class="custom-breadcrumbs"><a href="/">Home</a> <span class="mx-2">/</span> <strong>detail</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>

    
    
        <div class="site-section">
      <div class="container">
      
       <div class="row mb-5">
             <form action="${context}/register/rg_delete" class="col-md-12" method="post">
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
				<img src="/upload/${data.fileList[0].savePath}${data.fileList[0].renameFileName}" alt="Image" class="img-fluid">
					                
					</td> 
                </tbody>
               </table>  
                <input type="hidden" class="form-control" name="carIdx" value="${data.register.carIdx}" />
               <table class="table table-bordered">
               
               	<tr>
                    <th class="product-name" style="width:30%">작성자</th>
                    <td class="product-name"><h2 class="h5 text-black">${data.register.userId}</h2></td>
                  </tr>
                 
                  
                 <%--  <tr>
                    <th type = "hidden" class="product-name" style="width:30%">카Idx</th>
                    <td class="product-name"><h2 class="h5 text-black">${data.register.carIdx}</h2></td>
                  </tr> --%>
                  
                  <tr>
                    <th class="product-name" style="width:30%">차량</th>
                    <td class="product-name"><h2 class="h5 text-black">${data.register.carModel}</h2></td>
                  </tr>
                  <tr>
                    <th class="product-price">주차장소</th>
                    <td class="product-price"><h2 class="h5 text-black">${data.register.carParking}</h2></td>
                  </tr>
                  <tr>
                    <th class="product-regDate">차종</th>
                    <td class="product-regDate"><h2 class="h5 text-black">${data.register.carModel}</h2></td>
                  </tr>
                  <tr>
                    <th class="product-pickDate">차번호</th>
                    <td class="product-pickDate"><h2 class="h5 text-black">${data.register.carNumber}</h2></td>
                  </tr>
                  <tr>
                    <th class="product-total">연료</th>
                    <td class="product-total"><h2 class="h5 text-black">${data.register.carFuelType}</h2></td>
                  </tr>
                  <tr>
                    <th class="product-total">연비</th>
                    <td class="product-total"><h2 class="h5 text-black">${data.register.carFuelEffi}</h2></td>
                  </tr>
                  <tr>
                    <th class="product-total">내비게이션</th>
                    <td class="product-total"><h2 class="h5 text-black">${data.register.carNavi}</h2></td>
                  </tr>
                   <tr>
                    <th class="product-total">후방카메라</th>
                    <td class="product-total"><h2 class="h5 text-black">${data.register.carBackCam}</h2></td>
                  </tr>
                   <tr>
                    <th class="product-total">좌석 개수</th>
                    <td class="product-total"><h2 class="h5 text-black">${data.register.carSeatNum}</h2></td>
                  </tr>
                  <tr>
                    <th class="product-total">문 개수</th>
                    <td class="product-total"><h2 class="h5 text-black">${data.register.carDoorNum}</h2></td>
                  </tr>
                  <tr>
                    <th class="product-total">가격</th>
                    <td class="product-total"><h2 class="h5 text-black">${data.register.carFee}</h2></td>
                  </tr>
                      <tr>
                    <th class="product-total">참고사항</th>
                    <td class="product-total"><h2 class="h5 text-black">${data.register.carNote}</h2></td>
                  </tr>
               </table>
            </div>
            
            <div class="form-group row">
                <div class="col-md-6 mr-auto">
                   <p><a onclick="registerModify(${data.register.carIdx})" class="btn btn-primary">수정하기</a></p>
                </div>
              </div>
            <div class="form-group row">
                <div class="col-md-6 mr-auto">
                 <button class="btn btn-primary" >삭제하기</button>
	             </div>
              </div> 
          </form>
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
  

   

  <%@ include file="/WEB-INF/view/include/script.jsp" %>





<script>
<!-- 수정하기 페이지로 가기 -->
let registerModify = (carIdx) => {
	location.href="/register/rg_modify?carIdx=" + carIdx;
	
}



</script>




  </body>

</html>

