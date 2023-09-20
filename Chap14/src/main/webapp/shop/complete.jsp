<%@page import="java.net.URLDecoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Shop</title>
	<jsp:include page="/layout/link.jsp" />
</head>
<body>   
	<% 
	
		String root = request.getContextPath();
		
		// 주문 완료 후, sessionId 로 주문번호를 확인
		String ship_cartId = "";
		String ship_addressName = "";
		
		Cookie[] cookies = request.getCookies();
		
		if( cookies != null ) {
			for(int i = 0 ; i < cookies.length ; i++) {
				Cookie cookie = cookies[i];
				String cookieName = cookie.getName();
				String cookieValue = URLDecoder.decode( cookie.getValue(), "UTF-8" );
				switch(cookieName) {
				 	case "ship_cartId" 			: ship_cartId = cookieValue;		break;
				 	case "ship_addressName" 	: ship_addressName = cookieValue;	break;
				}
			}
		}
		
		// 주문 완료 후, 장바구니 목록 전체 삭제 (session 만료)
		// session.invalidate();
		session.setAttribute("cartList", null);
		
		
		// 배송 정보를 저장한 쿠키는 삭제
		if( cookies != null ) {
			for(int i = 0 ; i < cookies.length ; i++) {
				Cookie cookie = cookies[i];
				String cookieName = cookie.getName();
				cookie.setValue("");
				switch(cookieName) {
				 	case "ship_cartId" 			: cookie.setMaxAge(0); break;
				 	case "ship_name" 			: cookie.setMaxAge(0); break;
				 	case "ship_date" 			: cookie.setMaxAge(0); break;
				 	case "ship_country" 		: cookie.setMaxAge(0); break;
				 	case "ship_zipCode" 		: cookie.setMaxAge(0); break;
				 	case "ship_addressName" 	: cookie.setMaxAge(0); break;
				}
				response.addCookie(cookie);
			}
		}
	%>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">주문 완료</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
					
				<!-- a 태그 버튼 -->
				<a href="<%= root %>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">로그인</button>
			</div>
		</div>
	</div>
	
	<!-- 주문 완료 확인 -->
	<div class="container mb-5 p-5">
		<h2>주문이 완료되었습니다.</h2>
		<p>주문번호 : <%= ship_cartId %></p>
		<p>배송지 : <%= ship_addressName  %></p>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





