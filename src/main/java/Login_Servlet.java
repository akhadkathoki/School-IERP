

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Login_Servlet
 */
@WebServlet("/Login_Servlet")
public class Login_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_Servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String role = request.getParameter("role");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		switch (role) {
	    case "student":
	        response.sendRedirect("views/student/studentDashboard.jsp");
	        break;
	    case "teacher":
	        request.getRequestDispatcher("/WEB-INF/view/teacher/teacherDashboard.jsp").forward(request, response);
	        break;
	    case "parent":
	        request.getRequestDispatcher("/WEB-INF/view/parent/parentDashboard.jsp").forward(request, response);
	        break;
	    case "admin":
	        request.getRequestDispatcher("/WEB-INF/view/admin/adminDashboard.jsp").forward(request, response);
	        break;
	    default:
	        response.sendRedirect("index.jsp?error=invalidRole");
	        break;
	}


	}

}
