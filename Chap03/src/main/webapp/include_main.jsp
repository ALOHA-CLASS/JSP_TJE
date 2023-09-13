<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>include</title>
</head>
<body>
	<%
		String menu1 = "home";
		String menu2 = "board";
		String menu3 = "gallery";
	%>
	<%-- 디렉티브 태그 include --%>
	<%@ include file="include_header.jsp" %>
	<div class="container">
		<h1>컨텐츠 영역</h1>
		<h3><%=new Date()%></h3>
	</div>
	<%
		String copy = "copyright";
	%>
	<%@ include file="include_footer.jsp" %>
</body>
</html>








