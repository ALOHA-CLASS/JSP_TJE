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
		request.setCharacterEncoding("UTF-8");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if( id.equals("joeun") && pw.equals("123456") ) {
			// 리다이렉트 방식으로 페이지 이동
			response.sendRedirect("response01_success.jsp");
		} 
		else {
			response.sendRedirect("response01_failed.jsp");
		}
	%>
</body>
</html>







