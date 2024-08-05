package com.mycompany;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Logout
 */
public class Logout extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Logout() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		try {

			out.println(
					"<h5 class='shortmsg' style='color:red; text-align:center; position: absolute;top:90px;padding-left: 44%;'>successfully logged out</h5>");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);

			HttpSession hs = request.getSession(true);
			hs.invalidate();
		} catch (Exception e) {
			out.println(e.toString());
		}
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

			out.println(
					"<h2 class='shortmsg' style='color:red; text-align:center; position: absolute;top:90px;padding-left: 44%;'>successfully logged out</h2>");
			RequestDispatcher rd = request.getRequestDispatcher("index.jsp");
			rd.include(request, response);

			HttpSession hs = request.getSession(true);
			hs.invalidate();

		} catch (Exception e) {
			out.println(e.toString());
		}
	}

}
