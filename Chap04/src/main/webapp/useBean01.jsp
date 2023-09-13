<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 자바빈즈는 반드시 패키지에 있어야합니다. --%>
	<jsp:useBean id="cal" class="beans.Calculator"  />
	
	<%
		int a = 10, b = 20;
		int sum = cal.sum(a, b);
	%>
	
	<h1>sum = <%= sum %></h1>
</body>
</html>