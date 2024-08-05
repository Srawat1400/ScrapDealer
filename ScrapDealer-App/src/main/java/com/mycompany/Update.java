package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Update
 */
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Update() {
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
            String id=request.getParameter("upd_id");
            String name=request.getParameter("upd_name");
            String mail=request.getParameter("upd_gmail");
            String number=request.getParameter("upd_number");
            String address=request.getParameter("upd_address");
            String pin=request.getParameter("upd_pincode");
            
           
      
      
         Connection cn=MyConnection.makeConnection();
         
          Statement smt=cn.createStatement();
         int i=smt.executeUpdate("update user set name='"+name+"', gmail='"+mail+"', number='"+number+"', address='"+address+"', pincode='"+pin+"' where id="+id);
          if(i>0){
              RequestDispatcher rd=request.getRequestDispatcher("Profile.jsp");
           rd.forward(request, response);
          }
          
          cn.close();
        }catch(Exception e){
            out.println(e.toString());
        }
	}

}
