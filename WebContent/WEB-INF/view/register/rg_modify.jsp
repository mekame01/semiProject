<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="/WEB-INF/view/include/head.jsp" %>    
 
 <!-- 주소 --------------------------------------------------------------->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=b7d1c062f6e81ad367d8bb5f892fc8b1&libraries=services"></script> <!-- [은지]api -->
 <!-- ---------------------------------------------------------------- -->
 
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
            <form action="${fffffff}/register/rg_list" method="post" id="register">
                 
               <div class="form-group row" >
                <div class="col-md-12">
              		<input type="text" id="address" class="form-control" placeholder="주소" required readonly >
              		
              		<div class="d-flex justify-content-end">
					<input type="button"  class="btn btn-info" onclick="execDaumPostcode()" value="주소 검색"><br>
					</div>
					<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
					
              </div>
              </div> 
                     
              <div class="form-group row">
                 <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="차종" required >
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" placeholder="차 번호" required >
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" list="depListFt" placeholder="연료" required >
               		<datalist id="depListFt">
       					 <option value="휘발유"></option>
       					 <option value="경유"></option>
				         <option value="수소"></option>
				         <option value="전기"></option>
				         <option value="하이브리드"></option>
				    </datalist>
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" placeholder=" km/ℓ 연비" required >
                </div>
              </div>
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" list="depListNv" placeholder="내비게이션 유무" required >
                  	<datalist id="depListNv">
       					 <option value="내비게이션 있음"></option>
       					 <option value="내비게이션 없음"></option>
				    </datalist>
                </div>
                <div class="col-md-6">
                  <input type="text" class="form-control" list="depListBc" placeholder="후방카메라 유무" required >
               		 <datalist id="depListBc">
       					 <option value="후방카메라 있음"></option>
       					 <option value="후방카메라 없음"></option>
				    </datalist>
                
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="number" class="form-control" placeholder="좌석 개수" required >
                </div>
                <div class="col-md-6">
                  <input type="number" class="form-control" placeholder="문 개수" required >
                </div>
              </div>
              
              <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" list="depListTm" placeholder="자동/수동" required >
                  	<datalist id="depListTm">
       					 <option value="자동"></option>
       					 <option value="수동"></option>
				    </datalist>
                </div>
                 <div class="col-md-6">
                 <input type="file" id="image" class="form-control" accept="image/*" onchange="setThumbnail(event);" required /> 
              </div>
              
              </div>
                
              
               <div class="form-group row">
                <div class="col-md-6 mb-4 mb-lg-0">
                  <input type="text" class="form-control" placeholder="가격" required >
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

     



<!-- 주소입력 -->
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 5 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });


    function execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("address").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서  //***위도경도!!!!!!!!!!
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        console.log(coords);
                    
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            }
        }).open(); 
        
        
    }
</script>

<!-- 사진업로드 일단 대충한거....... -->
<script> 
function setThumbnail(event) { 
	var reader = new FileReader();
	reader.onload = function(event) {
		var img = document.createElement("img");
		img.setAttribute("src", event.target.result);
	//document.querySelector("div#image_container").appendChild(img);};reader.readAsDataURL(event.target.files[0]);}
</script> 


<!-- 등혹하기 submit -->
<script>
  


 </script>




</body>
</html>