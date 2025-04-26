

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import com.IERP_FINAL.dao.HolidayDAO;
import com.IERP_FINAL.models.Holiday;

/**
 * Servlet implementation class HolidayServlet
 */
@WebServlet("/views/admin/HolidayServlet")
public class HolidayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private HolidayDAO dao = new HolidayDAO();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HolidayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String action = request.getParameter("action");

	        try {
	            if (action == null) {
	            	 List<Holiday> list = dao.getAllHolidays();
	            	    request.setAttribute("holidayList", list);

	            	    // Select the first row by default if list is not empty
	            	    if (!list.isEmpty()) {
	            	        request.setAttribute("holiday", list.get(0));
	            	    }

	            	    RequestDispatcher dispatcher = request.getRequestDispatcher("holidays_list.jsp");
	            	    dispatcher.forward(request, response);            
                
	            } else if ("singleView".equals(action)) {
	                int id = Integer.parseInt(request.getParameter("id"));
	                List<Holiday> list = dao.getAllHolidays();
	                
	                Holiday singleholiday = dao.getHolidayById(id);
	                request.setAttribute("holiday", singleholiday);
	                request.setAttribute("holidayList", list);
	                RequestDispatcher dispatcher = request.getRequestDispatcher("holidays_list.jsp");
	                dispatcher.forward(request, response);	 
	       
	            } else if ("delete".equals(action)) {
	                int id = Integer.parseInt(request.getParameter("id"));
	                dao.deleteHoliday(id);
	                response.sendRedirect("HolidayServlet");
	                
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		 String action = request.getParameter("action");

		 
		 if (action == null) {
			    System.out.println("Action is null");
			    for (String param : request.getParameterMap().keySet()) {
			        System.out.println(param + ": " + request.getParameter(param));
			    }
			}

	        try {
	            if ("Add Holiday".equals(action)) {
	                Holiday h = new Holiday();
	                h.setName(request.getParameter("name"));
	                System.out.println(h.getName());
	                h.setFromDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fromDate")));
	                h.setToDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("toDate")));
	                h.setDescription(request.getParameter("description"));
	                dao.addHoliday(h);
	                response.sendRedirect("HolidayServlet");
	                
	            } else if ("Update Holiday".equals(action)) {
	            	
	                Holiday h = new Holiday();
	                h.setId(Integer.parseInt(request.getParameter("id")));
	                h.setName(request.getParameter("name"));
	                h.setFromDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("fromDate")));
	                h.setToDate(new SimpleDateFormat("yyyy-MM-dd").parse(request.getParameter("toDate")));
	                h.setDescription(request.getParameter("description"));
	                dao.updateHoliday(h);
	                response.sendRedirect("HolidayServlet");
	                
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
	}

}
