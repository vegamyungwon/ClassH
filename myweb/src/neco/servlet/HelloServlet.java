package neco.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

public class HelloServlet extends HttpServlet{	//HttpServlet을 상속받아야 servlet이 된다.

	@Override
	protected void doGet(HttpServletRequest req,	//요청개체
			HttpServletResponse resp)				//응답개체 
					throws ServletException, IOException {
		userProcess(req, resp);		//userProcess로 doGet, doPost둘다 실행시 넘겨줄수 있다.
	}
	
	@Override
	protected void doPost(HttpServletRequest req,	//요청개체 
			HttpServletResponse resp) 				//응답개체
					throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req,	//요청개체 
			HttpServletResponse resp) 				//응답개체
					throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw=resp.getWriter();		//system.out과 비슷함
		
		pw.println("<html><head><title>");
		pw.println("servlet!!");
		pw.println("</title><head><body>");
		pw.println("<h2>내가 만든 서블릿!!</h2>");
		
		pw.println("");
		Calendar now=Calendar.getInstance();
		int year=now.get(Calendar.YEAR);
		int month=now.get(Calendar.MONTH)+1;
		int day=now.get(Calendar.DATE);
		pw.println("<h2>"+year+"년"+month+"월"+day+"일</h2>");;
		
		pw.println("<table border='1'>");
		for(int i=2;i<=9;i++){
			pw.println("<tr>");
				for(int j=1;j<=9;j++){
					pw.println("<td>"+i+"x"+j+"="+i*j+"</td>");
				}
			pw.println("</tr>");
		}
		pw.println("</table>");
		
		pw.println("</body></html>");
		
		pw.close();
	}
}
//생성자		값에 대한 초기화를 위한 메소드
//init() 	기능에 대한 초기화를 위한 메소드


/*
	class
	생성자
	init();
			service();
				|
	ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	doGet();		doPost();



*/