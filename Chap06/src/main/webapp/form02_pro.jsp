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
	<h1>요청파라미터 확인</h1>
	<table border="1">
		<tr>
			<th>요청 파라미터명</th>
			<th>값</th>
		</tr>
		<%
			request.setCharacterEncoding("UTF-8");
		
			Enumeration params = request.getParameterNames();
			while( params.hasMoreElements() ) {
				String name = (String) params.nextElement();
				out.print("<tr><td>" + name + "</td>");
				String[] values = request.getParameterValues(name);
				out.print("<td>");
				for( int i = 0 ; i < values.length ; i++ ) {
					out.print(values[i] + " ");
				}
				out.print("</td></tr>");
			}
		%>
	</table>
</body>
</html>









