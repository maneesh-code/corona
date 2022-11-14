<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Voter Login</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>

  <div class="container-fluid p-0">
  	<%@include file="navbar.jsp"%>
  </div>
  <div>
  </div>
  
  <!--Login from start from here  -->
  
  <div class="global-container">
	<div class="card login-form">
	<div class="card-body">
		<h3 class="card-title text-center">Signup New Doctor</h3>
		<div class="card-text">
			<!--
			<div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
			<form action="doctorsignup.jsp" method="get">
				<!-- to error: add class "has-danger" -->
				<div class="form-group">
					<label for="exampleInputEmail1">Name</label>
					<input 
					name="name"
					type="text" 
					class="form-control form-control-sm" 
					id="name" 
					aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Aadhar number</label>
					<input 
					name="aadhar"
					type="text" 
					class="form-control form-control-sm" 
					id="aadhar" 
					aria-describedby="emailHelp">
				</div>
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label>
					<input 
					name="emailaddress"
					type="email" 
					class="form-control form-control-sm" 
					id="email" 
					aria-describedby="emailHelp"> 
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input 
					name="password"					
					type="password" 
					class="form-control form-control-sm" 
					id="password">
				</div>
				<button type="submit" class="btn btn-primary btn-block">Sign in</button>
				
				<div class="Login">
					Already have an account? <a href="login.jsp">Login</a>
				</div>
			</form>
		</div>
	</div>
</div>
</div>

<%
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/practice","root","admin@123"); 
		String name = request.getParameter("name");
		String aadhar = request.getParameter("aadhar");
		String email = request.getParameter("emailaddress");
		String password = request.getParameter("password");
		String role = "doctor";
		
		PreparedStatement patientdata = con.prepareStatement("insert into users (name, adharid, email, password, role)"
				+ " values(?, ?, ?, ?, ?)");
		patientdata.setString(1, name);
		patientdata.setString(2, aadhar);	
		patientdata.setString(3, email);
		patientdata.setString(4, password);
		patientdata.setString(5, role);
		
		patientdata.execute();
		response.sendRedirect("doctorlogin.jsp");
		
		con.close(); 
		}
 		catch (ClassNotFoundException e1) {	
		e1.printStackTrace();
		} 
 		catch (SQLException e) {
		e.printStackTrace();
		}
 %>
  
  
    <%@include file="footer.jsp" %>
  
</body>
</html>