<!DOCTYPE html>
<!-- Coding By CodingNepal - www.codingnepalweb.com -->
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.mycompany.MyConnection"%>
<%@page import="java.sql.Connection"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Scrap Dealer</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body>
	<div class="bd">
		<header class="header">
			<nav class="navbar">
				<h2 class="logo">
					<a href="index.jsp">Scrap Dealer</a>
				</h2>
				<input type="checkbox" id="menu-toggle" /> <label for="menu-toggle"
					id="hamburger-btn"> <svg xmlns="http://www.w3.org/2000/svg"
						height="24" viewBox="0 0 24 24" width="24">
            <path d="M3 12h18M3 6h18M3 18h18" stroke="currentColor"
							stroke-width="2" stroke-linecap="round" />
          </svg>
				</label>
				<ul class="links">
					<li><a href="index.jsp">Home</a></li>
					<li><a href="#about">About Us</a></li>
					<li><a href="#login">Sell Scrap</a></li>
					<li><a href="#ratelist">Scrap Rates</a></li>
					<li><a href="#con_form">Contact Us</a></li>
				</ul>
				<div class="buttons">
					<a href="#login" class="signin">Sign In</a> <a href="registration.jsp" class="signup">Sign
						Up</a>
				</div>
			</nav>
		</header>
		<section class="hero-section">
			<div class="hero">
				<h2>Got scrap? Sell it to us.</h2>
				<p>Sell us your recyclable wastes and help contribute to the
					circular economy.Waste is never a waste, it s rather an opportunity
					to something new</p>
				<div class="buttons">
					<a href="#ratelist" class="join">Rate List</a> <a href="#login"
						class="learn">Sell Now </a>
				</div>
			</div>
			<div class="img">
				<img src="img/Scrap.png" alt="Scrap image" />
			</div>
		</section>
	</div>
	<br>
	<!------------- About Us Page ------------->
	<div class="about" id="about">
		<div class=" about1">
			<div id="about">
				<div>
					<h1 class="aboutH">ABOUT US</h1>
					<div id="line" style="width: auto;"></div>
					<div id="content">
						<br>
						<h2
							style="color: green; font-family: Satoshi, system-ui, -apple-system;">Waste
							is never a waste, its rather an opportunity to something new</h2>
						<p>ScrapDealer collect various types of waste, including
							paper, plastic, glass, metal, and electronic waste, from
							households, businesses, and industries. By providing a convenient
							and accessible way to dispose of waste, ScrapDealer contribute to
							maintaining cleanliness in communities.</p>

						<h3>Why Us</h3>
						<p>We believe that India can be a greener and cleaner country,
							as every household commits to getting their dry scrap recycled,
							not only resources can be saved from over-exploitation, but the
							landfills with mixed harmful garbage can be eradicated.</p>

						<p>Through continuous innovation of technology, our goal is to
							make recycling achievable and accessible to all, from
							institutions to individuals.</p>

						<p>After collecting the scrap materials, kabadiwalas sort and
							segregate them based on their types. These recyclable materials
							are then sold to recycling industries, where they undergo
							processing to be reused in the manufacturing of new products.</p>

						<h3>MISSION & VISION</h3>
						<p>Our mission is to make a world where nothing is wasted, the
							communities from around the globe building an eco-system of
							sustainable living through doing the right waste treatment that
							is to get it recycled.</p>
						<p>Our vision is to bring a circular economy into a reality
							where used products are manufactured into new products to
							minimize the over-exploitation of natural resources and maximize
							recycling.</p>

					</div>
				</div>
			</div>
		</div>
	</div>
	<!------- End Of About Us Page ---------->
	<center>
		<hr style="width: 60%;">
	</center>
	<br>
	<!------- Scrap Rates Page ---------->

	<%
	String name = null, rate = null;
	try {
		Connection cn = MyConnection.makeConnection();
		Statement smt = cn.createStatement();
		ResultSet rs = smt.executeQuery("select * from scrap_items");
	%>
	<div class="about" id="ratelist">
		<div class=" about1">
			<div id="about">
				<h1 class="aboutH">Rate List</h1>
				<div id="line" style="width: auto;"></div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="rate_section">
		<div class="row">
			<%
			while (rs.next()) {
			%>
			<div class="col-lg-3 col-6 mb-4 pb-4 px-4 cards">
				<div class="container-bg-2 h-100 rounded-4 mt-6 d-flex flex-column card">
					<div class="title-lg pt-6 flex-fill px-lg-6 px-3"><%=rs.getString("name")%></div>
					<!--!-->
					<div class="px-3 px-lg-6 pb-6">
						<span class="pe-2 title-lg" style="color: #44B31F;"> <!--!-->&#8377;<%=rs.getString("rate")%>
						</span><span class="fg-default-2 title-sm">/Kg</span>
					</div>
				</div>
			</div>
			<%
			}
			%>
		</div>
	</div>
	<%
	} catch (Exception e) {
	out.println(e.toString());
	}
	%>
	<!------- End Scrap Rates Page ---------->

	<center>
		<hr style="width: 60%;">
	</center>
	<br>

	<!--------- Contact Us Form ---------->
	<div class="contact_bd" id="con_form">
		<div class="wrapper">
			<header>Send us a Message</header>
			<form action="#">
				<div class="dbl-field">
					<div class="field">
						<input type="text" name="name" placeholder="Enter your name">
						<i class='fas fa-user'></i>
					</div>
					<div class="field">
						<input type="text" name="email" placeholder="Enter your email">
						<i class='fas fa-envelope'></i>
					</div>
				</div>
				<div class="dbl-field">
					<div class="field">
						<input type="text" name="phone" placeholder="Enter your phone">
						<i class='fas fa-phone-alt'></i>
					</div>
					<div class="field">
						<input type="text" name="website" placeholder="Enter your website">
						<i class='fas fa-globe'></i>
					</div>
				</div>
				<div class="message">
					<textarea placeholder="Write your message" name="message"></textarea>
					<i class="material-icons"></i>
				</div>
				<div class="button-area">
					<button type="submit">Send Message</button>
					<span></span>
				</div>
			</form>
		</div>
	</div>
	<!--------  Login Register Page --------->

	<div class="lognbd" id="login">
		<div class="container flex">
			<div class="facebook-page flex">
				<div class="text">
					<h1>ScrapDealer</h1>
					<p>We believe that India can be a greener</p>
					<p>and cleaner country.</p>
				</div>
				<form action="Login" method="post" class="frm">
					<input type="email" name="mail" placeholder="Email or phone number" required>
					<input type="password" name="pass" placeholder="Password" required>
					<div class="link">
						<button type="submit" class="login">Login</button>
						<a href="forgate_pwd.jsp" class="forgot">Forgot password?</a>
					</div>
					<hr>
					<div class="button">
						<a href="registration.jsp">Create new account</a>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>