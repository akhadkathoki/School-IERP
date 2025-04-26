
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.IERP_FINAL.dao.AttendanceDAO;
import com.IERP_FINAL.models.StudentAttendance;
import com.IERP_FINAL.utils.DBConnection;

@WebServlet("/views/teacher/AttendanceControllerServlet")
public class AttendanceControllerServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AttendanceControllerServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String className = request.getParameter("attClassName");

        try (Connection conn = DBConnection.getConnection()) {
            AttendanceDAO attendanceDAO = new AttendanceDAO(conn);

            switch (action) {
                case "list":
                    List<StudentAttendance> attendanceList = attendanceDAO.getAllAttendance(className);
                    request.setAttribute("attendanceList", attendanceList);
                    RequestDispatcher dispatcher = request.getRequestDispatcher("attendance_list.jsp");
                    dispatcher.forward(request, response);
                    break;

                case "edit":
                    String month = request.getParameter("attMonth");
                    List<StudentAttendance> attendanceRecords = attendanceDAO.getAttendanceByMonthAndClass(month, className);
                    request.setAttribute("attendanceRecords", attendanceRecords);
                    request.getRequestDispatcher("select_class.jsp").forward(request, response);
                    break;

                default:
                    response.sendRedirect("AttendanceControllerServlet?action=list&attClassName=" + className);
                    break;
            }
        } catch (Exception e) {
            throw new ServletException("Error in doGet: " + e.getMessage(), e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int totalClass = Integer.parseInt(request.getParameter("attTotalClass"));
            String className = request.getParameter("attClassName");
            String subjectName = request.getParameter("attSubject_name");
            String month = request.getParameter("attMonth");
            int teacherId = Integer.parseInt(request.getParameter("attTeacherId"));

            String[] studentIds = request.getParameterValues("studentId_2");
            String[] rollNos = request.getParameterValues("rollNo_2");
            String[] fullNames = request.getParameterValues("fullName_2");
            String[] parentNames = request.getParameterValues("parentName_2");
            String[] totalPresents = request.getParameterValues("totalPresent");

            try (Connection conn = DBConnection.getConnection()) {
                AttendanceDAO dao = new AttendanceDAO(conn);

                for (int i = 0; i < studentIds.length; i++) {
                    int studentId = Integer.parseInt(studentIds[i]);
                    int totalPresent = Integer.parseInt(totalPresents[i]);
                    int absent = totalClass - totalPresent;
                
                    StudentAttendance sa = new StudentAttendance();
                    sa.setStudentId(studentId);
                    sa.setRollNo(rollNos[i]);
                    sa.setName(fullNames[i]);
                    sa.setParentName(parentNames[i]);
                    sa.setTotalPresent(totalPresent);
                    sa.setClassName(className);
                    sa.setSubjectName(subjectName);
                    sa.setMonth(month);
                    sa.setTeacherId(teacherId);
                    sa.setTotalClass(totalClass);
                    sa.setTotalAbsent(absent);

                    if (dao.attendanceExists(studentId, month)) {
                        dao.updateAttendance(sa);
                    } else {
                        List<StudentAttendance> tempList = new ArrayList<>();
                        tempList.add(sa);
                        dao.saveAttendance(tempList);
                    }
                }

                response.sendRedirect("select_class.jsp");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }
}
