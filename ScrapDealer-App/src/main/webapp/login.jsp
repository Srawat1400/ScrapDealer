<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
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
					<li><a href="index.jsp">About Us</a></li>
					<li><a href="index.jsp">Sell Scrap</a></li>
					<li><a href="index.jsp">Scrap Rates</a></li>
					<li><a href="index.jsp">Contact Us</a></li>
				</ul>
				<div class="buttons">
					<a href="#login" class="signin">Sign In</a> <a href="registration.jsp"
						class="signup">Sign Up</a>
				</div>
			</nav>
		</header>

		<!------- Login Page ---------->
		
		
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
		
		
		<!------- End Login Page ---------->

		<%@include file="all_component/footer.jsp"%>
</body>
</html>