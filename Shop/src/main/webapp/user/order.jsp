<%@page import="java.util.ArrayList"%>
<%@page import="shop.dto.Product"%>
<%@page import="java.util.List"%>
<%@page import="shop.dao.UserRepository"%>
<%@page import="shop.dto.User"%>
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
		String loginId = (String) session.getAttribute("loginId");
		String orderPhone = (String) session.getAttribute("orderPhone");
		boolean login = false;
		if( loginId != null && !loginId.isEmpty() ) {
			// response.sendRedirect(root);
			login = true;
		}
		// 장바구니 목록을 세션에서 가져오기
		
		List<Product> cartList = (List<Product>) session.getAttribute("cartList");
		if( cartList == null ) cartList = new ArrayList<Product>();
		int cartCount = cartList.size();
	%>
	
	<jsp:include page="/layout/header.jsp" />
	
	<div class="row m-0 mypage">
		<div class="sidebar border border-right col-md-3 col-lg-2 p-0 bg-body-tertiary">
			<div class="d-flex flex-column flex-shrink-0 p-3 bg-body-tertiary">
			    <ul class="nav nav-pills flex-column mb-auto">
			      <!-- 로그인 시 -->
			      <% if( login ) { %>
			      <li class="nav-item">
			        <a href="<%= root %>/user/update.jsp" class="nav-link link-body-emphasis">
			          회원정보 수정
			        </a>
			      </li>
			      <% }  %>
			      
			      <li>
			        <a href="#" class="nav-link active" aria-current="page" >
			          주문내역
			        </a>
			      </li>
			    </ul>
			    <hr>
			  </div>
		</div>
		
		<div class="col-md-9 ms-sm-auto col-lg-10 p-0 m-0">
			<div class="px-4 py-3 my-3 text-center">
				<h1 class="display-5 fw-bold text-body-emphasis">주문 내역</h1>
				<div class="col-lg-6 mx-auto">
					<% if( !login ) { %>	
						<p class="lead mb-4">비회원 주문하신 경우, 전화번호와 주문 비밀번호를 입력해주세요.</p>
					<% } %>
				</div>
			</div>
			
			<!-- 주문 내역 영역 -->
			<div class="container shop m-auto mb-5">
			
				<form action="<%= root %>/user/order_pro.jsp" method="post">
				<% if( !login ) { %>
						<table class="table">
							<tr>
								<td>전화번호 :</td>
								<td>
									<input type="text" class="form-control" name="orderPw" placeholder="- 생략하고 숫자만 입력해주세요.">
								</td>
							</tr>
							<tr>
								<td>주문 비밀번호 :</td>
								<td>
									<input type="password" class="form-control" name="orderPw" >
								</td>
							</tr>
						</table>
				<% } %>
				</form>
				
				<% if( login || ( orderPhone != null && orderPhone.isEmpty() ) ) { %>
				<!-- 주문 내역 목록 -->
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
							<td><a href="removeCart.jsp?id=<%= product.getProductId() %>" class="btn btn-danger">삭제</a></td>			
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
							<td id="cart-sum"><%= sum %></td>
							<td></td>
						</tr>
						<%
							}
						%>
					</tfoot>
				</table>
				
				<% } %>
			</div>
			
			<jsp:include page="/layout/footer.jsp" />
		</div>
	</div>
	
	
	
	<jsp:include page="/layout/script.jsp" />
	
	

	<script>
		
		let form = document.updateForm
		
		// 성별 선택
		let tempGender = document.getElementById('temp-gender')
		let radioFemale = document.getElementById('gender-female')
		let radioMale = document.getElementById('gender-male')
		// alert(tempGender.value)
		if( tempGender.value == '남' )		radioMale.checked = true
		if( tempGender.value == '여' )		radioFemale.checked = true
		
		
		// 생일 월 (select) 선택
		let tempMonth = document.getElementById('temp-month')
		let selectMonth = form.month
		selectMonth.value = tempMonth.value
		
		
		// 메일 도메인 (select) 선택
		let tempEmail2 = document.getElementById('temp-email2')
		let selectEmail2 = form.email2
		selectEmail2.value = tempEmail2.value
		
		
		// 탈퇴 체크
		function alertDel() {

			let form = document.updateForm

			let check = confirm('정말 탈퇴하시겠습니까?')

			if( check ) {
				form.action = 'remove.jsp'
				form.submit()
			}

		}
	
	</script>
</body>
</html>








