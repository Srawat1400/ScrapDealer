<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mycompany.MyConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit</title>
<%@include file="all_component/allCss.jsp"%>

</head>
<body>
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
	String id = "";
	String name = "";
	String gmail = "";
	String number = "";
	String address = "";
	String pincode = "";
	try {
		id = request.getParameter("eid");
		name = request.getParameter("ename");
		gmail = request.getParameter("egmail");
		number = request.getParameter("enumber");
		address = request.getParameter("eaddress");
		pincode = request.getParameter("epincode");

		Connection cn = MyConnection.makeConnection();

		Statement smt = cn.createStatement();
	} catch (Exception e) {
		out.println(e.getMessage());
	}
	%>
	<div class="slide-container swiper">
		<div class="slide-content">
			<div class="card-wrapper swiper-wrapper">
				<div class="card swiper-slide">
					<div class="image-content">
					<br>
					<h4>Edit Your Profile</h4>
					<br>
					</div>

					<div class="card-content">
						<form action="Update" method="post" class="pro_form">
						<div class="form-group">
								<input type="hidden" class="form-control" name="upd_id"
									value="<%=id%>" readonly>
							</div>
							<div class="form-group">
								<label>Name :</label><input type="text" class="form-control" name="upd_name"
									value="<%=name%>">
							</div>
							<div class="form-group">
								<label>Mail Id :</label> <input type="text" class="form-control"
									name="upd_gmail" value="<%=gmail%>">
							</div>
							<div class="form-group">
								<label>Mobile No :</label> <input type="text"
									class="form-control" name="upd_number" value="<%=number%>"
									>
							</div>
							<div class="form-group">
								<label>Address :</label> <input type="text" class="form-control"
									name="upd_address" value="<%=address%>">
							</div>
							<div class="form-group">
								<label>Pincode :</label> <input type="text" class="form-control"
									name="upd_pincode" value="<%=pincode%>">
							</div>
							<button type="submit" class="btn btn-primary">Update</button>
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
</body>
</html>