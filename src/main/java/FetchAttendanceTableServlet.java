

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
import java.util.ArrayList;
import java.util.List;

import com.IERP_FINAL.models.StudentAttendance;

/**
 * Servlet implementation class FetchAttendanceTableServlet
 */
@WebServlet("/views/teacher/FetchAttendanceTableServlet")
public class FetchAttendanceTableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchAttendanceTableServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action"); // can be "view", "insert", "edit", "delete"
        String className = request.getParameter("class_name");
        String subjectName = request.getParameter("subject_name");
        String month = request.getParameter("month");
        
        int totalClass = Integer.parseInt(request.getParameter("total_class"));
        int teacherId = Integer.parseInt(request.getParameter("teacherId"));

        switch (action) {
        case "view":
        	 List<StudentAttendance> studentList = new ArrayList<>();
        		
 	        try (Connection con = DBConnection.getConnection()) {
 	        	  String sql = "SELECT * FROM attendance WHERE class_name=? AND subject_name=? AND month=?";
 	             PreparedStatement ps = con.prepareStatement(sql);
 	             ps.setString(1, className);
 	             ps.setString(2, subjectName);
 	             ps.setString(3, month);
 	
 	            ResultSet rs = ps.executeQuery();
 	
 	            while (rs.next()) {
	              StudentAttendance sa = new StudentAttendance();
	              sa.setStudentId(rs.getInt("student_id"));
 	              sa.setRollNo(rs.getString("roll_no"));
 	              sa.setName(rs.getString("name"));
 	              sa.setParentName(rs.getString("parent_name"));
 	              sa.setClassName(rs.getString("class_name"));
 	              sa.setMonth(rs.getString("month"));
 	              sa.setTotalClass(rs.getInt("total_classes"));
 	              sa.setSubjectName(rs.getString("subject_name"));
 	              sa.setTotalPresent(rs.getInt("total_present"));
 	              sa.setTotalAbsent(rs.getInt("total_absent"));
 	              sa.setAttendancePercent(rs.getInt("attendance_percent"));
 	              
                  studentList.add(sa);
 	            }
	 	            // Common attributes
	 	        request.setAttribute("teacherId", teacherId);
	 	        request.setAttribute("month", month);
	 	        request.setAttribute("action", action);
	 	        request.setAttribute("subjectName", subjectName);
	 	        request.setAttribute("className", className);
	 	        request.setAttribute("totalClass", totalClass);
	 	        request.setAttribute("studentAttendance", studentList);
	 	
	 	       RequestDispatcher dispatcher = request.getRequestDispatcher("select_class.jsp");
               dispatcher.forward(request, response);
 	
 	        } catch (Exception e) {
 	            e.printStackTrace();
 	            response.getWriter().println(e);
 	        }
 	

        	break;
        case "insert":

	        List<StudentAttendance> emptyStudentList = new ArrayList<>();
	
	        try (Connection con = DBConnection.getConnection()) {
	            String sql = "SELECT DISTINCT cs.student_id, cs.roll_no, s.full_name AS name, s.father_name AS parent_name, " +
	                         "sub.subject_id, cs.class_name " +
	                         "FROM class_students cs " +
	                         "JOIN students s ON cs.student_id = s.student_id " +
	                         "JOIN classrooms c ON cs.class_name = c.class_name " +
	                         "JOIN subjects sub ON sub.class_name = c.class_name " +
	                         "WHERE c.class_name = ? AND sub.subject_name = ? AND sub.subject_teacher_id = ?";
	
	            PreparedStatement ps = con.prepareStatement(sql);
	            ps.setString(1, className);
	            ps.setString(2, subjectName);
	            ps.setInt(3, teacherId);
	
	            ResultSet rs = ps.executeQuery();
	
	            while (rs.next()) {
	                StudentAttendance sa = new StudentAttendance();
	                sa.setStudentId(rs.getInt("student_id"));
	                sa.setRollNo(rs.getString("roll_no"));
	                sa.setName(rs.getString("name"));
	                sa.setParentName(rs.getString("parent_name"));
	                sa.setSubjectId(rs.getInt("subject_id"));
	                sa.setClassName(rs.getString("class_name"));
	                sa.setMonth(month);
	                emptyStudentList.add(sa);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	
	        // Common attributes
	        request.setAttribute("teacherId", teacherId);
	        request.setAttribute("month", month);
	        request.setAttribute("action", action);
	        request.setAttribute("subjectName", subjectName);
	        request.setAttribute("className", className);
	        request.setAttribute("totalClass", totalClass);
	        request.setAttribute("studentAttendanceForm", emptyStudentList);
	
	
	        request.getRequestDispatcher("select_class.jsp").forward(request, response);
        	break;
        case "update":
        	   request.setAttribute("teacherId", teacherId);
	 	        request.setAttribute("month", month);
	 	        request.setAttribute("action", action);
	 	        request.setAttribute("subjectName", subjectName);
	 	        request.setAttribute("className", className);
	 	        request.setAttribute("totalClass", totalClass);
	 	
	 	       RequestDispatcher dispatcher = request.getRequestDispatcher("select_class.jsp");
              dispatcher.forward(request, response);
        	break;
        }
    }

}
