package xml;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.io.StringWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;

import dto.User;

/*
  마샬 		: Object -> XML
  언마샬 		: XML -> Object 
 */
@WebServlet("/xml")
public class XMLServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public XMLServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
            // XML 데이터를 읽어올 InputStream 얻기
            InputStream inputStream = request.getInputStream();

            // InputStream을 문자열로 변환
            StringBuilder xmlStringBuilder = new StringBuilder();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
            String line;
            while ((line = bufferedReader.readLine()) != null) {
                xmlStringBuilder.append(line);
            }
            String xmlString = xmlStringBuilder.toString();
            System.out.println("xmlString : " + xmlString);
            System.out.println();

            // XML -> Object
            JAXBContext jaxbContext = JAXBContext.newInstance(User.class); // Person 클래스에 대한 JAXBContext 생성
            Unmarshaller unmarshaller = jaxbContext.createUnmarshaller();
            StringReader reader = new StringReader(xmlString);
            User user= (User) unmarshaller.unmarshal(reader);
 
            // person 객체 활용 또는 응답 생성
            System.out.println("XML -> Object");
            System.out.println("Name: " + user.getName());
            System.out.println("Age: " + user.getAge());
            System.out.println();
            
            
            // Object -> XML
            Marshaller marshaller = jaxbContext.createMarshaller();
            marshaller.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
            StringWriter sw = new StringWriter();
            marshaller.marshal(user, sw);
            System.out.println("Object -> XML");
            System.out.println(sw.toString());
            System.out.println();
            
            response.getWriter().append(xmlString);

        } catch (IOException | JAXBException e) {
            e.printStackTrace();
        }
		 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
