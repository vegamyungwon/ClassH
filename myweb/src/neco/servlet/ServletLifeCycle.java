package neco.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLifeCycle extends HttpServlet{
	public ServletLifeCycle(){
		//멤버변수의 쵝화
		System.out.println("1. 생성자 호출됨!");
	}
	
	@Override
	public void init() throws ServletException {
		//기능의 초기화
		System.out.println("2. init()호출됨!");
	}
	
	
	@Override
	protected void service(HttpServletRequest arg0, HttpServletResponse arg1) throws ServletException, IOException {
		System.out.println("3. service()매소드 호출됨!");
	}
	
	@Override
	public void destroy() {
		System.out.println("4. destroy() 호출됨!!!");
	
	}
}
