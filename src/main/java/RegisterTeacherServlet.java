

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.Types;

/**
 * Servlet implementation class RegisterTeacherServlet
 */
@WebServlet("/views/admin/RegisterTeacherServlet")
@MultipartConfig(maxFileSize = 16177215) // Maximum file size for uploads
public class RegisterTeacherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterTeacherServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String form = request.getParameter("form");

        try (Connection conn = DBConnection.getConnection()) {
       

            switch (form) {
                case "personalInfo":
                    int teacher_id = handlePersonalInfo(request, conn);
                    request.setAttribute("teacherId", teacher_id);
                    request.setAttribute("tab", "qualificationInfo");
                    break;

                case "qualificationInfo":
                    int teacher_id1 = handleQualificationInfo(request, conn);
                    request.setAttribute("teacherId", teacher_id1);
                    request.setAttribute("tab", "teacherLicense");
                    break;

                case "teacherLicense":
                	int teacher_id2 =  handleLicenseInfo(request, conn);
                    request.setAttribute("teacherId", teacher_id2);
                    request.setAttribute("tab", "EmergencyContact");
                    break;

                case "EmergencyContact":
                    handleEmergencyContact(request, conn);
                //    request.setAttribute("action", "list");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("TeacherServlet");
                    dispatcher.forward(request, response);
                    break;

                default:
                    throw new IllegalArgumentException("Unknown form section: " + form);
            }

            conn.close();
            RequestDispatcher dispatcher = request.getRequestDispatcher("register_teacher.jsp");
            dispatcher.forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Error: " + e.getMessage());
        }
	}
	
	
	// seperate forms
	

    private int handlePersonalInfo(HttpServletRequest request, Connection conn) throws Exception {
    	String role = request.getParameter("role");
    	String fullName = request.getParameter("fullName");
    	String dob = request.getParameter("dateOfBirth");
    	String gender = request.getParameter("gender");
    	String nationality = request.getParameter("nationality");
    	String citizenshipNumber = request.getParameter("citizenshipNumber");
    	String issuePlace = request.getParameter("citizenshipIssuePlace");
    	String issueDate = request.getParameter("citizenshipIssueDate");
    	String contactNumber = request.getParameter("contactNumber");
    	String email = request.getParameter("emailAddress");
    	String permAddr = request.getParameter("permanentAddress");
    	String tempAddr = request.getParameter("temporaryAddress");
    	String username = request.getParameter("username");
    	String password = request.getParameter("password");
    	Part photo = request.getPart("photo");

    	PreparedStatement ps = conn.prepareStatement(
    	    "INSERT INTO teachers (role, full_name, date_of_birth, gender, nationality, citizenship_number, citizenship_issue_place, citizenship_issue_date, contact_number, email_address, permanent_address, temporary_address, username, password, photo) " +
    	    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)"
    	);
    	ps.setString(1, role);
    	ps.setString(2, fullName);
    	ps.setString(3, dob);
    	ps.setString(4, gender);
    	ps.setString(5, nationality);
    	ps.setString(6, citizenshipNumber);
    	ps.setString(7, issuePlace);
    	ps.setString(8, issueDate);
    	ps.setString(9, contactNumber);
    	ps.setString(10, email);
    	ps.setString(11, permAddr);
    	ps.setString(12, tempAddr);
    	ps.setString(13, username);
    	ps.setString(14, password);

    	if (photo != null && photo.getSize() > 0) {
    	    ps.setBlob(15, photo.getInputStream());
    	} else {
    	    ps.setNull(15, Types.BLOB);
    	}

    	ps.executeUpdate();
    	
    	// Now, retrieve the most recent teacher_id using a separate SELECT query
    	String selectQuery = "SELECT LAST_INSERT_ID() AS teacher_id";
    	Statement stmt = conn.createStatement();
    	ResultSet rs = stmt.executeQuery(selectQuery);

    	int teacherId = -1;
    	if (rs.next()) {
    	    teacherId = rs.getInt("teacher_id");  // Get the most recent teacher_id
    	}
    	rs.close();
    	stmt.close();

    	ps.close();
    	return teacherId;

    }

    private int handleQualificationInfo(HttpServletRequest request, Connection conn) throws Exception {
    	int teacherId = Integer.parseInt(request.getParameter("teacher_id"));
    	String highestQualification = request.getParameter("highestQualification");
    	String specialization = request.getParameter("specialization");
    	double qualificationScore = Double.parseDouble(request.getParameter("qualificationScore"));
    	Part certificationImage = request.getPart("certificationImage");

    	PreparedStatement ps = conn.prepareStatement("INSERT INTO teacher_qualifications (teacher_id, highest_qualification, specialization, qualification_score, certification_image) VALUES (?, ?, ?, ?, ?)");

    	ps.setInt(1, teacherId);
    	ps.setString(2, highestQualification);
    	ps.setString(3, specialization);
    	ps.setDouble(4, qualificationScore);

    	if (certificationImage != null && certificationImage.getSize() > 0) {
    	    ps.setBlob(5, certificationImage.getInputStream());
    	} else {
    	    ps.setNull(5, Types.BLOB);
    	}

    	ps.executeUpdate();
    	ps.close();
    	return teacherId;
    }

    private int handleLicenseInfo(HttpServletRequest request, Connection conn) throws Exception {
        int teacherId = Integer.parseInt(request.getParameter("teacher_id"));
        String teachingLicenseNumber = request.getParameter("teaching_license_number");
        String licenseIssueDate = request.getParameter("license_issue_date");
        String licenseExpiryDate = request.getParameter("license_expiry_date");
        Part licenseImage = request.getPart("license_image");

        PreparedStatement ps = conn.prepareStatement(
            "INSERT INTO teacher_license (teacher_id, teaching_license_number, license_issue_date, license_expiry_date, license_image) VALUES (?, ?, ?, ?, ?)"
        );

        ps.setInt(1, teacherId);
        ps.setString(2, teachingLicenseNumber);
        ps.setString(3, licenseIssueDate);
        ps.setString(4, licenseExpiryDate);

        if (licenseImage != null && licenseImage.getSize() > 0) {
            ps.setBlob(5, licenseImage.getInputStream());
        } else {
            ps.setNull(5, Types.BLOB);
        }

        ps.executeUpdate();
        return teacherId;
    }


    private void handleEmergencyContact(HttpServletRequest request, Connection conn) throws Exception {
        int teacherId = Integer.parseInt(request.getParameter("teacher_id"));
        String emergencyName = request.getParameter("emergency_contact_name");
        String emergencyPhone = request.getParameter("emergency_contact_number");
        String emergencyEmail = request.getParameter("emergency_email");
        String emergencyRelation = request.getParameter("relationship_with_emergency_contact");

        PreparedStatement ps = conn.prepareStatement(
            "INSERT INTO teacher_emergency_contacts (teacher_id, emergency_contact_name, emergency_contact_number, emergency_email, relationship_with_emergency_contact) VALUES (?, ?, ?, ?, ?)"
        );

        ps.setInt(1, teacherId);
        ps.setString(2, emergencyName);
        ps.setString(3, emergencyPhone);
        ps.setString(4, emergencyEmail);
        ps.setString(5, emergencyRelation);

        ps.executeUpdate();
    }

}
