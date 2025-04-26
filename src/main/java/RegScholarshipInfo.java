

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
 * Servlet implementation class RegScholarshipInfo
 */
@WebServlet("/views/admin/RegScholarshipInfo")
public class RegScholarshipInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegScholarshipInfo() {
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

        // Read form values
		int student_id = Integer.parseInt(request.getParameter("student_id"));			
        String eligibilityStatus = request.getParameter("eligibilityStatus");
        String scholarshipName = request.getParameter("eligibilityName");
        String scholarshipAmountStr = request.getParameter("scholarshipAmount");
        String listType = request.getParameter("listType");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Parse scholarship amount safely
            double scholarshipAmount = 0.0;
            if (scholarshipAmountStr != null && !scholarshipAmountStr.isEmpty()) {
                scholarshipAmount = Double.parseDouble(scholarshipAmountStr);
            }

            // Get DB connection
            conn = DBConnection.getConnection();

            // SQL Insert Statement
            String query = "INSERT INTO stu_scholarships_info (student_id, eligibility_status, scholarship_name, scholarship_amount) VALUES (?, ?, ?, ?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, student_id);
            pstmt.setString(2, eligibilityStatus);
            pstmt.setString(3, scholarshipName);
            pstmt.setDouble(4, scholarshipAmount);

            // Execute update
            int rowCount = pstmt.executeUpdate();

            if (rowCount > 0) {
                // Forward to next tab
                RequestDispatcher dispatcher = request.getRequestDispatcher("FetchAllStudentData");
                dispatcher.forward(request, response);
            } else {
                out.println("<h3 style='color:red;'>Failed to register scholarship information.</h3>");
            }

        } catch (Exception e) {
            out.println("<h3 style='color:red;'>Error: " + e.getMessage() + "</h3>");
            e.printStackTrace();
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
	}

}
