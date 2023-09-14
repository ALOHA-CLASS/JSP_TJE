<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />
<%
	request.setCharacterEncoding("UTF-8");

	String productId = request.getParameter("productId");
	String name = request.getParameter("name");
	String unitPrice = request.getParameter("unitPrice");
	String description = request.getParameter("description");
	String manufacturer = request.getParameter("manufacturer");
	String category = request.getParameter("category");
	String unitsInStock = request.getParameter("unitsInStock");
	String condition = request.getParameter("condition");
	
	// 가격, 재고 수는 int, long 타입으로 변환
	Integer price = unitPrice.isEmpty() ? 0 : Integer.parseInt(unitPrice);
	long stock = unitsInStock.isEmpty() ? 0 : Long.parseLong(unitsInStock);
	
	Product product = new Product();
	product.setProductId(productId);
	product.setName(name);
	product.setUnitPrice(price);
	product.setDescription(description);
	product.setManufacturer(manufacturer);
	product.setCategory(category);
	product.setUnitsInStock(stock);
	product.setCondition(condition);

	int result = productDAO.insert(product);		// 상품 데이터 등록
	 
	response.sendRedirect("products.jsp");			// 상품 목록으로 이동
%>





