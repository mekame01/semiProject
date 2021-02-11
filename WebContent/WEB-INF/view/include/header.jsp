<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<header class="site-navbar site-navbar-target" role="banner">
	<div class="container">
		<div class="row align-items-center position-relative">
	        <div class="col-3">
			<div class="site-logo">
				<a href="/index"><strong>every붕붕</strong></a>
	        </div>
	        </div>

	        <div class="col-9  text-right">
	            <span class="d-inline-block d-lg-none">
	              	<a href="#" class=" site-menu-toggle js-menu-toggle py-5 ">
	              		<span class="icon-menu h3 text-black">
	              		</span>
	              	</a>
	            </span>
	            
	            <nav class="site-navigation text-right ml-auto d-none d-lg-block" role="navigation">
	                <ul class="site-menu main-menu js-clone-nav ml-auto">
	                  	<li class="active"><a href="/index" class="nav-link">Home</a></li>
	                  	<li><a href="/register/guide" class="nav-link">안내</a></li>
	                  	<li><a href="/question/faq" class="nav-link">FAQ</a></li>
	                  	<li><a href="/register/register" class="nav-link">차량 등록</a></li>
	                  	<c:choose>
	                  		<c:when test="${not empty sessionScope.user.userId}">
			                  	<li><a href="/member/mypage" class="nav-link">마이페이지</a></li>
			                  	<li><a href="/member/logout" class="nav-link">로그아웃</a></li>
	                  		</c:when>
	                  		<c:otherwise>
			                  	<li><a href="" class="nav-link" style="visibility: hidden;">마이페이지</a></li>
		    	              	<li><a href="/member/login" class="nav-link">로그인</a></li>
	                  		</c:otherwise>
	                  	</c:choose>
	                </ul>
	            </nav>
	        </div>
        </div>
    </div>
</header>
<script type="text/javascript">

</script>