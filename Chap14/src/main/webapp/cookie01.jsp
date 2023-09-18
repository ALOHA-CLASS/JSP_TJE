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
		Cookie[] cookies = request.getCookies();
		
		String userId = "";
		String rememberId = "";
		for(int i = 0 ; i < cookies.length ; i++) {
			if( cookies[i].getName().equals("userID") ) {
				userId = cookies[i].getValue(); 
			}
			if( cookies[i].getName().equals("rememberID") ) {
				rememberId = cookies[i].getValue(); 
			}
		}
	%>
	<form action="cookie01_pro.jsp" method="POST">
		<p>	아 이 디 : <input type="text" name="id" value="<%= userId %>">
		<p>	비밀번호 : <input type="text" name="passwd">
		<p>
			<%
				if( rememberId.equals("on") ) {
			%>			
				<input type="checkbox" name="rememberId" id="remember-id" checked />
			<%
				} else {
			%>
				<input type="checkbox" name="rememberId" id="remember-id" />
			<%
				}
			%>
			<label for="remember-id">아이디 저장</label>
		</p>
		<p>	<input type="submit" value="전송">
	</form>
</body>
</html>









