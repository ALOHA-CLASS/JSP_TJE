<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 
		HTML 주석 : <!-- -.-> 
		JSP 주석  : <%-- --%>
	 -->
	<%-- 선언문 --%>
	<%-- : 변수 선언이나 메소드 정의를 하는 자바 코드 작성 --%>
	<%!
		String greeting = "환영합니다~!";
		String tagline = "Welcom to Web Page~!";
	%>
	<!-- 표현문 -->
	<!-- : 변수 접근, 수식 계산, 메소드 호출 등의 자바 코드 작성 -->
	<h1><%= greeting %></h1>
	<h3><%= tagline %></h3>
</body>
</html>





