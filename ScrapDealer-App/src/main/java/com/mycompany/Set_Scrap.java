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
public class Set_Scrap extends HttpServlet {
int i=1;
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
       out.println("<h2>Scrap Items And Rates</h2>");
       out.println("<form method='post'>");
       out.println("<table border='2'>");
       out.println("<tr><th>NO.</th><th>Scrap_Name</th><th>Rate</th><th>Update Rate</th><th>Delete Item</th></tr>");
     
       try{
           Connection cn=MyConnection.makeConnection();
           
       PreparedStatement smt=cn.prepareStatement("select *from scrap_items");
       
       ResultSet rs=smt.executeQuery();
       
      
    while(rs.next())
{
String Id=rs.getString(1);
String Scrap_Name=rs.getString(2);  
String Rate=rs.getString(3);
out.println("<tr><td>"+(i++)+"</td><td><center>"+Scrap_Name+"</td><td><center>"+Rate+"</td><td><center><a href='Editscrap?id="+Id+"'>Edit</a></center></td><td><center><a href='Delete?iid="+Id+"'>Delete</a></center></td></tr>");


}  
    i=1;
    out.println("</table>");
    out.println("</form>");
        cn.close();
       
        }catch(Exception e){
            out.println(e.getMessage());
        }
       
       out.println("<center>");
       out.println("<br>");
       out.println("<button><a href='add_scrap.jsp' style='text-decoration: none;'>Add Scrap</a></button>");
       out.println("<br>");
       out.println("<br>");
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
