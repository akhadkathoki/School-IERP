

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

import com.IERP_FINAL.models.Student;


/**
 * Servlet implementation class GetStudentDetails
 */
@WebServlet("/views/student/StudentProfileDetails")
public class StudentProfileDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentProfileDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Fetch student ID from URL
		String studentIdParam = request.getParameter("id");

		if (studentIdParam == null || studentIdParam.isEmpty()) {
			response.getWriter().println("<h3 style='color:red;'>Student ID is missing in the request!</h3>");
			return;
		}

		int studentId = Integer.parseInt(studentIdParam);
		Student s = new Student();

		try (Connection conn = DBConnection.getConnection()) {
			String query = "SELECT si.*, ta.*, pa.*, ai.*, hi.*, sc.* " +
                    "FROM students si " +
                    "LEFT JOIN stu_temp_address_info ta ON si.student_id = ta.student_id " +
                    "LEFT JOIN stu_permanent_address pa ON si.student_id = pa.student_id " +
                    "LEFT JOIN stu_admission_info ai ON si.student_id = ai.student_id " +
                	"LEFT JOIN stu_health_info hi ON si.student_id = hi.student_id " +
                    "LEFT JOIN stu_scholarships_info sc ON si.student_id = sc.student_id " +
                    "WHERE si.student_id = ?";

			PreparedStatement stmt = conn.prepareStatement(query);
			stmt.setInt(1, studentId);

			ResultSet rs = stmt.executeQuery();

			if (rs.next()) {
				// Student Info
				s.setStudentId(rs.getInt("student_id"));
				s.setRole(rs.getString("role"));
				s.setFullName(rs.getString("full_name"));
				s.setDateOfBirthAd(rs.getDate("date_of_birth_ad"));
				s.setGender(rs.getString("gender"));
				s.setNationality(rs.getString("nationality"));
				s.setBirthRegistrationNo(rs.getString("birth_registration_no"));
				s.setProfilePicture(rs.getBytes("profile_picture"));
				s.setFatherName(rs.getString("father_name"));
				s.setMotherName(rs.getString("mother_name"));
				s.setGrandfatherName(rs.getString("grandfather_name"));
				s.setUsername(rs.getString("username"));
				s.setPassword(rs.getString("password"));
				s.setCreatedAt(rs.getDate("created_at"));

				// Temporary Address
				s.setTempProvince(rs.getString("ta.province"));
				s.setTempDistrict(rs.getString("ta.district"));
				s.setTempMunicipality(rs.getString("ta.municipality"));
				s.setTempWard(rs.getInt("ta.ward"));
				s.setTempStreet(rs.getString("ta.street"));

				// Permanent Address
				s.setPermProvince(rs.getString("pa.province"));
				s.setPermDistrict(rs.getString("pa.district"));
				s.setPermMunicipality(rs.getString("pa.municipality"));
				s.setPermWard(rs.getInt("pa.ward"));
				s.setPermStreet(rs.getString("pa.street"));

				// Academic Info
				s.setPreviousSchoolName(rs.getString("previous_school_name"));
				s.setPreviousSchoolAddress(rs.getString("previous_school_address"));
				s.setPreviousAcademicGrade(rs.getString("previous_acedamic_grade"));
				s.setAcademicRecord(rs.getString("academic_record"));
				s.setCharacterCertificate(rs.getBytes("character_certificate"));
				s.setMarkSheet(rs.getBytes("mark_sheet"));
				s.setLanguageProficiency(rs.getString("language_proficiency"));

				// Health Info
				s.setBloodGroup(rs.getString("blood_group"));
				s.setMedicalDetails(rs.getString("medical_details"));

				// Scholarship Info
				s.setEligibilityStatus(rs.getString("eligibility_status"));
				s.setScholarshipName(rs.getString("scholarship_name"));
				s.setScholarshipAmount(rs.getDouble("scholarship_amount"));

				// Set student object to request
				request.setAttribute("student", s);

				// Redirect to student profile JSP
				RequestDispatcher dispatcher = request.getRequestDispatcher("profile.jsp");
				dispatcher.forward(request, response);

			} else {
				response.getWriter().println("<h3 style='color:red;'>Student with ID " + studentId + " not found!</h3>");
			}

		} catch (SQLException e) {
			e.printStackTrace(); // Log error for debugging
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().println("<h3 style='color:red;'>Database Error: " + e.getMessage() + "</h3>");
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("error", "Error fetching student details.");
		}
	}

}
