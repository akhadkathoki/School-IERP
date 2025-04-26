

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
import java.sql.SQLException;
import java.util.List;

import com.IERP_FINAL.dao.AchievementDAO;
import com.IERP_FINAL.models.Achievement;

/**
 * Servlet implementation class AchievementServlet
 */
@MultipartConfig
@WebServlet("/views/student/AchievementServlet")
public class AchievementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AchievementServlet() {
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
                addAchievement(request, response);
                break;
            case "update":
                updateAchievement(request, response);
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
                listAchievements(request, response);
                break;
            case "edit":
                loadAchievement(request, response);
                break;
            
            default:
                listAchievements(request, response);
        }
    }
    
    private void addAchievement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Achievement achievement = extractAchievementFromRequest(request, false);
        HttpSession session = request.getSession(false);
        int studentId = (int) session.getAttribute("studentId");
        // Use studentId as needed
        boolean success = AchievementDAO.insertAchievement(achievement);

        if (success) {
            response.sendRedirect("AchievementServlet?action=list&id=" + studentId);
        } else {
            response.sendRedirect("achievement_error.jsp");
        }
    }

    private void updateAchievement(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Achievement achievement = extractAchievementFromRequest(request, true);
        int achievementId = Integer.parseInt(request.getParameter("achievementId"));
        achievement.setAchievementId(achievementId);
        boolean success = AchievementDAO.updateAchievement(achievement);
        int studentId1 = achievement.getStudentId();
        if (success) {
            response.sendRedirect("AchievementServlet?action=list&id=" + studentId1);
        } else {
            response.sendRedirect("achievement_error.jsp");
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

    private void listAchievements(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int studentId = Integer.parseInt(request.getParameter("id"));

    	List<Achievement> achievements;
		try {
			achievements = AchievementDAO.getAchievementById(studentId);
			// Set data to request attribute
        request.setAttribute("achievements", achievements);

        // Forward to the JSP page
        request.getRequestDispatcher("achievements.jsp").forward(request, response);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("achievements.jsp");
//        dispatcher.forward(request, response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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

    private Achievement extractAchievementFromRequest(HttpServletRequest request, boolean isUpdate) throws IOException, ServletException {
    Achievement achievement = new Achievement();

    int studentId =  (int) Integer.parseInt(request.getParameter("id"));

    achievement.setStudentId(studentId);
    

    achievement.setActivityType(request.getParameter("activityType"));
    achievement.setTitle(request.getParameter("title"));
    achievement.setOrganization(request.getParameter("organization"));

    // Handle numberOfDays
    String numberOfDaysParam = request.getParameter("numberOfDays");
    if (numberOfDaysParam == null || numberOfDaysParam.trim().isEmpty()) {
        achievement.setNumberOfDays(0); // or throw error depending on requirement
    } else {
        try {
            achievement.setNumberOfDays(Integer.parseInt(numberOfDaysParam.trim()));
        } catch (NumberFormatException e) {
            throw new IllegalArgumentException("Invalid numberOfDays: must be a number.");
        }
    }

    achievement.setFromDate(request.getParameter("fromDate"));
    achievement.setToDate(request.getParameter("toDate"));
    achievement.setDescription(request.getParameter("description"));

    Part filePart = request.getPart("testimonialImage");
    if (filePart != null && filePart.getSize() > 0) {
        InputStream inputStream = filePart.getInputStream();
        byte[] imageBytes = inputStream.readAllBytes();
        achievement.setTestimonialImage(imageBytes);
    } else if (!isUpdate) {
        achievement.setTestimonialImage(null); // Only null if insert and no file
    }

    return achievement;
}

}



