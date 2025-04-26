
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.IERP_FINAL.models.StudentMarks;
import com.IERP_FINAL.utils.DBConnection;
import com.mysql.cj.xdevapi.DbDoc;

@WebServlet("/views/teacher/ResultServlet")
public class ResultServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ResultServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");        
        String term = request.getParameter("term");
        String className = request.getParameter("class_name");
        int year = Integer.parseInt(request.getParameter("year"));
        

        try (Connection conn = DBConnection.getConnection()) {
           // AttendanceDAO attendanceDAO = new AttendanceDAO(conn);

            switch (action) {
            case "insert":
            	// Step 1: Fetch students by class_name
            	List<StudentMarks> studentList = new ArrayList<>();
            	String studentSql = "SELECT cs.student_id, cs.roll_no, s.full_name AS name, s.father_name AS parent_name " +
            	                    "FROM class_students cs " +
            	                    "JOIN students s ON cs.student_id = s.student_id " +
            	                    "WHERE cs.class_name = ?";
            	PreparedStatement studentStmt = conn.prepareStatement(studentSql);
            	studentStmt.setString(1, className);
            	ResultSet studentRs = studentStmt.executeQuery();

            	while (studentRs.next()) {
            	    StudentMarks sa = new StudentMarks();
            	    sa.setStudentId(studentRs.getInt("student_id"));
            	    sa.SetRollNo(studentRs.getString("roll_no"));
            	    sa.setStudentName(studentRs.getString("name")); // using alias from SQL
            	    sa.setClassName(className);
            	    studentList.add(sa);
            	}

            	// Step 2: Fetch subjects by class_name
            	List<Map<String, String>> subjectList = new ArrayList<>();
            	String subjectSql = "SELECT subject_id, subject_name FROM subjects WHERE class_name = ?";
            	PreparedStatement subjectStmt = conn.prepareStatement(subjectSql);
            	subjectStmt.setString(1, className);
            	ResultSet subjectRs = subjectStmt.executeQuery();

            	while (subjectRs.next()) {
            	    Map<String, String> subject = new HashMap<>();
            	    subject.put("subjectId", String.valueOf(subjectRs.getInt("subject_id")));
            	    subject.put("subjectName", subjectRs.getString("subject_name"));
            	    subjectList.add(subject);
            	}

            	// Common attributes
            	request.setAttribute("year", year);
            	request.setAttribute("className", className);
            	request.setAttribute("term", term);
            	request.setAttribute("action", action);
            	request.setAttribute("studentList", studentList);
            	request.setAttribute("subjectList", subjectList);

        		if ("insert".equalsIgnoreCase(action)) {
            	    request.getRequestDispatcher("result.jsp").forward(request, response);
            	} else {
            	    // Fallback or error page if needed
            	    request.setAttribute("error", "Invalid action.");
            	    request.getRequestDispatcher("error.jsp").forward(request, response);
            	}

            	break;
            case "view":
                List<StudentMarks> studentMarksList = new ArrayList<>();

                // SQL query to fetch all data from the result table
                String sql = "SELECT id, student_id, class_name, subject_id, " +
                             "subject_name, full_marks, marks, percentage, grade, created_by_teacher_id, term, acedamic_year " +
                             "FROM result WHERE acedamic_year = ? AND term = ? AND class_name = ?";

                // Use PreparedStatement to prevent SQL injection
                try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                    // Set the parameters for the query
                    stmt.setInt(1, year); // Assuming year is a variable in your code
                    stmt.setString(2, term); // Assuming term is a variable in your code
                    stmt.setString(3, className); // Assuming className is a variable in your code

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
                break;

                default:
                    response.sendRedirect("AttendanceControllerServlet?action=list&attClassName=" + className);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException("Error in doGet: " + e.getMessage(), e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            int year = Integer.parseInt(request.getParameter("year"));
            String term = request.getParameter("term");
            String className = request.getParameter("className");
            int teacherId = Integer.parseInt(request.getParameter("teacherId"));

            String[] studentIds = request.getParameterValues("studentId_2");
            String[] subjectIds = request.getParameterValues("subjectId_2");
            String[] subjectNames = request.getParameterValues("subjectName_2");
            String[] fullMarks = request.getParameterValues("full_marks");
            String[] actualMarks = request.getParameterValues("actual_marks");

            try (Connection conn = DBConnection.getConnection()) {
                String sql = "INSERT INTO result (student_id, class_name, subject_id, subject_name, full_marks, marks, created_by_teacher_id, term, acedamic_year) "
                           + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);

                for (int i = 0; i < studentIds.length; i++) {
                    int studentId = Integer.parseInt(studentIds[i]);

                    for (int j = 0; j < subjectIds.length; j++) {
                        int subjectId = Integer.parseInt(subjectIds[j]);
                        String subjectName = subjectNames[j];
                        BigDecimal fullMark = new BigDecimal(fullMarks[j]);
                        BigDecimal actualMark = new BigDecimal(actualMarks[j]);

                        // Set parameters
                        ps.setInt(1, studentId);
                        ps.setString(2, className);
                        ps.setInt(3, subjectId);
                        ps.setString(4, subjectName);
                        ps.setBigDecimal(5, fullMark);
                        ps.setBigDecimal(6, actualMark);
                        ps.setInt(7, teacherId);
                        ps.setString(8, term);
                        ps.setInt(9, year);

                        ps.addBatch(); // Add to batch
                    }
                }

                int[] inserted = ps.executeBatch(); // Execute all insertions
                request.setAttribute("message", inserted.length + " records inserted successfully!");
                request.getRequestDispatcher("result.jsp").forward(request, response);
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("message", "Database error: " + e.getMessage());
            }

        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("message", "Invalid input: " + e.getMessage());
        }

        request.getRequestDispatcher("yourResultPage.jsp").forward(request, response); // update with your actual JSP
    }
}
