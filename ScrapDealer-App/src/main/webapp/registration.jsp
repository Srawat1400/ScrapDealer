<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration</title>
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
					<a href="login.jsp" class="signin">Sign In</a> <a href="#rg"
						class="signup">Sign Up</a>
				</div>
			</nav>
		</header>


	<!------- Registration page -------->
<div class="container-fluid p-3 registerdiv1">
<div class="col-md-5 registerd1">
	  <div class="wrapper_regis">
    <h2>Registration</h2>
    <form action="Register" method="post">	
      <div class="input-box" id="rg">
        <input type="text" name="name" placeholder="Enter your name" required>
      </div>
      <div class="input-box">
        <input type="email" name="mail" placeholder="Enter your email" required>
      </div>
      <div class="input-box">
    <input type="text" name="number" pattern="[6789][0-9]{9}" class="form-control" placeholder="Enter Number" required>
      </div>
      <div class="input-box">
    <input type="text" name="address" class="form-control" placeholder="Enter Address" required>
      </div>
      <div class="input-box">
    <input type="text" name="pin" class="form-control" placeholder="Enter PinCode" required>
      </div>
      <div class="input-box">
        <input type="password" name="pass" id="pwd1" placeholder="Create password" required>
      </div>
      <div class="input-box">
        <input type="password" name="pass" id="pwd2" placeholder="Confirm password" required><span id="spn" style="color:red;"></span>
      </div>
      <div class="policy">
        <input type="checkbox" id="box">
        <h3>I accept all terms & condition</h3><span id="ch" style="color:red;"></span>
      </div>
      <div class="input-box button">
        <input type="Submit" onclick="return validation();" value="Register Now">
      </div>
      <div class="text">
        <h3>Already have an account? <a href="login.jsp">Login now</a></h3>
      </div>
    </form>
  </div>
	</div>
	</div>

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