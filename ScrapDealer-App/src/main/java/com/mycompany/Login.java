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
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try {
			String mail = request.getParameter("mail");
			String pass = request.getParameter("pass");

			 Connection cn=MyConnection.makeConnection();
			Statement smt = cn.createStatement();
			ResultSet rs = smt.executeQuery("select *from user where gmail='" + mail + "' and password='" + pass + "'");

			if (rs.next()) {
				int id = rs.getInt("id");
				String name = rs.getString("name");

				HttpSession hs = request.getSession(true);
				hs.setAttribute("gmail", mail);
				hs.setAttribute("password", pass);
				hs.setAttribute("id", id);
				hs.setAttribute("name", name);

				if (mail.equalsIgnoreCase(mail) && pass.equals(pass)) {
					response.sendRedirect("home.jsp");
//					RequestDispatcher rd = request.getRequestDispatcher("home.jsp");
//					rd.forward(request, response);
				} else {
					out.println(
							"<h5 class='shortmsg' style='color:red; text-align:center; position: absolute;top:90px;padding-left: 44%;'>please login first</h5>");
				}

			} else {
				out.println(
						"<h5 class='shortmsg' style='color:red; text-align:center; position: absolute;top:90px;padding-left: 44%;'>Wrong Email Or Password</h5>");
				RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
				rd.include(request, response);
			}

		} catch (Exception e) {
			out.println(
					"<h5 class='shortmsg' style='red:white; text-align:center; position: absolute;top:90px;padding-left: 44%; ' Exception>"
							+ e.getMessage() + "</h5>");
			RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
			rd.include(request, response);
		}
	}

}
