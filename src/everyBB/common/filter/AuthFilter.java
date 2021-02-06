package everyBB.common.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import everyBB.common.code.ErrorCode;
import everyBB.common.exception.ToAlertException;

/**
 * Servlet Filter implementation class AuthFilter
 */
public class AuthFilter implements Filter {

    /**
     * Default constructor. 
     */
    public AuthFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		//비로그인 사용자 권한 관리
		//Session의 user 프로퍼티 유무 여부로 판단
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpSession session = httpRequest.getSession();
		
		String[] uriArr = httpRequest.getRequestURI().split("/");
		if (uriArr.length > 0) { //사용자 요청이 있다면
			//비로그인 사용자 권한 관리
			switch (uriArr[1]) {
				case "member": 
					switch (uriArr[2]) {
						//case "mypage":
							//if(session.getAttribute("user") == null) {
								//throw new ToAlertException(ErrorCode.AUTH01);
							//}
							//break;
						case "joinimpl" : 
							if(session.getAttribute("persistUser") == null) {
								throw new ToAlertException(ErrorCode.AUTH02);
							}
							break;
					}
				
				case "board": 
					switch (uriArr[2]) {
						case "form":
							if(session.getAttribute("user") == null) {
								throw new ToAlertException(ErrorCode.AUTH01);
							}
							break;
						case "upload" : 
							if(session.getAttribute("user") == null) {
								throw new ToAlertException(ErrorCode.AUTH01);
							}
							break;
					}
			}
		}
		
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
