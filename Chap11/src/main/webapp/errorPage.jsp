<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="error/500.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>에러 페이지</title>
</head>
<body>
	<%
		request.getParameter("name").toUpperCase();
	%>
</body>
</html>