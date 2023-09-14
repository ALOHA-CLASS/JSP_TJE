<%@page import="shop.dao.ProductRepository"%>
<%@page import="java.util.List"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<!-- bootstrap lib -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
</head>
<body>  
	<jsp:include page="header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">상품 정보</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
				<!-- button 태그로 이동하기 -->
				<!-- 
				<button type="button" class="btn btn-primary btn-lg px-4 gap-3" 
					onclick="location.href='./products.jsp'">상품목록</button>
				 -->
					
				<!-- a 태그 버튼 -->
				<a href="./products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">로그인</button>
			</div>
		</div>
	</div>
	<!-- 상품 정보 영역 -->
	
	<%
		String productId = request.getParameter("id");
		Product product = productDAO.getProductById(productId);
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-6">
				<h3><%= product.getName() %></h3>
				<p>상품ID : <%= product.getProductId() %>	</p>
				<p>제조사 : <%= product.getManufacturer()  %></p>
				<p>분류 : <%= product.getCategory()  %></p>
				<p>재고 수 : <%= product.getUnitsInStock()  %></p>
				<h4>가격 : <%= product.getUnitPrice() %> 원</h4>
				<p>
					<a href="" class="btn btn-info">상품 주문</a>
				</p>
			</div>
		</div>
	</div>
	
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>











