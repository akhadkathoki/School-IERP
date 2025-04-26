

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.IERP_FINAL.models.Admin;

/**
 * Servlet implementation class AdminSpecificProfile
 */
@WebServlet("/views/admin/AdminSpecificProfile")
public class AdminSpecificProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminSpecificProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false); // Get existing session
        if (session == null || session.getAttribute("username") == null) {
            response.sendRedirect("../index.jsp"); // Redirect to login if session is invalid
            return;
        }

        String username = (String) session.getAttribute("username"); // Retrieve admin_id from session
       
        List<Admin> adminList = new ArrayList<>();	
        
        try (Connection conn = DBConnection.getConnection()) { // Using try-with-resources to close connection automatically
            String sql = "SELECT * FROM admins WHERE username = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            
            while (rs.next()) {
                Admin admin = new Admin();

                int adminID = rs.getInt("admin_id");
                String role = rs.getString("role");
                String adminName = rs.getString("full_name");
                String adminGender = rs.getString("gender");
                String adminDob = rs.getString("date_of_birth");
                String adminContactNo = rs.getString("contact_number");
                String adminEmail = rs.getString("email_address");
                String adminUsername = rs.getString("username");
                String adminPassword = rs.getString("password");
                byte[] adminImage = rs.getBytes("profile_photo");
                String createdDate = rs.getString("created_at");

                admin.setId(adminID);
                admin.setRole(role); // Fixed incorrect method name
                admin.setFullName(adminName);
                admin.setGender(adminGender);
                admin.setDateOfBirth(adminDob);
                admin.setContactNumber(adminContactNo);
                admin.setEmail(adminEmail);
                admin.setUsername(adminUsername);
                admin.setPassword(adminPassword);
                admin.setProfilePhoto(adminImage);
                admin.setCreatedAt(createdDate);

                adminList.add(admin);
            }

            request.setAttribute("adminList", adminList);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/views/admin/profile.jsp"); // Ensure correct path
            dispatcher.forward(request, response);

		
        
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
        }
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
