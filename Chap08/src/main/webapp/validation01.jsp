<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		// 로그인 유효성 검사
		function checkLogin() {
			let form = document.loginForm	// name이 loginForm 인 폼 요소를 가져옴
			
			// [아이디]
			// 입력 여부 검증
			if( form.id.value == "" ) {
				alert('아이디를 입력해주세요')
				form.id.focus()
				return false
			}
			
			// 아이디 글자 수 검증 
			if( form.id.value.length < 6 || form.id.value.length > 20 ) {
				alert('아이디는 6~20자 이내로 입력 가능합니다.')
				form.id.select()
				return false
			}
			
			// [비밀번호]
			// 입력 여부 검증
			if( form.pw.value == "" ) {
				alert('비밀번호를 입력해주세요')
				form.pw.focus()
				return false
			}
			
			// 비밀번호 글자 수 검증
			if( form.pw.value.length < 6 ) {
				alert('비밀번호는 6자 이상으로 입력해야합니다.')
				form.pw.select()
				return false
			}
				
			// form.submit()	// - input type="button" 태그에 onclick 속성을 사용할 때
			return true			// - form 태그에 onsubmit 속성을 사용할 때
		}
	</script>
</head>
<body>
	<!-- onsubmit="return 여부"
		 - 여부 : true 이면, submit(요청전송)
		  		 false 이면, submit 안 함
	 -->
	<form name="loginForm" onsubmit="return checkLogin()" action="validation01_pro.jsp" method="post" >
		<p>아이디 : <input type="text" name="id" maxlength="20" /> </p>
		<p>비밀번호 : <input type="password" name="pw" /> </p>
<!-- 		<p><input type="button" value="로그인" onclick="checkLogin()" /></p> -->
		<p><input type="submit" value="로그인" /></p>
	</form>
</body>
</html>


