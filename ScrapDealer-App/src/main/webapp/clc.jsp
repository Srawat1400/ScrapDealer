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
<title>Net Value</title>
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
	response.setContentType("text/html;charset=UTF-8");
	int i = 1;
	String id = null;
    String rate=null;
    Double netvalue=0.0;

	try {

		id = request.getParameter("cid");

		Connection cn = MyConnection.makeConnection();
		Statement smt = cn.createStatement();
		ResultSet rs = smt.executeQuery("select * from scrap_items where id=" + id);
	%>
	<div class="tbl_div1 swiper">
		<div class="tbl_div2">
			<div class="card-wrapper swiper-wrapper">
				<form action='clc.jsp' method='post'>

					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col"></th>
								<th scope="col"></th>
								<th scope="col">value</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<%
						while (rs.next()) {
						%>
						<tbody>
							<tr>
								<td><%=(i++)%></td>
								<td><%=rs.getString(2)%></td>
								<td class="rt_tbl"><%=rs.getString(3)%>&#8377;</td>
								<td class="rt_tbl"><input type='text' pattern='[0-9]'
									name='weight' id="n2" placeholder='Enter Weight'> <input
									type='hidden' name='n1' id="n1" value='<%=rs.getString(3)%>'>
								</td>
								<td class="a_tbl">
									<button class="btn-primary" onclick="return validation();">Get Net Value</button>
								</td>
							</tr>
							<%
							}
							%>
						</tbody>

					</table>
			</form>
			</div>
		</div>
	</div>
	<%
	
	rate=request.getParameter("n1");
    String weight=request.getParameter("weight");
	Double Rate=Double.parseDouble(rate); 
    Double Weight=Double.parseDouble(weight);
    netvalue=Rate*Weight;
	} catch (Exception e) {
	out.println(e.toString());
	}
	%>

     <h3 class="netv">Your Net Value = <%= netvalue %>&#8377;</h3>
	<div style="height: 382px !important;"></div>
	<%@include file="all_component/footer.jsp"%>
	<%} %>
</body>
</html>