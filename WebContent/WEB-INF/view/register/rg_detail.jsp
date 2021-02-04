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
                <div class="custom-breadcrumbs"><a href="index.jsp">Home</a> <span class="mx-2">/</span> <strong>detail</strong></div>
              </div>

            </div>
          </div>
        </div>
      </div>

    
    
        <div class="site-section">
      <div class="container">
      
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
                    <th class="product-price">주차장소</th>
                    <td class="product-price">${ffffffffffffffff}</td>
                  </tr>
                  <tr>
                    <th class="product-regDate">차종</th>
                    <td class="product-regDate">소나타</td>
                  </tr>
                  <tr>
                    <th class="product-pickDate">차번호</th>
                    <td class="product-pickDate">2021</td>
                  </tr>
                  <tr>
                    <th class="product-total">연료</th>
                    <td class="product-total">경유</td>
                  </tr>
                  <tr>
                    <th class="product-total">연비</th>
                    <td class="product-total">1111</td>
                  </tr>
                  <tr>
                    <th class="product-total">내비게이션</th>
                    <td class="product-total">Y</td>
                  </tr>
                   <tr>
                    <th class="product-total">후방카메라</th>
                    <td class="product-total">N</td>
                  </tr>
                   <tr>
                    <th class="product-total">좌석 개수</th>
                    <td class="product-total">4</td>
                  </tr>
                  <tr>
                    <th class="product-total">문 개수</th>
                    <td class="product-total">4</td>
                  </tr>
                  <tr>
                    <th class="product-total">가격</th>
                    <td class="product-total">30000</td>
                  </tr>
                      <tr>
                    <th class="product-total">참고사항</th>
                    <td class="product-total">참고사항참고사항참고사항참고사항참고사항참고사항</td>
                  </tr>
               </table>
            </div>
            
            <div class="form-group row">
                <div class="col-md-6 mr-auto">
                  <p><a href="register/rg_modify" class="btn btn-primary btn-sm">수정하기</a></p>
                </div>
              </div>
          </form>
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
  

   

  <%@ include file="/WEB-INF/view/include/script.jsp" %>

  </body>

</html>

