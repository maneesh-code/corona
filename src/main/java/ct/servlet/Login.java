package ct.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/login-user")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
    }
    

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
		try {
			
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con=DriverManager.getConnection("jdbc:mysql://localhost/practice","root","admin@123"); 
			String email = request.getParameter("emailaddress");
			
			PreparedStatement patientdata = con.prepareStatement("select * from users where email=?");
			patientdata.setString(1, email);
			
			ResultSet rs = patientdata.executeQuery();

			
			if(rs.next()){
				if(request.getParameter("password").equals(rs.getString("password"))){
					
					HttpSession session=request.getSession();
					session.setAttribute("useremail",email);
					
					response.sendRedirect("myaccount.jsp");
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

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
		
		
	}

}
