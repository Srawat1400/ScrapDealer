<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upload Image</title>
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

	<div class="tbl_div1 swiper">
		<div class="tbl_div2">
			<div class="card-wrapper swiper-wrapper">
				<form action="action_file_upload.jsp" method="post" enctype="multipart/form-data">
					<table class="table table-striped img_tbl">
						<thead>
							<tr>
								<th></th>
								<th></th>
								<th></th>
								<th></th>
						
								<th colspan="1">Upload Your Scrap Image</th>
								
							</tr>
						</thead>
						<tbody>
						<tr><td  colspan="5"><center><input type="file" name="file" required></td></tr>
						<tr></tr>
						<tr><td colspan="5"><center><button type="submit" value="Upload File">Upload File</button></td></tr>
						</tbody>
						</table>
				</form>
			</div>
		</div>
		</div>


		<!--------- Fooster -------------->
		<div style="height: 382px !important;"></div>
		<%@include file="all_component/footer.jsp"%>
		<%} %>
</body>
</html>