package json;

import java.io.IOException;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import dto.User;

/**
 * Servlet implementation class JSONServlet
 */
@WebServlet("/json")
public class JSONServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// JSON 문자열 받기
		String jsonString = request.getReader().lines().collect(Collectors.joining());
		System.out.println("jsonString : " + jsonString);
		
		// JSON -> Object
	    ObjectMapper objectMapper = new ObjectMapper();
	    User user = objectMapper.readValue(jsonString, User.class);
	    System.out.println("JSON -> Object");
	    System.out.println("user : ");
	    System.out.println(user);
	    System.out.println();
	    
	    // Object -> JSON
	    jsonString = objectMapper.writeValueAsString(user);
	    System.out.println("Object -> JSON");
	    System.out.println(jsonString);
	    System.out.println();
		
		response.getWriter().append(jsonString);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}




