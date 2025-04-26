

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.IERP_FINAL.dao.ClassSubjectStudentDAO;
import com.IERP_FINAL.dao.SubjectDAO;
import com.IERP_FINAL.models.ClassSubjectStudent;
import com.IERP_FINAL.models.Subject;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/views/admin/ClassSubjectStudentServlet")
public class ClassSubjectStudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public ClassSubjectStudentDAO dao;
    public SubjectDAO subjectDAO;
    @Override
    public void init() throws ServletException {
        dao = new ClassSubjectStudentDAO();
        subjectDAO = new SubjectDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
	            case "list":
	                List<Map<String, Object>> list = dao.getAll(); // Returns List<Map<String, Object>>
	                request.setAttribute("cssList", list); // Set the list as an attribute
	                List<Subject> subjects = subjectDAO.getAllSubjects();
                    request.setAttribute("subjectList", subjects);
	                request.getRequestDispatcher("subject_and_student.jsp").forward(request, response); // Forward to JSP
	                break;

                case "edit":
                    String className = request.getParameter("class_name");
                    String rollNo = request.getParameter("roll_no");
                    int studentId = Integer.parseInt(request.getParameter("student_id"));
                    ClassSubjectStudent entry = dao.get(rollNo, className, studentId);
                    request.setAttribute("entry", entry);
                    request.getRequestDispatcher("edit_class_subject_student.jsp").forward(request, response);
                    break;

                case "delete":
                    String delClass = request.getParameter("class_name");
                    String rollNo1 = request.getParameter("roll_no");
                    int delStu = Integer.parseInt(request.getParameter("student_id"));
                    dao.delete(rollNo1, delClass, delStu);
                    response.sendRedirect("ClassSubjectStudentServlet?action=list");
                    break;

                default:
                    response.sendRedirect("ClassSubjectStudentServlet?action=list");
            }
        } catch (Exception e) {
            throw new ServletException("Error in doGet: " + e.getMessage(), e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        ClassSubjectStudentDAO dao = new ClassSubjectStudentDAO(); // ensure DAO is initialized

        try {
            String className = request.getParameter("class_name");
            
         
            switch (action) {
                
            case "add":
                String[] rollNos = request.getParameter("roll_no").split(",");
                String[] studentIds = request.getParameter("student_ids").split(",");
                List<ClassSubjectStudent> bulkEntries = new ArrayList<>();

                for (int i = 0; i < studentIds.length; i++) {
                    int sid = Integer.parseInt(studentIds[i].trim());
                    String rollNo = className + rollNos[i].trim();

                    bulkEntries.add(new ClassSubjectStudent(rollNo, className, sid));
                }

                dao.addBulk(bulkEntries); // ✅ Passing the list of students
                break;



                case "update":
                	String rollNo2 = request.getParameter("roll_no"); 
                    int updateStudentId = Integer.parseInt(request.getParameter("student_id"));
                    ClassSubjectStudent updateEntry = new ClassSubjectStudent(rollNo2, className,  updateStudentId);
                    dao.update(updateEntry);
                    break;

                default:
                    throw new IllegalArgumentException("Invalid action: " + action);
            }

            response.sendRedirect("ClassSubjectStudentServlet?action=list");

        } catch (Exception e) {
            throw new ServletException("Error in doPost: " + e.getMessage(), e);
        }
    }

}
