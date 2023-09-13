<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%!
		int sum(int a, int b) {
			return a + b;
		}
	%>
	<h1>
	<%-- 
		out : JSP에서 출력을 하는 내장 객체 
			  서블릿에서 출력하는 javax.servlet.jsp.JspWriter 객체가 내장되어 있어서 
			  생성하지 않고 바로 사용할 수 있다. 
			  스크립트릿에서 html 출력할 때 사용한다.
	--%>
	<%
		out.println("a + b = " + sum(2,3) );
	%>
	</h1>
</body>
</html>


