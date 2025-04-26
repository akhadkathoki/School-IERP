

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

import com.IERP_FINAL.models.StudentMarks;

/**
 * Servlet implementation class FetchMyResultServlet
 */
@WebServlet("/views/student/FetchMyResultServlet")
public class FetchMyResultServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchMyResultServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	      String action = request.getParameter("action");        
	        String term = request.getParameter("term");
	        int studentId = Integer.parseInt(request.getParameter("studentId"));

	        int year = Integer.parseInt(request.getParameter("year"));
	        

		Connection conn = DBConnection.getConnection();
	    List<StudentMarks> studentMarksList = new ArrayList<>();

        // SQL query to fetch all data from the result table
	    String sql = "SELECT id, student_id, class_name, subject_id, " +
                "subject_name, full_marks, marks, percentage, grade, created_by_teacher_id, term, acedamic_year " +
                "FROM result WHERE acedamic_year = ? AND term = ? AND student_id = ?";
	  
        // Use PreparedStatement to prevent SQL injection
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            // Set the parameters for the query
            stmt.setInt(1, year); // Assuming year is a variable in your code
            stmt.setString(2, term); // Assuming term is a variable in your code
            stmt.setInt(3, studentId); 

            // Execute the query
            try (ResultSet rs = stmt.executeQuery()) {

                // Process the result set and map each row to a StudentMarks object
                while (rs.next()) {
                    StudentMarks studentMarks = new StudentMarks();
                    studentMarks.setId(rs.getInt("id"));
                    studentMarks.setStudentId(rs.getInt("student_id"));
                    studentMarks.setClassName(rs.getString("class_name"));
                    studentMarks.setSubjectId(rs.getInt("subject_id"));
                    studentMarks.setSubjectName(rs.getString("subject_name"));
                    studentMarks.setFullMarks(rs.getDouble("full_marks"));
                    studentMarks.setMarks(rs.getDouble("marks"));
                    studentMarks.setPercentage(rs.getDouble("percentage"));
                    studentMarks.setGrade(rs.getString("grade"));
                    studentMarks.setCreatedByTeacherId(rs.getInt("created_by_teacher_id"));
                    studentMarks.setTerm(rs.getString("term"));
                    studentMarks.setAcademicYear(rs.getInt("acedamic_year"));

                    // Add the populated StudentMarks object to the list
                    studentMarksList.add(studentMarks);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle the exception (e.g., show an error message to the user)
        }

        // Set the action and result attributes for forwarding
        request.setAttribute("action", action); // Return the action (optional)
        request.setAttribute("result", studentMarksList); // Return the list of student marks
        request.getRequestDispatcher("result.jsp").forward(request, response);
	}

}
