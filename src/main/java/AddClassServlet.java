import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import com.IERP_FINAL.dao.ClassroomDAO;
import com.IERP_FINAL.models.Classroom;

@WebServlet("/views/admin/AddClassServlet")
public class AddClassServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ClassroomDAO classroomDAO;

    public void init() {
        classroomDAO = new ClassroomDAO();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
    
        try {
            switch (action) {
                case "edit":
                    getClassByNameForEdit(request, response);
                    break;
                case "delete":
                    deleteClassroom(request, response);
                    break;
                case "list":
                    listClassrooms(request, response);
                	break;
                default:
                    listClassrooms(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "insert":
                    insertClassroom(request, response);
                    break;
                case "update":
                    updateClassroom(request, response);
                    break;
                default:
                    listClassrooms(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void insertClassroom(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {

        String classLevelParam = request.getParameter("classLevel");
        String section = request.getParameter("section");
        String teacherIdParam = request.getParameter("classTeacherId");



        if (classLevelParam == null || teacherIdParam == null || section == null) {
            response.getWriter().println("❌ Missing form fields. Please check input.");
            return;
        }

        int classLevel = Integer.parseInt(classLevelParam);
        int classTeacherId = Integer.parseInt(teacherIdParam);

        Classroom classroom = new Classroom();
        classroom.setClassName(classLevel + "-" + section);
        classroom.setClassLevel(classLevel);
        classroom.setSection(section);
        classroom.setClassTeacherId(classTeacherId);

        classroomDAO.insertClassroom(classroom);
        response.sendRedirect("AddClassServlet?action=list");
    }

    private void listClassrooms(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<Classroom> classroomList = classroomDAO.getAllClassrooms();
        request.setAttribute("classroomList", classroomList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("add_class.jsp");
        dispatcher.forward(request, response);
    }

    private void getClassByNameForEdit(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        String className = request.getParameter("className");
        System.out.print(className);
        Classroom classroom = classroomDAO.getClassroomById(className);
        request.setAttribute("classroom", classroom);
        List<Classroom> classroomList = classroomDAO.getAllClassrooms();
        request.setAttribute("classroomList", classroomList);
        request.getRequestDispatcher("classroom_edit.jsp").forward(request, response);
    }

    private void updateClassroom(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String className = request.getParameter("className");
        int classLevel = Integer.parseInt(request.getParameter("classLevel"));
        String section = request.getParameter("section");
        int classTeacherId = Integer.parseInt(request.getParameter("classTeacherId"));

        Classroom classroom = new Classroom();
        classroom.setClassName(className);
        classroom.setClassLevel(classLevel);
        classroom.setSection(section);
        classroom.setClassTeacherId(classTeacherId);

        classroomDAO.updateClassroom(classroom);
        
        try {
        	RequestDispatcher dispatcher = request.getRequestDispatcher("AddClassServlet?action=list");
			dispatcher.forward(request, response);
		} catch (ServletException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

    private void deleteClassroom(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        String className = request.getParameter("className");
        classroomDAO.deleteClassroom(className);
        response.sendRedirect("AddClassServlet?action=list");
    }
}
