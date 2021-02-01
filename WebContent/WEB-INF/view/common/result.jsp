<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/include/head.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스크립트를 만들기 위한 페이지</title>
</head>
<body>
	<%-- request의 msg 속성(attribute)에 담겨온 message를 alert하고 
		url 속성에 담겨온 주소로 페이지를 이동
		el 사용해서 작성
	  --%>
	<script type="text/javascript">
		
		let context = "${context}"; //context 변수에 담았던 그거래 let context ="/";
		
		<%-- 안내창 출력 --%>
		<c:if test="${msg != null}">
			alert("${requestScope.msg}"); // ${msg} 똑같
		</c:if>
 	
		<%-- 뒤로가기 --%>
		<c:if test="${back != null}">
			history.back();
		</c:if>
		
		<%-- 페이지 이동 --%>
		<c:if test="${url != null}">
			location.href = context + '${url}';
		</c:if>
	
	
	
	
	
	//서버에서 응답하기 전에 응답할 html template을 완성하는 과정에 돌아간대
	// 컨트롤러에서 경로를 재지정했을때, 만약 해당리퀘스트에 msg에 setattribute햇다면
	// 메세지가 널 아니니까 트루 -> msg값 클라이언트한테 넘어감
	// attribute에 back이있다면 history back이 작동할테지
	
	
	
	
	
	
	
	
	
	
	</script>
</body>
</html>