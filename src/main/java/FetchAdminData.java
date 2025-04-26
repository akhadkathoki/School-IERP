

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import com.IERP_FINAL.models.Admin;

/**
 * Servlet implementation class FetchAdminData
 */
@WebServlet("/views/admin/FetchAdminData")
public class FetchAdminData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchAdminData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        List<Admin> adminList = new ArrayList<>();
        
        try {
			Connection conn = DBConnection.getConnection();
	        String sql = "SELECT * FROM admins";
	        PreparedStatement ps = conn.prepareStatement(sql);
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
                String createdDate=  rs.getString("created_at");
                
                admin.setId(adminID);
                admin.setRole(role);
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
            RequestDispatcher dispatcher = request.getRequestDispatcher("admin_list.jsp");
            dispatcher.forward(request, response);
            
            
    	} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
            response.getWriter().println("<h3>Error: " + e.getMessage() + "</h3>");
		}
	       
        
        
        
	}

}
