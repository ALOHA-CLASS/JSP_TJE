<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		String user_id = request.getParameter("id");
		String user_pw = request.getParameter("passwd");
		String remember_id = request.getParameter("rememberId");		// 아이디 저장 여부
		
		// checkbox 체크 시, 기본값을 on 이 넘어온다
		// out.println("remember_id : " + remember_id);
		
		// ✅ 아이디 저장 체크 시, 쿠키 생성
		if( remember_id != null && remember_id.equals("on") ) {
			Cookie cookie_id = new Cookie("userID", user_id);
			Cookie cookie_remeber_id = new Cookie("rememberID", remember_id);
			response.addCookie(cookie_id);
			response.addCookie(cookie_remeber_id);
			out.println("아이디를 쿠키에 저장했습니다<br>");
		} 
		// 🟩 아이디 저장 미체크
		else {
			Cookie cookie_id = new Cookie("userID", "");
			Cookie cookie_remeber_id = new Cookie("rememberID", "");
			cookie_id.setMaxAge(0);
			cookie_remeber_id.setMaxAge(0);
			response.addCookie(cookie_id);
			response.addCookie(cookie_remeber_id);
			out.println("아이디를 쿠키에 해제했습니다<br>");
		}

		if (user_id.equals("admin") && user_pw.equals("1234")) {
			out.println(user_id + "님 환영합니다");
		} else {
			out.println("로그인에 실패했습니다");
		}
	%>
</body>
</html>



