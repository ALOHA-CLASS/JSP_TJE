<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%-- 
		선언문		: 변수 선언 O, 메소드 정의 O
					  - _jspService( ) 외부에 변수 선언
		스크립틀릿		: 변수 선언 O, 메소드 정의 X
					  - _jspService( ) 내부에 변수 선언
	--%>
	<%!
		int a = 100;
	%>
	<%
		int a = 10;
		int b = 20;
		int c = 30;
		int sum = a + b + c;
	%>
	<%= a + b + c %>
	<%= sum %>
</body>
</html>






