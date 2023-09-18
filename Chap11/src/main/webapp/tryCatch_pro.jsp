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
		int c = 0;
		try {
			String num1 = request.getParameter("num1");
			String num2 = request.getParameter("num2");
			int a = Integer.parseInt(num1);
			int b = Integer.parseInt(num2);
			c = a / b;
		} catch (NumberFormatException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error/exception-A.jsp");
			dispatcher.forward(request, response);
		} catch (ArithmeticException e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error/exception-B.jsp");
			dispatcher.forward(request, response);
		} catch (Exception e) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/error/exception.jsp");
			dispatcher.forward(request, response);
		}
	
	%>
	<h1>a / b = <%= c %></h1> 
	
	
</body>
</html>








