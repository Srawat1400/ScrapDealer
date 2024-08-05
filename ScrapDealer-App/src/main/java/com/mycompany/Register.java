package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
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
        
        try{
            String name=request.getParameter("name");
            String mail=request.getParameter("mail");
            String number=request.getParameter("number");
            String address=request.getParameter("address");
            String pin=request.getParameter("pin");
            String pass=request.getParameter("pass");
            
            Connection cn=MyConnection.makeConnection();
           Statement smt=cn.createStatement();
           
              int i=smt.executeUpdate("insert into user(name,gmail,number,address,pincode,password) values('"+name+"','"+mail+"','"+number+"','"+address+"','"+pin+"','"+pass+"')");
              
              if(i>0){
                  out.println("<h5 class='shortmsg' style='color:white; text-align:center; position: absolute;top:90px;padding-left: 44%;'>user registered successfully</h5>");
                  out.println("<h5 class='shortmsg' style='color:white; text-align:center; position: absolute;top:90px;padding-left: 44%;'>you can login now</h5>");
                  RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
                  rd.include(request, response);
                  
              }
              else{
                  out.println("<h5 class='shortmsg' style='color:red; text-align:center; position: absolute;top:90px;padding-left: 44%;'>User Not Registered Due To Some Error</h5>");
                  RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");
                  rd.include(request, response);
              }
          }catch(Exception e){
             out.println("<h5 class='shortmsg' style='color:red; text-align:center; position: absolute;top:90px;padding-left: 44%;' Exception>"+e.toString()+"</h5>");
                  RequestDispatcher rd=request.getRequestDispatcher("registration.jsp");
                  rd.include(request, response);
          }
	}

}
