
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import com.IERP_FINAL.dao.ClassSubjectStudentDAO;
import com.IERP_FINAL.dao.SubjectDAO;
import com.IERP_FINAL.models.Subject;

/**
 * Servlet implementation class AddSubjectServlet
 */
@WebServlet("/views/admin/AddSubjectServlet")
public class AddSubjectServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public SubjectDAO subjectDAO;
    public ClassSubjectStudentDAO dao;

    /**
     * Initialize the DAO object
     */
    @Override
    public void init() throws ServletException {
        subjectDAO = new SubjectDAO();
        dao = new ClassSubjectStudentDAO();
    }

    /**
     * Handles GET requests for listing, editing, and deleting subjects
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "list":
                    List<Subject> subjects = subjectDAO.getAllSubjects();
                    request.setAttribute("subjectList", subjects);
                    List<Map<String, Object>> list = dao.getAll(); // Returns List<Map<String, Object>>
	                request.setAttribute("cssList", list); // Set the list as an attribute
                    request.getRequestDispatcher("subject_and_student.jsp").forward(request, response);
                    break;

                case "edit":
                    int id = Integer.parseInt(request.getParameter("subject_id"));
                    Subject sub = subjectDAO.getSubjectById(id);
                    request.setAttribute("subject", sub);
                    request.getRequestDispatcher("edit_subject.jsp").forward(request, response);
                    break;

                case "delete":
                    int delId = Integer.parseInt(request.getParameter("subject_id"));
                    subjectDAO.deleteSubject(delId);
                    response.sendRedirect("AddSubjectServlet?action=list");
                    break;

                default:
                    response.sendRedirect("AddSubjectServlet?action=list");
            }
        } catch (Exception e) {
            throw new ServletException("Error in doGet: " + e.getMessage(), e);
        }
    }

    /**
     * Handles POST requests for inserting or updating subjects
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = request.getParameter("subject_id") != null && !request.getParameter("subject_id").isEmpty()
                    ? Integer.parseInt(request.getParameter("subject_id"))
                    : 0;

            String name = request.getParameter("subject_name");
            String code = request.getParameter("subject_code");
            String type = request.getParameter("subject_type");
            String className = request.getParameter("class_name");

            String fullMarksStr = request.getParameter("full_marks");
            Integer fullMarks = (fullMarksStr == null || fullMarksStr.isEmpty())
                    ? null
                    : Integer.parseInt(fullMarksStr);

            int teacherId = Integer.parseInt(request.getParameter("subject_teacher_id"));

            Subject subject = new Subject(id, name, code, type, className, fullMarks, teacherId);

            if (id > 0) {
                subjectDAO.updateSubject(subject);
            } else {
                subjectDAO.insertSubject(subject);
            }

            response.sendRedirect("AddSubjectServlet?action=list");

        } catch (Exception e) {
            throw new ServletException("Error in doPost: " + e.getMessage(), e);
        }
    }
}
