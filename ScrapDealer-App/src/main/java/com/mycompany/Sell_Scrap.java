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
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Sell_Scrap
 */
public class Sell_Scrap extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Sell_Scrap() {
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
        
            String plastic=null;
            String metals=null;
            String paper=null;
            String glass=null;
            String e_waste=null;
//          String image=null;
            String other_items=null;
            boolean conf;
        String name=null,gmail=null;
        try{
             HttpSession hs=request.getSession(false);
//             iid=(String)hs.getAttribute("id");
             name=(String)hs.getAttribute("name");
             gmail=(String)hs.getAttribute("gmail");
            
             
             plastic=request.getParameter("plastic");
             metals=request.getParameter("metals");
             paper=request.getParameter("paper");
             glass=request.getParameter("glass");
             e_waste=request.getParameter("e_waste");
//           image=request.getParameter("image");
             other_items=request.getParameter("other_items");
             conf=false;
             
            Connection cn=MyConnection.makeConnection();
            
            Statement smt=cn.createStatement();
           
            int i=smt.executeUpdate("insert into user_request(name,gmail,plastic,metals,paper,glass,e_waste,other_items,confirmation) values('"+name+"','"+gmail+"','"+plastic+"','"+metals+"','"+paper+"','"+glass+"','"+e_waste+"','"+other_items+"','"+conf+"')");
              
            if(i>0){
                out.println("<h5 style='color:green; text-align:center; position: absolute;top:100px;padding-left: 42%;'>Upload Image</h5>");
                
                RequestDispatcher rd=request.getRequestDispatcher("img_upload.jsp");
                rd.include(request, response);
                
            }
            else{
                out.println("<h5 style='color:red; text-align:center; position: absolute;top:90px;padding-left: 42%;'>Request Not Send Due To Some Error</h5>");
                RequestDispatcher rd=request.getRequestDispatcher("sell_scrap.jsp");
                rd.include(request, response);
            }
           }catch(Exception e){
           out.println("<h5 style='color:red; text-align:center; position: absolute;top:90px;padding-left: 42%;' Exception>"+e.getMessage()+"</h5>");
                RequestDispatcher rd=request.getRequestDispatcher("sell_scrap.jsp");
                rd.include(request, response);
        }
	}

}
