<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgate Password</title>
<%@include file="all_component/allCss.jsp" %>

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
					<li><a href="index.jsp">Home</a></li>
					<li><a href="index.jsp">About Us</a></li>
					<li><a href="index.jsp">Sell Scrap</a></li>
					<li><a href="index.jsp">Scrap Rates</a></li>
					<li><a href="index.jsp">Calculator</a></li>
					<li><a href="index.jsp">Contact Us</a></li>
				</ul>
				<div class="buttons">
					<a href="login.jsp" class="signin">Sign In</a> <a href="registration.jsp" class="signup">Sign
						Up</a>
				</div>
			</nav>
		</header>
	</div>
	<br>
		<!--------- Header End -------------->
	
<br>
<div class="container-fluid p-3 div1">
<div class="col-md-5 d1">
<form action="Forgatepwd" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" name="mail" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Click to get link for forgot passwords</label>
    <input type="hidden" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Get Link</button>
</form>
</div>
</div>
<div style="height: 180px !important;"></div>
	<%@include file="all_component/footer.jsp"%>
</body>
</html>