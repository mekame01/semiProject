<%@page import="everyBB.common.code.Code"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
      pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/include/head.jsp" %>      
<body>
<head>
<style type="text/css">

.icon-plus-square:before {
   cursor: pointer;
   font-size: 15em;
}
</style>
</head>
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
               <p class="mb-5">차량을 등록해 주세요!</p>      
            </div>
         </div>
         
   
         <div class="row">
            <c:forEach var="data" items="${requestScope.dataList}" varStatus="i">
         
               <div class="col-md-6 col-lg-4 mb-4">
      
                  <div class="listing d-block   align-items-stretch">
                     <div class="listing-img h-100 mr-4">
                   
                    <img src="/upload/${data.fileList[0].savePath}${data.fileList[0].renameFileName}" alt="이미지" class="img-fluid"/>
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
                           <p><a onclick="registerDetail(${data.register.carIdx})" class="btn btn-primary btn-sm" style="color: white;">상세보기</a></p>
                        </div>
                     </div>
                  </div>
               </div>
            </c:forEach>
          
            <div class="col-md-6 col-lg-4 mb-4">
               <a href="/register/register"><p class="icon-plus-square"></p></a>
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
               <a href="#" class="btn btn-primary btn-white">예약하러가기</a>
            </div>
         </div>
      </div>
   </div>
   
<%@ include file="/WEB-INF/view/include/footer.jsp" %>

</div>

<%@ include file="/WEB-INF/view/include/script.jsp" %>

<!-- 사진파일.. -->
<script type="text/javascript">
    function submitData(url){
         location.href = url;
    } 
    
<!-- 상세보기 버튼 -->
let registerDetail = (carIdx) => {
   location.href="/register/rg_detail?carIdx=" + carIdx;
   
}


console.dir("${requestScope.dataList}");
console.dir("${requestScope.dataList[0].car}");
</script>





</body>
</html>