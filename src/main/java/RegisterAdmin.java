

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;

/**
 * Servlet implementation class RegisterAdmin
 */
@WebServlet("/views/admin/RegisterAdmin")
public class RegisterAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	 // JDBC connection parameters
    private static final String JDBC_URL = "jdbc:mysql://localhost:3307/school_erp";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "";
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterAdmin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			response.sendRedirect("adminDashboard.jsp");

			System.out.println("Post Method Called");
		 	response.setContentType("text/html");
	        PrintWriter prints = response.getWriter();
	         
	        // Setting response type
	        String fullName = request.getParameter("full_name");
	        System.out.println(fullName);
	        String gender = request.getParameter("gender");
	        System.out.println(gender);
	        String dob = request.getParameter("date_of_birth");
	        System.out.println(dob);
	        String contactNumber = request.getParameter("contact_number");
	        System.out.println(contactNumber);
	        String emailAddress = request.getParameter("email_address");
	        String username = request.getParameter("username");
	        String passwordHash = request.getParameter("password_hash");
	        Part filePart = request.getPart("profile_photo"); // Profile photo upload

	        // Convert the profile photo to a byte array
	        byte[] profilePhoto = null;
	        if (filePart != null && filePart.getSize() > 0) {
	            InputStream inputStream = filePart.getInputStream();
	            profilePhoto = inputStream.readAllBytes();
	        }
	        
	        // Validate and convert Date of Birth
	        java.sql.Date sqlDate = null;
	        try {
	            if (dob != null && !dob.isEmpty()) {
	                sqlDate = java.sql.Date.valueOf(dob);
	            } else {
	                throw new IllegalArgumentException("Date of Birth cannot be empty or null.");
	            }
	        } catch (IllegalArgumentException e) {
	        	prints.println(fullName);
	        	prints.println(dob);
	        	prints.println(sqlDate);
	            prints.println("<h3 style='color:red;'>Invalid Date of Birth. Please provide the date in YYYY-MM-DD format.</h3>");
	            return; // Stop execution
	        }
	        
	   
	        prints.println("<h3>Received Parameters:</h3>");
	        for (String param : request.getParameterMap().keySet()) {
	            prints.println(param + ": " + request.getParameter(param) + "<br>");
	        }

	        // Establishing a database connection
	        try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				try(Connection conn = DriverManager.getConnection(JDBC_URL,JDBC_USER,JDBC_PASSWORD)){
					
	                // SQL query for inserting admin data
	                String sql = "INSERT INTO admins (full_name, gender, date_of_birth, contact_number, email_address, username, password_hash, profile_photo, created_at) VALUES (?, ?, ?, ?, ?, ?, ?, ?, NOW())";
	                PreparedStatement stmt = conn.prepareStatement(sql);
	                // Set values to the prepared statement
	                stmt.setString(1, fullName);
	                stmt.setString(2, gender);
	                stmt.setDate(3, sqlDate);
	                stmt.setString(4, contactNumber);
	                stmt.setString(5, emailAddress);
	                stmt.setString(6, username);
	                stmt.setString(7, passwordHash);
	                if (profilePhoto != null) {
	                    stmt.setBytes(8, profilePhoto);
	                } else {
	                    stmt.setNull(8, Types.BLOB);
	                }
	                
	        
	                // Execute the query
	                int rowAffected = stmt.executeUpdate();
	                if (rowAffected > 0) {
	                    System.out.println("<h3>Admin registered successfully!");
	                    response.sendRedirect("views/admin/adminDashboard.jsp");
	                } else {
	                    prints.println("<h3>Failed to register admin.</h3>");
	                }
	                
	    		} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
		            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
	}

}
