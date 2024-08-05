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

/**
 *
 * @author asus
 */
public class Show_Request extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
//         HttpSession hs=request.getSession(false);
//         String mail=(String)hs.getAttribute("gmail");
 
         Connection cn=MyConnection.makeConnection();
         
         Statement smt=cn.createStatement();
         ResultSet rs=smt.executeQuery("select * from user_request");

          RequestDispatcher rd=request.getRequestDispatcher("admin_logout.jsp");
        rd.include(request, response);
         
         out.println("<center>");
         out.println("<h2>Users Request</h2>");
         out.println("<table border='3'>");
         
         out.println("<tr><th>Id</th><th>Name</th><th>G_mail</th><th>Plastic</th><th>Metals</th><th>Paper</th><th>Glass</th><th>E_Waste</th><th>Image</th><th>Other Items</th><th>Confirmation</th><th>Show Details</th></tr>");
         
         while(rs.next()){
         out.println("<tr><td><center>"+rs.getString("id")+"</td><td><center>"+rs.getString("name")+"</td><td><center>"+rs.getString("gmail")+"</td><td><center>"+rs.getString("plastic")+"</td><td><center>"+rs.getString("metals")+"</td><td><center>"+rs.getString("paper")+"</td><td><center>"+rs.getString("glass")+"</td><td><center>"+rs.getString("e_waste")+"</td><td><center><img src='scrap_img/"+rs.getString("image")+"' width='50px ' height='40px'></td><td><center>"+rs.getString("other_items")+"</td><td style='font-weight:bold;font-size:25px'><center>"+rs.getString("confirmation")+"</td><td><center><a href='RequestedUserD?ml="+rs.getString("gmail")+"'>Get Details</a></td></tr>");
         
         }
         out.println("</table>");
         out.println("<br>");
         out.println("<button><a href='adminPannel.jsp'>Back To The Home</a></button>");
         out.println("</center>");
        }
        catch(Exception e)
        {
            out.println("hashhsh");
          out.println(e.toString());
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
