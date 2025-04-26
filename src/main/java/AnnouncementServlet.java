
import com.IERP_FINAL.dao.AnnouncementDAO;
import com.IERP_FINAL.models.Announcement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/views/admin/AnnouncementServlet")
public class AnnouncementServlet extends HttpServlet {
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
                    
                    RequestDispatcher dispatcher = request.getRequestDispatcher("add_announcement.jsp");
                    dispatcher.forward(request, response);
                         
                    break;

                case "edit":
                    int id = Integer.parseInt(request.getParameter("announcement_id"));
                    Announcement announcement = announcementDAO.getAnnouncementById(id);
                    request.setAttribute("announcement", announcement);
                    request.getRequestDispatcher("edit_announcement.jsp").forward(request, response);
                    break;

                case "delete":
                    int delId = Integer.parseInt(request.getParameter("announcement_id"));
                    announcementDAO.deleteAnnouncement(delId);
                    response.sendRedirect("AnnouncementServlet?action=list");
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            int id = request.getParameter("announcement_id") != null && !request.getParameter("announcement_id").isEmpty()
                    ? Integer.parseInt(request.getParameter("announcement_id"))
                    : 0;

            String heading = request.getParameter("heading");
            String date = request.getParameter("date");
            String time = request.getParameter("time");
            String description = request.getParameter("description");

            Announcement announcement = new Announcement(id, heading, date, time, description);

            if (id > 0) {
                announcementDAO.updateAnnouncement(announcement);
            } else {
                announcementDAO.insertAnnouncement(announcement);
            }

            response.sendRedirect("AnnouncementServlet?action=list");

        } catch (Exception e) {
            throw new ServletException("Error in doPost: " + e.getMessage(), e);
        }
    }
}
