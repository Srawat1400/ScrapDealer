package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Forgatepwd
 */
public class Forgatepwd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forgatepwd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
	       PrintWriter out = response.getWriter();
	       
	        try
	        {
	        	
				
	       String email=request.getParameter("mail");
	       String from="surajkreviews@gmail.com";
	       String pwd="jdtt hkvr yxmn vkrd";
	       String to=email;
	       String sub="Password Forgot Link By Scrap Dealer";
	       String msg="Hello!\nThis Mail Is From Scrap Dealer, you can now forgot your password through this link. \n\n http://localhost:8080/Hibernate_web_1/forgot_user_pwd.jsp?maill="+email;
	       
	      Mailer.send(from, pwd, to, sub, msg);
	          
	       out.println("<center><br>");
	       out.println("<h6 style='color:green; text-align:center; position: absolute;top:130px;padding-left: 30%;'>Mail Send Sucessfully : Check Your Gmail</h6>");
	       out.println("</center>");
	       RequestDispatcher rd=request.getRequestDispatcher("forgate_pwd.jsp");
	       rd.include(request, response);
	        }
	        catch(Exception e)
	        {
	            e.printStackTrace();
	        }

	}

}
