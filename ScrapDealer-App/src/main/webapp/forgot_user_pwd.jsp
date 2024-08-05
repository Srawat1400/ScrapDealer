
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Forgot pwd</title>
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
	<%
    String email=request.getParameter("maill");

	%>

<br>
<div class="container-fluid p-3 div1">
<div class="col-md-5 d1">
<form action="forgot_pass.jsp" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Enter Password</label>
    <input type="password" class="form-control" id="pwd1" aria-describedby="emailHelp" placeholder="Enter password">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email or passwords with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Confirm Passwords</label>
    <input type="password" name="forgoted_pwd" class="form-control" id="pwd2" placeholder="confirm Password" required><span id="spn" style="color:red;"></span>
      <input type="hidden" name="mailll" class="form-control"  value="<%=email %>">
        <input type="hidden" name="namee" class="form-control"  value="">
        <input type="hidden" name="idd" class="form-control"  value="">
  
  </div>
  <button type="submit" onclick="return validation();" class="btn btn-primary">Forgot</button>
</form>
</div>
</div>
<div style="height: 235px !important;"></div>
	<%@include file="all_component/footer.jsp"%>
	
	  <script>
	  function validation(){
          pwd1=document.getElementById("pwd1").value;
          pwd2=document.getElementById("pwd2").value;
          
          if(pwd1===pwd2){
              return true;
          }else{
              
              document.getElementById("spn").innerHTML="Password And Confirm Password Not Match";
              return false;
          }
	  }
	</script>
</body>
</html>