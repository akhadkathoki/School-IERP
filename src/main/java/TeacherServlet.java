import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import com.IERP_FINAL.dao.TeacherDAO;
import com.IERP_FINAL.models.Teacher;
import com.IERP_FINAL.utils.DBConnection;

@WebServlet("/views/admin/TeacherServlet")
@MultipartConfig(maxFileSize = 16177215) // 16MB
public class TeacherServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private TeacherDAO dao = new TeacherDAO();

    public TeacherServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action != null && action.equals("getById")) {
            getTeacherById(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) action = "list"; // default action

        switch (action) {
            case "update":
                updateTeacher(request, response);
                break;
            case "getForEdit":
            	getTeacherByIdForUpdate(request, response);
            	break;
            case "getById":
                getTeacherById(request, response);
                break;
            case "delete":
                deleteTeacher(request, response);
                break;
            case "list":
                listTeachers(request, response);
                break;

            default:
                listTeachers(request, response);
                break;
        }
    }

    // Helper method to safely parse a date
    private Date parseDate(String dateStr) {
        if (dateStr != null && !dateStr.trim().isEmpty()) {
            try {
                return Date.valueOf(dateStr); // will throw exception if invalid
            } catch (IllegalArgumentException e) {
                e.printStackTrace(); // log the invalid date format
            }
        }
        return null; // return null if the date is invalid or empty
    }

    private void updateTeacher(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
	        try {
	            int id = Integer.parseInt(request.getParameter("teacherId"));
	
	            String teacherUpdate = "UPDATE teachers SET full_name = ?, gender = ?, date_of_birth = ?, nationality = ?, " +
	                    "citizenship_number = ?, citizenship_issue_place = ?, citizenship_issue_date = ?, " +
	                    "contact_number = ?, email_address = ?, permanent_address = ?, temporary_address = ?, " +
	                    "username = ?, password = ?, photo = ?, created_at = ? WHERE teacher_id = ?";
	
	            String emergencyUpdate = "UPDATE teacher_emergency_contacts SET emergency_contact_name = ?, emergency_contact_number = ?, emergency_email = ?, relationship_with_emergency_contact = ? WHERE teacher_id = ?";

	
	            String qualificationUpdate = "UPDATE teacher_qualifications SET highest_qualification = ?, specialization = ?, qualification_score = ?, certification_image = ? WHERE teacher_id = ?";

	
	            String licenseUpdate = "UPDATE teacher_license SET teaching_license_number = ?, license_issue_date = ?, license_expiry_date = ?, license_image = ? WHERE teacher_id = ?";

	            // Fetch files from form
	            Part photoPart = request.getPart("photo");
	            Part certImagePart = request.getPart("certificationImage");
	            Part licenseImagePart = request.getPart("licenseImage");
	
	            byte[] photo = null;
	            if (photoPart != null && photoPart.getSize() > 0) {
	                photo = photoPart.getInputStream().readAllBytes();
	            }
	
	            byte[] certImage = null;
	            if (certImagePart != null && certImagePart.getSize() > 0) {
	                certImage = certImagePart.getInputStream().readAllBytes();
	            }
	
	            byte[] licenseImage = null;
	            if (licenseImagePart != null && licenseImagePart.getSize() > 0) {
	                licenseImage = licenseImagePart.getInputStream().readAllBytes();
	            }
	
	            try (Connection conn = DBConnection.getConnection()) {
	                conn.setAutoCommit(false);
	
	                try (
	                    PreparedStatement ps1 = conn.prepareStatement(teacherUpdate);
	                    PreparedStatement ps2 = conn.prepareStatement(emergencyUpdate);
	                    PreparedStatement ps3 = conn.prepareStatement(qualificationUpdate);
	                    PreparedStatement ps4 = conn.prepareStatement(licenseUpdate)
	                ) {
	                    int teacherId = Integer.parseInt(request.getParameter("teacherId"));
	
	                    // Teachers
	                    ps1.setString(1, request.getParameter("fullName"));
	                    ps1.setString(2, request.getParameter("gender"));
	                    ps1.setDate(3, parseDate(request.getParameter("dateOfBirth")));
	                    ps1.setString(4, request.getParameter("nationality"));
	                    ps1.setString(5, request.getParameter("citizenshipNumber"));
	                    ps1.setString(6, request.getParameter("citizenshipIssuePlace"));
	                    ps1.setDate(7, parseDate(request.getParameter("citizenshipIssueDate")));
	                    ps1.setString(8, request.getParameter("contactNumber"));
	                    ps1.setString(9, request.getParameter("emailAddress"));
	                    ps1.setString(10, request.getParameter("permanentAddress"));
	                    ps1.setString(11, request.getParameter("temporaryAddress"));
	                    ps1.setString(12, request.getParameter("username"));
	                    ps1.setString(13, request.getParameter("password"));
	                    ps1.setBytes(14, photo);
	                    ps1.setDate(15, new java.sql.Date(System.currentTimeMillis()));
	                    ps1.setInt(16, teacherId);
	                    ps1.executeUpdate();
	
	                    // Emergency
	                    ps2.setString(1, request.getParameter("emergencyContactName"));
	                    ps2.setString(2, request.getParameter("emergencyContactNumber"));
	                    ps2.setString(3, request.getParameter("emergencyEmail"));
	                    ps2.setString(4, request.getParameter("relationshipWithEmergencyContact"));
	                    ps2.setInt(5, teacherId);
	                    ps2.executeUpdate();
	
	                    // Qualification
	                    ps3.setString(1, request.getParameter("highestQualification"));
	                    ps3.setString(2, request.getParameter("specialization"));
	                    ps3.setFloat(3, Float.parseFloat(request.getParameter("qualificationScore")));
	                    ps3.setBytes(4, certImage);
	                    ps3.setInt(5, teacherId);
	                    ps3.executeUpdate();
	
	                    // License
	                    ps4.setString(1, request.getParameter("teachingLicenseNumber"));
	                    ps4.setDate(2, parseDate(request.getParameter("licenseIssueDate")));
	                    ps4.setDate(3, parseDate(request.getParameter("licenseExpiryDate")));
	                    ps4.setBytes(4, licenseImage);
	                    ps4.setInt(5, teacherId);
	                    ps4.executeUpdate();
	
	                    conn.commit();
	
	                    Teacher t = dao.getTeacherById(id);
	                    request.setAttribute("teacher", t);
	                    request.getRequestDispatcher("teacherProfile.jsp").forward(request, response);
	                } catch (Exception e) {
	                    conn.rollback(); // rollback transaction on failure
	                    e.printStackTrace();
	                    response.getWriter().println("Error: " + e.getMessage());
	                }
	            } catch (Exception e) {
	                e.printStackTrace();
	                response.getWriter().println("Database Error: " + e.getMessage());
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	            response.getWriter().println("Error: " + e.getMessage());
	        }
	    }


    private void getTeacherById(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("teacherId"));
            Teacher t = dao.getTeacherById(id);
            request.setAttribute("teacher", t);
            
            request.getRequestDispatcher("teacherProfile.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
    
    private void getTeacherByIdForUpdate(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("teacherId"));
            Teacher t = dao.getTeacherById(id);
            request.setAttribute("teacher", t);
            
            request.getRequestDispatcher("edit_teacher.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }

    private void deleteTeacher(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        try {
            int id = Integer.parseInt(request.getParameter("teacherId"));
            boolean result = dao.deleteTeacher(id);
            if (result) {
                response.sendRedirect("TeacherServlet?action=list");
            } else {
                response.getWriter().println("delete failed. Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }

    private void listTeachers(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            List<Teacher> teachers = dao.getAllTeacherProfiles();

            // ✅ Remove duplicates using LinkedHashSet (preserves order)
            Set<Teacher> uniqueTeachers = new LinkedHashSet<>(teachers);

            // ✅ Set deduplicated list
            request.setAttribute("teacherList", new ArrayList<>(uniqueTeachers));

            // ✅ Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("teacher_list.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println(e);
        }
    }
}
