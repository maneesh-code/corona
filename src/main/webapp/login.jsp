<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Voter Login</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>

<%
	

%>

  <div class="container-fluid p-0">
  	<%@include file="navbar.jsp"%>
  </div>
  <div>
  </div>
  
  <!--Login from start from here  -->
  
  <div class="global-container">
	<div class="card login-form">
	<div class="card-body">
		<h3 class="card-title text-center">Register or Sign In for Vaccination
</h3>
		<div class="card-text">
			<!--
			<div class="alert alert-danger alert-dismissible fade show" role="alert">Incorrect username or password.</div> -->
			<form action="login-user" method="post">
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
					Don't have an account? <a href="signup.jsp">Create One</a>
				</div>
				<div class="sign-up">
					Are you Doctor! <a href="doctorlogin.jsp">Login</a>
				</div>
			</form>
		</div>
	</div>
</div>
</div>
  
    <%@include file="footer.jsp" %>
  
</body>
</html>