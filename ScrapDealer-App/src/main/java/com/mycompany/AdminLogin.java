package com.mycompany;


import java.io.IOException;
import java.io.PrintWriter;
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
public class AdminLogin extends HttpServlet {

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
            try{
            
        
        String a_mail=request.getParameter("a_mail");
        String a_pwd=request.getParameter("a_pwd");
        
        HttpSession hs=request.getSession(true);
                     hs.setAttribute("mail", a_mail);
                     hs.setAttribute("password", a_pwd);
        
        if(a_mail.equalsIgnoreCase("Admin@gmail.com") && a_pwd.equals("Admin@123")){
        RequestDispatcher rd=request.getRequestDispatcher("admin_logout.jsp");
        rd.include(request, response);
            
        rd=request.getRequestDispatcher("adminPannel.jsp");
        rd.include(request, response);
    }else{
            out.println("<h3 style='color:red;text-align:center;'> Wrong Admin Email Or Password</h3>");
            RequestDispatcher rd=request.getRequestDispatcher("admin_login.jsp");
            rd.include(request, response);
        }
    }catch(Exception e){
    out.println(e.getMessage());
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
