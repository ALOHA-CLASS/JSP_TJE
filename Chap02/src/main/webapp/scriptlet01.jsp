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
		for(int i = 1 ; i <= 10 ; i++ ) {
			out.println("<h3>" + i + "</h3>");
		}
	%>
	<hr>
	<%
		for(int i = 1 ; i <= 10 ; i++ ) {
	%>
			<h3><%= i %></h3>
	<%
		} 
	%>
	
</body>
</html>