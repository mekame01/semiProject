<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="everyBB.common.code.Code"
    %>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 메일 텍스트들어가는곳</title>
</head>
<body>
	<h1>회원가입을 완료해주세요!</h1>
	<h1>반갑습니다. ${param.userId}님.</h1>
	<h1>아래의 링크를 클릭해 회원가입을 완료해주세요.</h1>
	<a href="<%= Code.DOMAIN %>/member/joinimpl">회원가입완료</a>
	<img src="https://mblogthumb-phinf.pstatic.net/MjAxODAxMjlfMTY1/MDAxNTE3MjM1MjQyMDI2.E5u-JB1YdSwoeLdg68YFUc6nUEqdUmaLdp6-LW1389Ug.lFtz9NWMwsqgpqufXt7bj__Jclmnv7pP-rj3kvzm0hgg.JPEG.heima916/IMG_0846.jpg?type=w800"/>

<%-- jsp에 접근할 친구가 필요해 mail 안에 mailhandler --%>

</body>
</html>