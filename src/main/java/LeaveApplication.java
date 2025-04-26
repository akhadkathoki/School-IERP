

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.IERP_FINAL.dao.AchievementDAO;
import com.IERP_FINAL.dao.LeaveApplicationDAO;
import com.IERP_FINAL.models.Achievement;
import com.IERP_FINAL.models.LeaveApplicationModel;

/**
 * Servlet implementation class AchievementServlet
 */
@MultipartConfig
@WebServlet("/views/student/LeaveApplication")
public class LeaveApplication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LeaveApplication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
  
            case "add":
                addLeave(request, response);
                break;

            case "delete":
                deleteAchievement(request, response);
                break;
            default:
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid POST action");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "list":
                listLeaveApplication(request, response);
                break;
            
            default:
            	listLeaveApplication(request, response);
        }
    }
    
    private void addLeave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        LeaveApplicationModel leave = extractLeaveFromRequest(request, false);
        HttpSession session = request.getSession(false);
        int studentId = (int) session.getAttribute("studentId");

        leave.setStudentId(studentId); // set studentId into the leave object

        boolean success = LeaveApplicationDAO.insertLeaveApplication(leave);

        if (success) {
            response.sendRedirect("LeaveApplication?action=list&id=" + studentId);
        } else {
            response.sendRedirect("leave_error.jsp");
        }
    }


 

    private void deleteAchievement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int achievementId = Integer.parseInt(request.getParameter("achievementId"));

        boolean success = AchievementDAO.deleteAchievement(achievementId);

        if (success) {
            response.sendRedirect("achievement_deleted.jsp");
        } else {
            response.sendRedirect("achievement_error.jsp");
        }
    }

    private void listLeaveApplication(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int studentId = Integer.parseInt(request.getParameter("id"));

            // Correct way to fetch the list from DAO
            List<LeaveApplicationModel> leaveApplications = LeaveApplicationDAO.getLeaveApplicationsByStudentId(studentId);

            // Debug to check data
            if (leaveApplications != null && !leaveApplications.isEmpty()) {
                System.out.println("LeaveApplications size: " + leaveApplications.size());
                System.out.println("First application ID: " + leaveApplications.get(0).getId()); // Make sure `getId()` exists
            } else {
                System.out.println("No leave applications found for student ID: " + studentId);
            }

            // Set list in request scope
            request.setAttribute("leaveApplications", leaveApplications);

            // Forward to JSP
            request.getRequestDispatcher("/views/student/leave_application.jsp").forward(request, response);
            
        } catch (NumberFormatException e) {
            System.out.println("Invalid student ID format");
            response.sendRedirect("error.jsp"); // Or handle it properly
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.jsp");
        }
    }



    private void loadAchievement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int achievementId = Integer.parseInt(request.getParameter("achievementId"));
        HttpSession session = request.getSession(false);
            int studentId = (int) session.getAttribute("studentId");
            // Use studentId as needed
     
        Achievement achievement = AchievementDAO.getAchievementAchieveById(achievementId, studentId);

        request.setAttribute("achievement", achievement);
        RequestDispatcher dispatcher = request.getRequestDispatcher("achievement_form.jsp");
        dispatcher.forward(request, response);
    }

    private LeaveApplicationModel extractLeaveFromRequest(HttpServletRequest request, boolean isUpdate) throws IOException, ServletException {
    	LeaveApplicationModel leaves = new LeaveApplicationModel();

    	int studentId = Integer.parseInt(request.getParameter("id"));
    
    	leaves.setStudentId(studentId);

    	// Set leave type and subject
    	leaves.setLeaveType(request.getParameter("leaveType"));
    	leaves.setSubject(request.getParameter("subject"));

    	// Set date fields (convert from String to java.sql.Date)
    	leaves.setFromDate(Date.valueOf(request.getParameter("fromDate")));
    	leaves.setToDate(Date.valueOf(request.getParameter("toDate")));

    	// Set description
    	leaves.setDescription(request.getParameter("description"));

  

    return leaves;
}

}



