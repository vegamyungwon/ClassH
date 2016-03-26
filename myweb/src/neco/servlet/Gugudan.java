package neco.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Gugudan extends HttpServlet {
@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		userProcess(req, resp);
	}
	
	protected void userProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.println("<html><head><title>");
		pw.println("구구단!!");
		pw.println("</title><head><body>");
		pw.println("<h2>구구단 프로그램!!</h2>");
				
		pw.println("<table border=\"1\">");
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
