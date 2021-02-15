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
   

      <br><br>
      <div class="hero inner-page" style="background-image: url('<%= request.getContextPath() %>/resources/images/hero_1_a.jpg');">
        
        <div class="container">
          <div class="row align-items-end ">
            <div class="col-lg-5">

              <div class="intro">
                <h1><strong>차량목록</strong></h1>
                <div class="custom-breadcrumbs"><a href="/index.jsp">Home</a> <span class="mx-2">/</span> <strong>차량목록</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>
  



      

    <div class="site-section bg-light">
      <div class="container">
        <div class="row">
          <div class="col-lg-7">
            <h2 class="section-heading"><strong>Car Listings</strong></h2>
            <p class="mb-5">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>    
          </div>
        </div>
        

        <div class="row">
          <div class="col-md-6 col-lg-4 mb-4">

            <div class="listing d-block  align-items-stretch">
              <div class="listing-img h-100 mr-4">
                  <c:forEach var="file" items="${data.fileList}">
      	 			<img src="/upload/${file.savePath}${file.renameFileName}" alt="이미지" class="img-fluid"/>
      				</c:forEach>
              </div>
              <div class="listing-contents h-100">
                <h3>${data.register.carModel}</h3> <!-- 모델명 -->
                
                <div class="d-block d-md-flex mb-3 border-bottom pb-3">
                  <div class="listing-feature pr-4">
                    <span class="caption">문개수:</span>
                    <span class="number">${data.register.carDoorNum}</span>
                  </div>
                  <div class="listing-feature pr-4">
                    <span class="caption">좌석개수:</span>
                    <span class="number">${data.register.carSeatNum}</span>
                  </div>
                  <div class="listing-feature pr-4">
                    <span class="caption">가격:</span>
                    <span class="number">${data.register.carFee}</span>
                  </div>
                </div>
                <div>
                
                  <p><a onclick="registerDetail(${data.register.carIdx})" class="btn btn-primary btn-sm">상세보기</a></p>
                  
                </div>
              </div>

            </div>
          </div>

       
          


         

        </div>
        <div class="row">
          <div class="col-5">
            <div class="custom-pagination">
              <a href="#">1</a>
              <span>2</span>
              <a href="#">3</a>
              <a href="#">4</a>
              <a href="#">5</a>
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

<!-- 사진파일.. -->
<script>
   function submitData(url){
      location.href = url;
   } 
   
   function downloadFile(ofname,rfname,savePath){
	  let params = {'ofname':ofname,
			  		'rfname':rfname,
			  		'savePath':savePath};
	  
      location.href = '${context}' + "/register/download?" + urlEncodedForm(params);
   }

</script>

<!-- 상세보기 버튼 -->
<script>
let registerDetail = (carIdx) => {
	location.href="/register/rg_detail?carIdx=" + carIdx;
	
}
</script>




  </body>

</html>


</body>
</html>