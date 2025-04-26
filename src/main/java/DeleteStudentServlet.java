

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

/**
 * Servlet implementation class DeleteStudentServlet
 */
@WebServlet("/views/admin/DeleteStudentServlet")
public class DeleteStudentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteStudentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 int studentId = Integer.parseInt(request.getParameter("studentId"));

	        try (Connection conn = DBConnection.getConnection()) {
	            // Delete in order due to foreign key constraints
	            String[] tables = {
	                "stu_temp_address_info",
	                "stu_permanent_address",
	                "stu_admission_info",
	                "stu_health_info",
	                "stu_scholarships_info",
	                "students"
	            };

	            for (String table : tables) {
	                try (PreparedStatement stmt = conn.prepareStatement("DELETE FROM " + table + " WHERE student_id = ?")) {
	                    stmt.setInt(1, studentId);
	                    stmt.executeUpdate();
	                }
	            }

	            response.sendRedirect("FetchAllStudentData"); // or re-fetch the list
	        } catch (SQLException e) {
	            e.printStackTrace();
	            response.getWriter().println("Error deleting student.");
	        }
	}

}
