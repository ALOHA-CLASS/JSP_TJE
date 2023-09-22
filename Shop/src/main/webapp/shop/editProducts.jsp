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
	<jsp:include page="/layout/link.jsp" />
</head>
<body>  
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">상품 편집</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">쇼핑몰 상품 목록 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
			
				<a href="add.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품 등록</a>
				<!-- [NEW] 상품 편집 버튼 추가 -->
				<a href="editProducts.jsp" class="btn btn-success btn-lg px-4 gap-3">상품 편집</a>
				
			</div>
		</div>
	</div>
	<%
		List<Product> productList = productDAO.list(); 
	%>
	<div class="container mb-5">
		<div class="row gy-4">
			<%
				for(int i = 0 ; i < productList.size() ; i++) {
					Product product = productList.get(i);
			%>
				<div class="col-md-6 col-xl-4 col-xxl-3">
					<div class="card p-3">
						<!-- 이미지 영역 -->
						<div class="img-content">
							<img src="img?id=<%= product.getProductId() %>" class="w-100 p-2" />
						</div>
						<!-- 컨텐츠 영역 -->
						<div class="content">
							<h3 class="text-center"><%= product.getName() %></h3>
							<p><%= product.getDescription() %></p>
							<p class="text-end price">₩ <%= product.getUnitPrice() %></p>
							<p class="d-flex justify-content-end">
								<!-- [NEW] 수정 버튼으로 변경 -->
								<a href="./update.jsp?id=<%= product.getProductId() %>"
										   class="btn btn-primary mx-2">수정</a>
								<!-- [NEW] 삭제 버튼 추가 -->
								<a href="./remove_pro.jsp?id=<%= product.getProductId() %>"
										   class="btn btn-danger mx-2">삭제</a>
							</p>
						</div>						
					</div>
				</div>
			<%
				}
			%>
		</div>
	</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>





