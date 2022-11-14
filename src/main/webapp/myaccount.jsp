<%@page import="java.io.IOException"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
    
<% 
String email = (String)session.getAttribute("useremail");	
String username = null;
String useradharid= null;
String userphone= null;
String useraddress= null;
int vd = 0;
try{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost/practice","root","admin@123"); 
	PreparedStatement voterdata = con.prepareStatement("select * from users where email=?");
	voterdata.setString(1, email);
	ResultSet rs = voterdata.executeQuery();
	
	if(rs.next()){
		
		 username = rs.getString("name");
		 useradharid = rs.getString("adharid");
		 userphone = rs.getString("phone");
		 useraddress = rs.getString("address");
		 vd = rs.getInt("vaccine");
		}
	con.close(); 	

	}
		catch (ClassNotFoundException e1) {e1.printStackTrace();}
		catch (SQLException e) {e.printStackTrace();}
		catch (Exception e) {e.printStackTrace();}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Dashboard</title>
    <%@include file="all_js_css.jsp" %>
</head>
<body>
  <div class="container-fluid p-0	">
  	<%@include file="navbar.jsp"%>
  </div>

  <!--Dashboard from start from here  -->
  
<section style="background-color: #eee;">
  <div class="container py-5">
    <div class="row">
      <div class="col">
        <nav aria-label="breadcrumb" class="bg-light rounded-3 p-3 mb-4">
          <ol class="breadcrumb mb-0">
            <li class="breadcrumb-item"><a href="#">Home</a></li>
            <li class="breadcrumb-item"><a href="#">User</a></li>
            <li class="breadcrumb-item active" aria-current="page">User Profile</li>
          </ol>
        </nav>
      </div>
    </div>
    <div class="row">
      <div class="col-lg-4">
        <div class="card mb-4">
          <div class="card-body text-center">
            <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-chat/ava3.webp" alt="avatar"
              class="rounded-circle img-fluid" style="width: 150px;">
            <h5 class="my-3"></h5>
            <p class="text-muted mb-1 text-capitalize"><%=username%></p>
            <p class="text-muted mb-4">Bay Area, San Francisco, CA</p>
            <div class="d-flex justify-content-center mb-2">
            <!-- <a href="editprofile.jsp?email=useremail" type="button" class="btn btn-primary">Edit Profile</a> -->  
              <a href="editprofile.jsp?email=useremail" type="button" class="btn btn-primary">Edit Profile</a>
              <button type="button" class="btn btn-outline-primary ms-1">Apply Next Dose</button>
            </div>
          </div>
        </div>
      </div>
      <div class="col-lg-8">
        <div class="card mb-4">
          <div class="card-body">
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Full Name</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0 text-capitalize"><%=username%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Email</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=email%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Phone</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=userphone%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Adhar ID</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=useradharid%></p>
              </div>
            </div>
            <hr>
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Address</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=useraddress%></p>
              </div>
            </div>
            <hr> 
            <div class="row">
              <div class="col-sm-3">
                <p class="mb-0">Vaccine Dose</p>
              </div>
              <div class="col-sm-9">
                <p class="text-muted mb-0"><%=vd%></p>
              </div>
            </div> 
          </div>
        </div>
  </div>
	</div>
	</div>
</section>
	
	 
<%@include file="footer.jsp" %>
  
</body>
</html>