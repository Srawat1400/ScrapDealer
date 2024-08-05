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
<title>Sell Scrap</title>
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
        int i=1;
       try{
         Connection cn=MyConnection.makeConnection();
         Statement smt=cn.createStatement();
         ResultSet rs=smt.executeQuery("select * from scrap_items");
%>
	<div class="tbl_div1 swiper">
		<div class="tbl_div2">
			<div class="card-wrapper swiper-wrapper">
            <form action="Sell_Scrap" method="post">
                <table class="table table-striped sell_tbl">
                  
                   	<thead> <tr>
                   	<th>No.</th>
                   	<th>Scrap Name</th>
                   	<th>Expected Weight/kg</th>
                   	</tr></thead>
<%
        while(rs.next()){
         %>
                    <tr><td><%= i++ %></td><td><%=rs.getString("name") %></td><td><input type="number" pattern='[0-9]' name="<%=rs.getString("name") %>" placeholder="Enter Weight..." required></td></tr>         
        <% }
       i=1;
       }catch(Exception e){
           out.println(e.toString());
       }
        %>
                    <tr><td colspan="3"><center><button type="submit" class="btn-primary">Send Request</button></td></tr>
                </table> 
            </form> 
            </div>
            </div>
            </div>
       
       <div style="height: 210px !important;"></div>
	<%@include file="all_component/footer.jsp"%>
	<%} %>
    </body>
</html>