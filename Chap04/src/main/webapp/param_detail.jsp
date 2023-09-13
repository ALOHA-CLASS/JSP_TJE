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
		String id = request.getParameter("id");
		int age = Integer.parseInt( request.getParameter("age") );
	%>
	<h3>이름 : <%= id %></h3>
	<h3>나이 : <%= age %></h3>
</body>
</html>