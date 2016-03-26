package neco.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Test0 extends HttpServlet{
	int kor,eng,math,sum,avg;
	String grade="";
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
		
		try{
			String kor_s=req.getParameter("kor");
			String eng_s=req.getParameter("eng");
			String math_s=req.getParameter("math");
			kor=Integer.parseInt(kor_s);
			eng=Integer.parseInt(eng_s);
			math=Integer.parseInt(math_s);
			sum=kor+eng+math;
			avg=(kor+eng+math)/3;
			grade="";
			if(kor<40|eng<40|math<40|avg<60){
				grade="불합격입니다.";
			}else{
				grade="합격입니다.";
			}
		}catch(Exception e){
			System.out.println(e.toString());			
		}
	
		pw.println("<html><head><title>성적 프로그램</title>");
		pw.println("<script>");
		pw.println("function level(){");

	
		pw.println("window.alert('총점: "+sum+"\\n평균: "+avg+"\\n합격여부: "+grade+"');");
		
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


