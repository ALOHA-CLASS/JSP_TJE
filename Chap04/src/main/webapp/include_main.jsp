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
	<%-- 액션태그 include --%>
	<jsp:include page="include_header.jsp" flush="false">
		<jsp:param value="home" name="menu1"/>
		<jsp:param value="board" name="menu2"/>
		<jsp:param value="gallery" name="menu3"/>
	</jsp:include>
	<div class="container">
		<h1>컨텐츠 영역</h1>
		<h3><%=new Date()%></h3>
	</div>
	<jsp:include page="include_footer.jsp" flush="false">
		<jsp:param value="copyright" name="copy"/>
	</jsp:include>
</body>
</html>



