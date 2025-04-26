

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

/**
 * Servlet implementation class RegHealthInfo
 */
@WebServlet("/views/admin/RegHealthInfo")
public class RegHealthInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegHealthInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		   // Set response content type
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // Get form parameters
        int studentId = Integer.parseInt(request.getParameter("student_id"));
        String bloodGroup = request.getParameter("bloodGroup");
        String medicalDetails = request.getParameter("medicalDetails");

        // Database variables
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Establish DB connection
            conn = DBConnection.getConnection();

            // Insert query
            String query = "INSERT INTO stu_health_info (student_id, blood_group, medical_details) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, studentId);
            pstmt.setString(2, bloodGroup);
            pstmt.setString(3, medicalDetails);

            // Execute update
            int rowCount = pstmt.executeUpdate();

            if (rowCount > 0) {
                request.setAttribute("studentId4", studentId);
                request.setAttribute("tab", "scholarshipInfo");
                // Forward to next tab
                RequestDispatcher dispatcher = request.getRequestDispatcher("register_student.jsp");
                dispatcher.forward(request, response);
            } else {
                response.setContentType("text/html");
                out.println("<h3 style='color:red;'>Failed to save academic info.</h3>");
            }

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Database Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
    }
}
