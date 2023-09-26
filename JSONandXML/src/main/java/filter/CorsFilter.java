package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletResponse;

@WebFilter("/*")
public class CorsFilter implements Filter {
	
	public void init(FilterConfig filterConfig) {
	    	
    }

    public void destroy() {
    	
    }
	
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        // CORS 관련 헤더 설정
        /*
         * 아래 에러 발생 시 응답헤더 설정
          	 has been blocked by CORS policy
          	 : Response to preflight request doesn't pass access control check
          	 : No 'Access-Control-Allow-Origin' header is present on the requested resource.
         */
        httpResponse.setHeader("Access-Control-Allow-Origin", "*"); 				// 모든 Origin 허용 (보안 주의)
        httpResponse.setHeader("Access-Control-Allow-Methods", "POST, GET, PUT, DELETE, OPTIONS");
        httpResponse.setHeader("Access-Control-Max-Age", "3600");
        httpResponse.setHeader("Access-Control-Allow-Headers", "Content-Type, Authorization, Accept");

        chain.doFilter(request, response);
    }
   
}










