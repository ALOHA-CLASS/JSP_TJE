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
	<p> <h4>----- 세션을 삭제하기 전 -----</h4>
	<%
		String user_id = (String) session.getAttribute("userID");
		String user_pw = (String) session.getAttribute("userPW");
		
		out.println("설정된 세션 이름 userID : " + user_id + "<br>");
		out.println("설정된 세션 값 userPW : " + user_pw + "<br>");
		
		// isRequestedSessionIdValid
		// : 해당 요청이 속한 session 이 유효한지 여부를 반환하는 메소드
		if (request.isRequestedSessionIdValid() == true) {
			out.print("세션이 유효합니다.");
		}else {

			out.print("세션이 유효하지 않습니다.");
		}		

		session.invalidate();				// 세션을 무효화 - 세션의 모든 속성들이 제거
	%>
	<p> <h4>----- 세션을 삭제한 후 -----</h4>
	<%		
		if (request.isRequestedSessionIdValid() == true) {
			out.print("세션이 유효합니다.");
		}else {

			out.print("세션이 유효하지 않습니다.");
		}
	%>
</body>
</html>






