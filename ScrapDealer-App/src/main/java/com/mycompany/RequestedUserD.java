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
import javax.servlet.http.HttpSession;

public class RequestedUserD extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();{
         
       
        try {
         String mail=request.getParameter("ml");
         Connection cn=MyConnection.makeConnection();
         
         Statement smt=cn.createStatement();
         ResultSet rs=smt.executeQuery("select * from user where gmail='"+mail+"'");
         RequestDispatcher rd=request.getRequestDispatcher("admin_logout.jsp");
           rd.include(request, response);
         
         out.println("<center>");
         out.println("<table border='3'>");
         
         out.println("<tr><th>Id</th><th>Name</th><th>G_mail</th><th>Number</th><th>Address</th><th>Pin</th><th>Send Mail</th></tr>");
         
         while(rs.next()){
         
         out.println("<tr><td>"+rs.getString("id")+"</td><td>"+rs.getString("name")+"</td><td>"+rs.getString("gmail")+"</td><td>"+rs.getString("number")+"</td><td>"+rs.getString("address")+"</td><td>"+rs.getString("pincode")+"</td><td><center><a href='ConfirmMail?confirmmail="+rs.getString("gmail")+"'>Send Mail</a></center></td>");
         
         }
         out.println("</table>");
         out.println("<br>");
         out.println("<button><a href='Show_Request'>Back To Request Page</a></button>");
         out.println("</center>");
        }
        catch(Exception e)
        {
          out.println("<h3 style='color:red;text-align:center; '>Error...!!!!</h3>");
          
          RequestDispatcher rd=request.getRequestDispatcher("Show_Request");
          rd.include(request, response);
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
