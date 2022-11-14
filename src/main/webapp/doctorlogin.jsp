<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Member Login</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>
  <div class="container-fluid p-0	">
  	<%@include file="navbar.jsp"%>
  </div>

  <!--Login from start from here  -->
  
  <div class="global-container">
	<div class="card login-form">
	<div class="card-body">
		<h3 class="card-title text-center">Log in Doctor</h3>
		<div class="card-text">
			<!--
			<div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
			<form action="doctorlogin.jsp" method="post">
				<!-- to error: add class "has-danger" -->
				<div class="form-group">
					<label for="exampleInputEmail1">Email address</label>
					<input 
					name="emailaddress"
					type="email" 
					class="form-control form-control-sm" 
					id="exampleInputEmail1" 
					aria-describedby="emailHelp"/>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<a href="#" style="float:right;font-size:12px;">Forgot password?</a>
					<input 
					name="password"
					type="password" 
					class="form-control form-control-sm" 
					id="exampleInputPassword1"/>
				</div>
				<button type="submit" class="btn btn-primary btn-block">Sign in</button>
				<div class="sign-up">
					Don't have an account? <a href="doctorsignup.jsp">Create One</a>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
    <%@include file="footer.jsp" %>
  
</body>
</html>
<%
try {
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/practice","root","admin@123"); 
	String email = request.getParameter("emailaddress");
	
	PreparedStatement patientdata = con.prepareStatement("select * from users where email=?");
	patientdata.setString(1, email);
	
	ResultSet rs = patientdata.executeQuery();

	
	if(rs.next()){
		if(request.getParameter("password").equals(rs.getString("password"))){
			
			HttpSession session1=request.getSession();
			session1.setAttribute("useremail",email);
			
			response.sendRedirect("dashboard.jsp");
		}
		else{
			response.sendRedirect("index.jsp");
		}
	}
	

	con.close(); 
	}
		catch (ClassNotFoundException e1) {	
	e1.printStackTrace();
	} 
		catch (SQLException e) {
	e.printStackTrace();
	}	
%>