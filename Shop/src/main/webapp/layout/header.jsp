<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	List<Product> cartList = (List<Product>) session.getAttribute("cartList");
	int cartCount = cartList == null ? 0 : cartList.size();
	
	String root = request.getContextPath();
	
	String loginId = (String) session.getAttribute("loginId");
	
%>
<nav class="navbar bg-dark navbar-expand-lg bg-body-tertiary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="<%= root %>">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="<%= root %>/shop/products.jsp">Product</a>
        </li>
      </ul>
       <ul class="navbar-nav d-flex align-items-center px-3">
       	<%
       		if( loginId == null || loginId.equals("") ) {
       	%>
       	<!-- 비로그인 시 -->
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="<%= root %>/user/login.jsp">로그인</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="<%= root %>/user/join.jsp">회원가입</a>
        </li>
        <%
       		} else {
        %>
        <!-- 로그인 시 -->
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="<%= root %>/user/update.jsp"><%= loginId %></a>
        </li>
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="<%= root %>/user/logout.jsp">로그아웃</a>
        </li>
        <%
        	}
        %>
        <li class="nav-item">
	        <a class="nav-link position-relative" aria-current="page" href="<%= root %>/shop/cart.jsp">
	        	<i class="material-symbols-outlined">shopping_bag</i>
	        	<span class="cart-count"><%= cartCount %></span>
	        </a>
        </li>
      </ul>
      <form class="d-flex" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">Search</button>
      </form>
    </div>
  </div>
</nav>




