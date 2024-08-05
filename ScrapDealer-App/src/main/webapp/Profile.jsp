<%@page import="com.mycompany.MyConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Profile</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body>


<%
HttpSession hs = request.getSession(false);
String mail=(String)hs.getAttribute("gmail");
if(mail==null)
{
	out.println("<h6 style='color:red; text-align:center; position: absolute;top:90px;padding-left: 44%;'>Please Login First</h6>");
	RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
	rd.include(request, response); 
	
}else{
%>




	<div class="pbd">
		<header class="header">
			<nav class="navbar">
				<h2 class="logo">
					<a href="home.jsp">Scrap Dealer</a>
				</h2>
				<input type="checkbox" id="menu-toggle" /> <label for="menu-toggle"
					id="hamburger-btn"> <svg xmlns="http://www.w3.org/2000/svg"
						height="24" viewBox="0 0 24 24" width="24">
            <path d="M3 12h18M3 6h18M3 18h18" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" />
          </svg>
				</label>
				<ul class="links">
					<li><a href="home.jsp">Home</a></li>
					<li><a href="home.jsp">About Us</a></li>
					<li><a href="sell_scrap.jsp">Sell Scrap</a></li>
					<li><a href="home.jsp">Scrap Rates</a></li>
					<li><a href="calculator.jsp">Calculator</a></li>
					<li><a href="home.jsp">Contact Us</a></li>
				</ul>
				<div class="buttons">
					<a href="Profile.jsp" class="signup">Profile</a> <a href="Logout"
						class="signup">Logout</a>
				</div>
			</nav>
		</header>
	</div>
	<br>
	<!--------- Header End -------------->
	<%
	String id = null, name = null, gmail = null, number = null, address = null, pincode = null;
	response.setContentType("text/html;charset=UTF-8");
	try {
		
		 Connection cn=MyConnection.makeConnection();
		
		Statement smt = cn.createStatement();
		ResultSet rs = smt.executeQuery("select * from user where gmail='" + mail + "'");

		while (rs.next()) {
			id = rs.getString("id");
			name = rs.getString("name");
			gmail = rs.getString("gmail");
			number = rs.getString("number");
			address = rs.getString("address");
			pincode = rs.getString("pincode");

		}
	} catch (Exception e) {
		out.println(e.toString());
		/* out.println("<h3 style='color:red;text-align:center; '>Please Login First</h3>");
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		rd.include(request, response); */
	}
	%>

	<div class="slide-container swiper">
		<div class="slide-content">
			<div class="card-wrapper swiper-wrapper">
				<div class="card swiper-slide">
					<div class="image-content">
						<span class="overlay"></span>

						<div class="pimg">
							<img src="all_component/img/profile.png" alt="" class="cardimg">
						</div>
					</div>

					<div class="card-content">
						<br>
						<h2 class="name"><%=name%></h2>
						<br>
						<form action="Edit.jsp" method="post" class="pro_form">
						<div class="form-group">
								<input type="hidden" class="form-control" name="eid"
									value="<%=id%>" readonly>
							</div>
							<div class="form-group">
								<input type="hidden" class="form-control" name="ename"
									value="<%=name%>" readonly>
							</div>
							<div class="form-group">
								<label>Mail Id :</label> <input type="text" class="form-control"
									name="egmail" value="<%=gmail%>" readonly>
							</div>
							<div class="form-group">
								<label>Mobile No :</label> <input type="text"
									class="form-control" name="enumber" value="<%=number%>"
									readonly>
							</div>
							<div class="form-group">
								<label>Address :</label> <input type="text" class="form-control"
									name="eaddress" value="<%=address%>" readonly>
							</div>
							<div class="form-group">
								<label>Pincode :</label> <input type="text" class="form-control"
									name="epincode" value="<%=pincode%>" readonly>
							</div>
							<button type="submit" class="btn btn-primary">Edit</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div class="swiper-button-next swiper-navBtn"></div>
		<div class="swiper-button-prev swiper-navBtn"></div>
		<div class="swiper-pagination"></div>
	</div>
	<div style="height: 15px;"></div>
	<%@include file="all_component/footer.jsp"%>
	<% }%>
</body>
</html>