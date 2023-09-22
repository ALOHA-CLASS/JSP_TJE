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
		
		if( loginId == null || loginId.equals("") ) {
			response.sendRedirect(root);
		}
		
		UserRepository userDAO = new UserRepository();
		User loginUser = userDAO.getUserById(loginId);
		
		// 이메일 : 아이디@도메인 분리
		String mail = loginUser.getMail();
		String[] email = mail.split("@");
		String email1 = email[0];
		String email2 = email[1];
		
		// 생일 : 연/월/일 분리
		String[] birth = loginUser.getBirth().split("/");
		String year = "";
		String month = "";
		String day = "";
		if( birth.length > 0 ) {
			year = birth[0];
			month = birth[1];
			day = birth[2];
		}
	%>
	
	<jsp:include page="/layout/header.jsp" />
	<div class="px-4 py-5 my-5 text-center">
		<h1 class="display-5 fw-bold text-body-emphasis">회원 정보 수정</h1>
	</div>
	
	<!-- 회원 가입 영역 -->
	<div class="container-sm m-auto mb-5" style="max-width: 600px">
		<form action="update_pro.jsp" name="updateForm" method="post" >
		
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">아이디</label>
				<input type="text" class="form-control col-md-10" 
					   name="id" placeholder="아이디" required
					   value="<%= loginUser.getId() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">이름</label>
				<input type="text" class="form-control col-md-10" 
					   name="name" placeholder="이름" required
					   value="<%= loginUser.getName() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<div class="col-md-2 p-0">
					<label class="input-group-text" id="">성별</label>
				</div>
				<div class="col-md-10 d-flex align-items-center">
					<input type="hidden" name="temp-gender" value="<%= loginUser.getGender() %>"
						   id="temp-gender" />
					<div class="radio-box d-flex">
						<div class="radio-item mx-5">
							<input type="radio" class="form-check-input" name="gender" value="여" id="gender-female"> 
							<label for="gender-female">여자</label>
						</div>
						
						<div class="radio-item mx-5">
							<input type="radio" class="form-check-input " name="gender" value="남" id="gender-male"> 
							<label for="gender-male">남자</label>
						</div>
						
					</div>
				</div>
			</div>
			
			
			<div class="input-group mb-3 row">
				<div class="col-md-2 p-0">
					<label class="input-group-text" id="">생일</label>
				</div>
				<div class="col-md-10 d-flex align-items-center">
					<div class="row">
						<div class="col">
							<input type="text" class="form-control" name="year" placeholder="출생년도 " size="6" 
								   value="<%= year %>">
						</div>
						
						<div class="col">
							<input type="hidden" name="tempMonth" value="<%= month %>" id="temp-month">
							<select name="month" class="h-100 form-select" >
								<option value="01">1월</option>
								<option value="02">2월</option>
								<option value="03">3월</option>
								<option value="04">4월</option>
								<option value="05">5월</option>
								<option value="06">6월</option>
								<option value="07">7월</option>
								<option value="08">8월</option>
								<option value="09">9월</option>
								<option value="10">10월</option>
								<option value="11">11월</option>
								<option value="12">12월</option>
							</select>
						</div>
						
						<div class="col">
							<input type="text" class="form-control" name="day" placeholder="일자" size="4" 
								   value="<%= day %>">
						</div>
					</div>
				</div>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">이메일</label>
				
				<div class="row col-md-10 align-items-center">
					<div class="col-4 px-0">
						<input type="text" class="form-control col-md-10" 
							   name="email1" placeholder="이메일"
							   value="<%= email1 %>">
					</div>
					<div class="col-auto">
						@
					</div>
					<div class="col-4 px-0">
						<input type="hidden" name="tempEmail2" value="<%= email2 %>" id="temp-email2">
						<select name="email2" class="form-select">
							<option value="naver.com">naver.com</option>
							<option value="gmail.com">gmail.com</option>
							<option value="kakao.com">kakao.com</option>
						</select>
					</div>
				</div>
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">전화번호</label>
				<input type="text" class="form-control col-md-10" 
					   name="phone" placeholder="전화번호"
					   value="<%= loginUser.getPhone() %>">
			</div>
			
			<div class="input-group mb-3 row">
				<label class="input-group-text col-md-2" id="">주소</label>
				<input type="text" class="form-control col-md-10" 
					   name="address" placeholder="주소"
					   value="<%= loginUser.getAddress() %>">
			</div>
			
			
			<div class="d-flex justify-content-center mt-5 mb-5">
				<input type="submit" class="btn btn-lg btn-primary mx-3" value="수정" />
				<a href="javascript: ;" onclick="alertDel()" class="btn btn-lg btn-danger mx-5" >탈퇴</a>
				<a href="javascript: history.back()" class="btn btn-lg btn-secondary mx-3">취소</a>
			</div>	
			
			
		</form>
	
	</div>
	
	
	<jsp:include page="/layout/footer.jsp" />
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








