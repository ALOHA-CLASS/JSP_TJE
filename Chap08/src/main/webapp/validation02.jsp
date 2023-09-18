<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script>
		// 로그인 유효성 검사
		function checkJoin() {   
			let form = document.joinForm	// name이 joinForm 인 폼 요소를 가져옴
			
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
			
			// [이름]
			// 입력 여부 검증
			if( form.name.value == "" ) {
				alert('이름을 입력해주세요')
				form.name.focus()
				return false
			} 
			
			// 이름 검증 - 이름 첫글자는 숫자로 사용 불가
			if( !isNaN( form.name.value.substr(0, 1) ) ) {
				alert('이름은 숫자로 시작할 수 없습니다')
				form.name.select()
				return false
			}
				
			// form.submit()	// - input type="button" 태그에 onclick 속성을 사용할 때
			return true			// - form 태그에 onsubmit 속성을 사용할 때
		}
		
		// 숫자 키 입력 검증
		function checkNumber() {
			let form = document.joinForm
			
			console.log( event.keyCode )
			
			// 숫자가 아닌 경우
			if( !(event.keyCode >= 48 && event.keyCode <= 57) ) {
				alert('숫자만 입력 가능합니다')
				event.returnValue = false		// 입력반환값 여부
				form.age.value = ''				
			}
		}
	</script>
</head>
<body>
	<!-- onsubmit="return 여부"
		 - 여부 : true 이면, submit(요청전송)
		  		 false 이면, submit 안 함
	 -->
	<form name="joinForm" onsubmit="return checkJoin()" action="validation02_pro.jsp" method="post" >
		<p>아이디 : <input type="text" name="id" maxlength="20" /> </p>
		<p>비밀번호 : <input type="password" name="pw" /> </p>
		<p>이름 : <input type="text" name="name" /> </p>
		<p>나이 : <input type="text" name="age" onkeyup="checkNumber()" /> </p>
		
		
<!-- 		<p><input type="button" value="로그인" onclick="checkJoin()" /></p> -->
		<p><input type="submit" value="로그인" /></p>
	</form>
</body>
</html>


