package neco.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Avg extends HttpServlet{
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
		pw.println("<html><head><title>성적 프로그램</title>");
		pw.println("<script>");
		pw.println("function level(){");
		pw.println("var kor=parseInt(document.fm.kor.value);");
		pw.println("var eng=parseInt(document.fm.eng.value);");
		pw.println("var math=parseInt(document.fm.math.value);");
		pw.println("var sum=kor+eng+math;");
		pw.println("var avg=(kor+eng+math)/3;");
		pw.println("if(kor<40|eng<40|math<40|avg<60){");
		pw.println("var grade='불합격입니다.';"); 
		pw.println("}else{");
		pw.println("var grade='합격입니다.';");
		pw.println("}");
		pw.println("window.alert('총점: '+sum+'\\n평균: '+avg+'\\n합격여부: '+grade);");
		pw.println("}");
		pw.println("</script>");
		pw.println("</head></html>");
		pw.println("<form name='fm'>");
		pw.println("<table border='1'>");
		pw.println("<tr>");
		pw.println("<th>국어</th>");
		pw.println("<td><input type='text' name='kor' size='20'></td>");
		pw.println("</tr>");
		
		pw.println("<tr>");
		pw.println("<th>영어</th>");
		pw.println("<td><input type='text' name='eng' size='20'></td>");
		pw.println("</tr>");
		
		
		pw.println("<tr>");
		pw.println("<th>수학</th>");
		pw.println("<td><input type='text' name='math' size='20'></td>");
		pw.println("</tr>");
		
		pw.println("<td colspan='2' align='center'><input type='submit' name='결과' value='결과보기' onclick='level()'></td>");
		pw.println("</form>");
		pw.println("</table>");
		pw.println("</body>");
		pw.close();
	}
}
	