package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class ConfirmMail extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); 
        {
            
        try
        {
         String mail=request.getParameter("confirmmail");
         
         Connection cn=MyConnection.makeConnection();
         
         Statement smt=cn.createStatement();
         ResultSet rs=smt.executeQuery("select * from user where gmail='"+mail+"'");
         String Uname=null,add=null,pin=null,number=null;
         while(rs.next()){
         Uname=rs.getString("name");
         add=rs.getString("address");
         pin=rs.getString("pincode");
         number=rs.getString("number");
         }
       String email=request.getParameter("confirmmail");
       String from="shiksyasamachar@gmail.com";
       String pwd="yfho xzuy fysz gkij";
       String to=email;
       String sub="Confirmation Mail By Scrap Dealer";
       String msg="Hello "+Uname+" !\nThis Mail Is From Scrap Dealer, we will forward your request after confirm your address. \n\nYour Address="+add+", "+pin+"\nMobile="+number+"\n\nClick Here To Confirm\n http://localhost:8080/Hibernate_web_1/User_Confirmation?maill="+email;
       
      Mailer.send(from, pwd, to, sub, msg);
       
    
       out.println("<center><br>");
       out.println("<h3 style='color:green'>Mail Send Sucessfully</h3>");
       out.println("</center>");
       RequestDispatcher rd=request.getRequestDispatcher("Show_Request");
       rd.include(request, response);
        }
        catch(Exception e)
        {
        	out.println("hello error");
            out.println(e.getMessage());
        }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}