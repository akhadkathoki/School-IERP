

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class RegPermAddress
 */
@WebServlet("/views/admin/RegPermAddress")
public class RegPermAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegPermAddress() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		  // Get form parameters
			int student_id = Integer.parseInt(request.getParameter("student_id"));			
	        String province = request.getParameter("permProvince");
	        String district = request.getParameter("permDistrict");
	        String municipality = request.getParameter("permMunicipality");
	        String wardStr = request.getParameter("permWard");
	        String street = request.getParameter("permStreet");

	        int ward = 0;
	        try {
	            ward = Integer.parseInt(wardStr);
	        } catch (NumberFormatException e) {
	            ward = 0; // default or show validation error
	        }
	        
	        try {
	            Connection conn = DBConnection.getConnection();

	            String sql = "INSERT INTO stu_permanent_address (student_id, province, district, municipality, ward, street) VALUES (?, ?, ?, ?, ?, ?)";
	            PreparedStatement ps = conn.prepareStatement(sql);
	            ps.setInt(1, student_id);
	            ps.setString(2, province);
	            ps.setString(3, district);
	            ps.setString(4, municipality);
	            ps.setInt(5, ward);
	            ps.setString(6, street);

	            int rowsInserted = ps.executeUpdate();

	            if (rowsInserted > 0) {
	            	request.setAttribute("studentId2", student_id);
	                request.setAttribute("tab", "academicInfo"); // Move to next tab
	                RequestDispatcher dispatcher = request.getRequestDispatcher("register_student.jsp");
	                dispatcher.forward(request, response);
	            } else {
	                response.getWriter().println("<h3>Failed to insert temporary address.</h3>");
	            }

	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.setContentType("text/html;charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<h3 style='color:red;'>Database Error: " + e.getMessage() + "</h3>");
	        }

	}

}
