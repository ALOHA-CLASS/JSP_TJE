<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p> <h4>----- 세션 유효 시간 변경 전 -----</h4>
	<%
		// getMaxInactiveInterval()
		// : 세션의 유효시간을 반환하는 메소드
		int time = session.getMaxInactiveInterval() / 60;

		out.println("세션 유효 시간  : " + time + "분<br>");
	%>
	<p>	<h4>----- 세션 유효 시간 변경 후 -----</h4>
	<%
		// setMaxInactiveInterval()
		// : 초 단위로 세션의 유효시간을 설정하는 메소드
		session.setMaxInactiveInterval(60 * 60);
		time = session.getMaxInactiveInterval() / 60;

		out.println("세션 유효 시간  : " + time + "분<br>");
	%>
</body>
</html>









