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
		<h1 class="display-5 fw-bold text-body-emphasis">상품 목록</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">쇼핑몰 상품 목록 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
			
				<!-- [NEW] 상품 등록 버튼 추가 -->
				<a href="add.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품 등록</a>
				
				<!-- 
				<button type="button" class="btn btn-primary btn-lg px-4 gap-3">Primary	button</button>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">Secondary</button>
				 -->
			</div>
		</div>
	</div>
	<%
		List<Product> productList = productDAO.list(); 
	%>
	<div class="container">
		<div class="row">
			<%
				for(int i = 0 ; i < productList.size() ; i++) {
					Product product = productList.get(i);
			%>
				<div class="col-md-4">
					<!-- [NEW] 이미지 썸네일 추가 -->
					<img src="img?id=<%= product.getProductId() %>" class="w-100 p-2" />
					
					<h3><%= product.getName() %></h3>
					<p><%= product.getDescription() %></p>
					<p><%= product.getUnitPrice() %></p>
					<p>
						<%-- product.jsp?id=P1001 --%>
						<a href="./product.jsp?id=<%= product.getProductId() %>"
						   class="btn btn-primary">상세 정보</a>
					</p>
				</div>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
	<jsp:include page="script.jsp" />
</body>
</html>





