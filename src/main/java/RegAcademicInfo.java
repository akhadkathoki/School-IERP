import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/views/admin/RegAcademicInfo")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10) // Max 10MB file size
public class RegAcademicInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

		int student_id = Integer.parseInt(request.getParameter("student_id"));			
        String prevSchoolName = request.getParameter("prevSchoolName");
        String prevSchoolAddress = request.getParameter("prevSchoolAddress");
        float prevAcademicGrade = Float.parseFloat(request.getParameter("prevAcademicGrade"));
        String academicRecord = request.getParameter("academicRecord");
        String languageProficiency = request.getParameter("languageProficiency");

        // Files
        Part characterCertPart = request.getPart("characterCertificate");
        Part markSheetPart = request.getPart("markSheet");

        try {
            Connection conn = DBConnection.getConnection();

            String sql = "INSERT INTO stu_admission_info (student_id, previous_school_name, previous_school_address, previous_acedamic_grade, academic_record, character_certificate, mark_sheet, language_proficiency) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = conn.prepareStatement(sql);

            ps.setInt(1, student_id);
            ps.setString(2, prevSchoolName);
            ps.setString(3, prevSchoolAddress);
            ps.setFloat(4, prevAcademicGrade);
            ps.setString(5, academicRecord);

            // Set file streams (can be null if no file uploaded)
            if (characterCertPart != null) {
                InputStream certStream = characterCertPart.getInputStream();
                ps.setBlob(6, certStream);
            } else {
                ps.setNull(6, java.sql.Types.BLOB);
            }

            if (markSheetPart != null) {
                InputStream markSheetStream = markSheetPart.getInputStream();
                ps.setBlob(7, markSheetStream);
            } else {
                ps.setNull(7, java.sql.Types.BLOB);
            }

            ps.setString(8, languageProficiency);

            int rowsInserted = ps.executeUpdate();

            if (rowsInserted > 0) {
                request.setAttribute("studentId3", student_id);
                request.setAttribute("tab", "healthInfo");
                // Forward to next tab
                RequestDispatcher dispatcher = request.getRequestDispatcher("register_student.jsp");
                dispatcher.forward(request, response);
            } else {
                response.setContentType("text/html");
                PrintWriter out = response.getWriter();
                out.println("<h3 style='color:red;'>Failed to save academic info.</h3>");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<h3 style='color:red;'>Database Error: " + escapeHtml(e.getMessage()) + "</h3>");
        }
    }

    private String escapeHtml(String input) {
        return input == null ? "" : input.replaceAll("&", "&amp;")
                .replaceAll("<", "&lt;")
                .replaceAll(">", "&gt;");
    }
}
