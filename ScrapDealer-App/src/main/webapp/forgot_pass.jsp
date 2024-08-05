
<%@page import="java.sql.Statement"%>
<%@page import="com.mycompany.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<%
	try {
		String forgot_pwd = request.getParameter("forgoted_pwd");
		String forgot_mail = request.getParameter("mailll");
		
		Connection cn=MyConnection.makeConnection();
        
        Statement smt=cn.createStatement();
       int i=smt.executeUpdate("update user set password='"+forgot_pwd+"' where gmail='"+forgot_mail+"'");
        
		if(i>0){
		response.setContentType("text/html");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.include(request, response);
		out.println("<center");
		out.println(
		"<h3 style='color:green;position: absolute;top:120px;padding-left: 30%;'>Password Forgot Succesfully</h3>");
		out.println("</center");
		}else{
			response.setContentType("text/html");
			RequestDispatcher rd = request.getRequestDispatcher("forgot_user_pwd.jsp");
			rd.include(request, response);
			out.println("<center");
			out.println(
			"<h3 style='color:green;position: absolute;top:65px;padding-left: 46%;'>Password Forgot Succesfully</h3>");
			out.println("</center");
		}

	} catch (Exception e) {
		e.printStackTrace();
	}
	%>

</body>
</html>