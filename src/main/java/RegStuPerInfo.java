import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/views/admin/RegStuPerInfo")
@MultipartConfig // Required to handle file upload
public class RegStuPerInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public RegStuPerInfo() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get all form parameters
        String role = "student";
        String fullName = request.getParameter("full_name");
        String dob = request.getParameter("date_of_birth");
        String gender = request.getParameter("gender");
        String nationality = request.getParameter("nationality");
        String birthRegNo = request.getParameter("birth_registration_no");
        String fatherName = request.getParameter("father_name");
        Part profilePhoto = request.getPart("profile_picture"); // For file
        String motherName = request.getParameter("mother_name");
        String grandfatherName = request.getParameter("grandfather_name");
        String username = request.getParameter("username");
        String password = request.getParameter("password"); // Ideally hash this

        try {
            Connection conn = DBConnection.getConnection();

            // Handle the file name and optionally save it to server
            String fileName = profilePhoto.getSubmittedFileName();
            
            // Optional: Save file to disk (uncomment and configure path if needed)
            // String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            // File uploadDir = new File(uploadPath);
            // if (!uploadDir.exists()) uploadDir.mkdir();
            // profilePhoto.write(uploadPath + File.separator + fileName);

            // SQL to insert student data
            String sql = "INSERT INTO students (role, full_name, date_of_birth_ad, gender, nationality, birth_registration_no, profile_picture, father_name, mother_name, grandfather_name, username, password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);

            // Set all values
            ps.setString(1, role);
            ps.setString(2, fullName);
            ps.setString(3, dob);
            ps.setString(4, gender);
            ps.setString(5, nationality);
            ps.setString(6, birthRegNo);
            ps.setString(7, fileName); // Store only the filename
            ps.setString(8, fatherName);
            ps.setString(9, motherName);
            ps.setString(10, grandfatherName);
            ps.setString(11, username);
            ps.setString(12, password); // Encrypt in production

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
            	 // Fetch the student ID using the unique username
                String idQuery = "SELECT student_id FROM students WHERE username = ?";
                PreparedStatement idStmt = conn.prepareStatement(idQuery);
                idStmt.setString(1, username);
                ResultSet idRs = idStmt.executeQuery();

                int studentId = 0;
                if (idRs.next()) {
                    studentId = idRs.getInt("student_id");
                }

                // Set attributes for the JSP
                request.setAttribute("studentId", studentId);
                request.setAttribute("tab", "tempAddress");

                // Forward to next tab
                RequestDispatcher dispatcher = request.getRequestDispatcher("register_student.jsp");
                dispatcher.forward(request, response);
            } else {
                response.setContentType("text/html;charset=UTF-8");
                PrintWriter out = response.getWriter();
                out.println("<h3 style='color:red;'>Failed to register student.</h3>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<h3 style='color:red;'>Database Error: " + escapeHtml(e.getMessage()) + "</h3>");
        }
    }

    // Optional utility to escape HTML in error messages
    private String escapeHtml(String input) {
        return input == null ? "" : input.replaceAll("&", "&amp;")
                .replaceAll("<", "&lt;")
                .replaceAll(">", "&gt;");
    }
}
