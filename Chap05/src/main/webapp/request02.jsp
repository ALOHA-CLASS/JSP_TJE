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
	<h1>요청 헤더 정보</h1>
	<%
		Enumeration en = request.getHeaderNames();
		while(en.hasMoreElements()) {
			String headerName = (String) en.nextElement();
			String headerValue = request.getHeader(headerName);
	%>
		<h3>
			<%= headerName %> : <%= headerValue %>
		</h3>
	<%
		}
	%>
	
</body>
</html>





