<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>500 에러</title>
</head>
<body>
	<h1>500 에러 페이지</h1>
	<h3>시스템 일시적인 에러가 발생하였습니다.</h3>
	<h5>관리자에게 문의해주세요</h5>
<!-- 	<a href="/Chap11/main.jsp">메인 페이지</a> -->
	<a href="<%= request.getContextPath() %>/main.jsp">메인 페이지</a>
</body>
</html>