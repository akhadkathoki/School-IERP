
import com.IERP_FINAL.dao.AnnouncementDAO;
import com.IERP_FINAL.models.Announcement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/views/teacher/TAnnouncementServlet")
public class TAnnouncementServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AnnouncementDAO announcementDAO;

    @Override
    public void init() throws ServletException {
        Connection conn = DBConnection.getConnection();
        announcementDAO = new AnnouncementDAO(conn);
    }

    /**
     * Handles GET requests: list, edit, delete
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action) {
                case "list":
                	
                    List<Announcement> announcements = announcementDAO.getAllAnnouncements();
                    //System.out.println(announcements);
                    request.setAttribute("announcementList", announcements);
                    
                    RequestDispatcher dispatcher = request.getRequestDispatcher("teacherDashboard.jsp");
                    dispatcher.forward(request, response);
                         
                    break;



                default:
                    response.sendRedirect("AnnouncementServlet?action=list");
                    break;
            }
        } catch (Exception e) {
            throw new ServletException("Error in doGet: " + e.getMessage(), e);
        }
    }

    /**
     * Handles POST requests: insert and update
     */

}
