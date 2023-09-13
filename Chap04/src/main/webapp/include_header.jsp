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
		String menu1 = request.getParameter("menu1");
		String menu2 = request.getParameter("menu2");
		String menu3 = request.getParameter("menu3");
	%>
	<header>
		<h1>헤더 영역</h1>
		<ul>
			<li><a href=""><%= menu1 %></a></li>
			<li><a href=""><%= menu2 %></a></li>
			<li><a href=""><%= menu3 %></a></li>
		</ul>
	</header>
</body>
</html>