<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
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
	
		// 장바구니 목록을 세션에서 가져오기
		List<Product> cartList = (List<Product>) session.getAttribute("cartList");
		if( cartList == null ) cartList = new ArrayList<Product>();
	%>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">장바구니</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Shop 쇼핑몰 입니다.</p>
			<div class="d-grid gap-2 d-sm-flex justify-content-sm-center">
					
				<!-- a 태그 버튼 -->
				<a href="<%= root %>/shop/products.jsp" class="btn btn-primary btn-lg px-4 gap-3">상품목록</a>
				<button type="button" class="btn btn-outline-secondary btn-lg px-4">로그인</button>
			</div>
		</div>
	</div>
	
	<!-- 장바구니 영역 -->
	<div class="container">
		<!-- 장바구니 목록 -->
		<table class="table table-striped table-hover table-bordered text-center align-middle">
			<thead>
				<tr class="table-primary">
					<th>상품</th>
					<th>가격</th>
					<th>수량</th>
					<th>소계</th>
					<th>비고</th>
				</tr>
			</thead>
			<tbody>
<!-- 				<tr> -->
<!-- 					<td>상품01</td>			 -->
<!-- 					<td>10,000</td>			 -->
<!-- 					<td>5</td>			 -->
<!-- 					<td>50,000</td>			 -->
<!-- 					<td>-</td>			 -->
<!-- 				</tr> -->
				<%
					int sum = 0;
					for(int i = 0 ; i < cartList.size() ; i++) {
						Product product = cartList.get(i);
						int total = product.getUnitPrice() * product.getQuantity();
						sum += total;
				%>
				<tr>
					<td><%= product.getName() %></td>			
					<td><%= product.getUnitPrice() %></td>			
					<td><%= product.getQuantity() %></td>			
					<td><%= total %></td>			
					<td><a href="" class="btn btn-danger">삭제</a></td>			
				</tr>
				<%
					}
				%>
			</tbody>
			<tfoot>
				<%
					if( cartList.isEmpty() ) {
				%>
				<tr>
					<td colspan="5">추가된 상품이 없습니다.</td>	
				</tr>
				<% } else { %>
				<tr>
					<td></td>
					<td></td>
					<td>총액</td>
					<td><%= sum %></td>
					<td></td>
				</tr>
				<%
					}
				%>
			</tfoot>
		</table>
	
		<!-- 버튼 영역 -->
		<div class="d-flex justify-content-between align-items-center p-3">
			<a href="" class="btn btn-lg btn-danger ">삭제하기</a>
			<a href="" class="btn btn-lg btn-primary">주문하기</a>
		</div>
	</div>
	
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>

















