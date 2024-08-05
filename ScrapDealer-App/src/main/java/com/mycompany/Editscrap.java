package com.mycompany;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author asus
 */
public class Editscrap extends HttpServlet {

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
        String id="null";
        String Scrap_Name="null";
        String Rate="null";
        
           try{
               id=request.getParameter("id");
               
             Connection cn=MyConnection.makeConnection();
             
          Statement smt=cn.createStatement();
          ResultSet rs=smt.executeQuery("select *from scrap_items where id="+id);
          if(rs.next()){
             
             Scrap_Name=rs.getString("name");
             Rate=rs.getString("rate");
            }
              cn.close();
               
        }catch(Exception e){
            out.println(e.toString());
        }
           out.println("<center>");
           out.println("<h3>Update Scrap Rate And Items</h3>");
           out.println("<form action='Update_Scrap'>");
           out.println("<pre>");
           out.println("<input type='number' name='id' value='"+id+"' readonly>");
           out.println("<input type='text' name='name' value='"+Scrap_Name+"'>");  
           out.println("<input type='text' name='rate' value='"+Rate+"'>");
           out.println("<input type='submit' value='Update_Scrap'>");
           out.println("</pre>");
        
           out.println("</form>");
           
           out.println("</center>");
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