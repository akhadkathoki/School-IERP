

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
 * Servlet implementation class RegTempAddress
 */
@WebServlet("/views/admin/RegTempAddress")
public class RegTempAddress extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegTempAddress() {
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
		
        String province = request.getParameter("province");
        String district = request.getParameter("district");
        String municipality = request.getParameter("municipality");
        String wardStr = request.getParameter("ward");
        String street = request.getParameter("street");

        int ward = 0;
        try {
            ward = Integer.parseInt(wardStr);
        } catch (NumberFormatException e) {
            ward = 0; // default or show validation error
        }
        
        try {
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO stu_temp_address_info (student_id, province, district, municipality, ward, street) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, student_id);
            ps.setString(2, province);
            ps.setString(3, district);
            ps.setString(4, municipality);
            ps.setInt(5, ward);
            ps.setString(6, street);

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
            	request.setAttribute("studentId1", student_id);
                request.setAttribute("tab", "permAddress"); // Move to next tab
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
