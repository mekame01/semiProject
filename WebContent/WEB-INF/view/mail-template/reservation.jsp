<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="everyBB.common.code.Code"
    %>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 예약이 도착했습니다!</title>
</head>
<body>
	<h1>자동차 예약이 도착했습니다!</h1>
	<h1>아래의 링크를 클릭해 예약을 수락하거나 거절해주세요.</h1>
	<h2>위치 : ${param.resParking}</h2>
	<h2>픽업시간 : ${param.resPickupDate}</h2>
	<h2>반환시간 : ${param.resReturnDate}</h2>
	<h2>가격 : ${param.resFee}원</h2>
	<h1><a href="<%= Code.DOMAIN %>/reservationHistory/insert?res_state=RH02&res_idx=${param.resIdx}&user_id=${param.userId}&car_idx=${param.carIdx}">수락</a></h1>  
	<h1><a href="<%= Code.DOMAIN %>/reservationHistory/insert?res_state=RH09&res_idx=${param.resIdx}&user_id=${param.userId}&car_idx=${param.carIdx}">거절</a></h1>

<%-- jsp에 접근할 친구가 필요해 mail 안에 mailhandler --%>
</script>
</body>
</html>