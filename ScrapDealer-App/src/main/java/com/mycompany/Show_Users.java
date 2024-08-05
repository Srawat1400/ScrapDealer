package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
public class Show_Users extends HttpServlet {

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
        
        RequestDispatcher rd=request.getRequestDispatcher("admin_logout.jsp");
        rd.include(request, response);
            out.println("<center>");
       out.println("<h2>Registered User Details</h2>");
       out.println("<form method='post'>");
       out.println("<table border='2'>");
       out.println("<tr><th>Id</th><th>Name</th><th>Gmail</th><th>Number</th><th>Address</th><th>Pincode</th></tr>");
     
       try{
        Connection cn=MyConnection.makeConnection();
       
       PreparedStatement smt=cn.prepareStatement("select *from user");
       
       ResultSet rs=smt.executeQuery();
       

    while(rs.next())
{
String id=rs.getString(1);
String name=rs.getString(2);  
String gmail=rs.getString(3);
String number=rs.getString(4);
String address=rs.getString(5);
String pincode=rs.getString(6);
String password=rs.getString(7);

out.println("<tr><td>"+id+"</td><td><center>"+name+"</td><td><center>"+gmail+"</td><td><center>"+number+"</td><td><center>"+address+"</td><td><center>"+pincode+"</td></tr>");


}  
    out.println("</table>");
    out.println("</form>");
        cn.close();
       
        }catch(Exception e){
            out.println(e.getMessage());
        }
       
       out.println("<center>");
       out.println("<button><a href='adminPannel.jsp' style='text-decoration: none;'>Back To Home</a></button>");
       out.println("</center>");
       out.println("<br>");
       
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

