<%@page import="java.io.File"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%> 
<%@page import="org.apache.commons.fileupload.DiskFileUpload"%>
<%@page import="shop.dto.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="productDAO" class="shop.dao.ProductRepository" />
<%       
	// request.setCharacterEncoding("UTF-8");

	String productId = request.getParameter("id");
	int result = productDAO.delete(productId);		// 상품 데이터 수정
	response.sendRedirect("editProducts.jsp");		// 상품 편집으로 이동
%>





