

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

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

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String role = request.getParameter("role");
		String username = request.getParameter("Login_username");
		String password = request.getParameter("Login_password");
		
		try {
				Connection conn = DBConnection.getConnection();
				
				switch (role) {
			    case "student":
			    	Integer studentId = validateUser(conn, username, password, "students");

			    	if (studentId != null) {
			    	    HttpSession session = request.getSession(false); // Check if session already exists

			    	    if (session == null) {
			    	        session = request.getSession(); // Create a new session if not exists
			    	    }

			    	    session.setAttribute("username", username);
			    	    session.setAttribute("role", "student");
			    	    session.setAttribute("control", "view");
			    	    session.setAttribute("studentId", studentId); // ✅ Store student ID in session

			    	    // Ensure session is set properly before redirection
			    	    if (session.getAttribute("username") != null) {
			    	        response.sendRedirect("views/student/studentDashboard.jsp");
			    	    } else {
			    	        response.sendRedirect("index.jsp?error=sessionError");
			    	    }
			    	} else {
			    	    response.sendRedirect("index.jsp?error=invalidStudent");
			    	}

//			        response.sendRedirect("views/student/studentDashboard.jsp");
			        break;
			    case "teacher":
			    	Integer teacherId = validateUser(conn, username, password, "teachers");

			    	if (teacherId != null) {
			    	    HttpSession session = request.getSession(false); // Check if session already exists

			    	    if (session == null) {
			    	        session = request.getSession(); // Create a new session if not exists
			    	    }

			    	    session.setAttribute("username", username);
			    	    session.setAttribute("role", "teacher");
			    //	    session.setAttribute("control", "view");
			    	    session.setAttribute("teacherId", teacherId); // ✅ Store student ID in session

			    	    // Ensure session is set properly before redirection
			    	    if (session.getAttribute("username") != null) {
			    	        response.sendRedirect("views/teacher/teacherDashboard.jsp");
			    	    } else {
			    	        response.sendRedirect("index.jsp?error=sessionError");
			    	    }
			    	} else {
			    	    response.sendRedirect("index.jsp?error=invalidTeacher");
			    	}
			        break;
			    case "parent":
			    	Integer parentId = validateUser(conn, username, password, "parentsguardians");

			    	if (parentId != null) {
			    	    HttpSession session = request.getSession(false); // Check if session already exists

			    	    if (session == null) {
			    	        session = request.getSession(); // Create a new session if not exists
			    	    }

			    	    session.setAttribute("username", username);
			    	    session.setAttribute("role", "parent");
			    //	    session.setAttribute("control", "view");
			    	    session.setAttribute("parentId", parentId); // ✅ Store student ID in session

			    	    // Ensure session is set properly before redirection
			    	    if (session.getAttribute("username") != null) {
			    	        response.sendRedirect("views/parent/parentDashboard.jsp");
			    	    } else {
			    	        response.sendRedirect("index.jsp?error=sessionError");
			    	    }
			    	} else {
			    	    response.sendRedirect("index.jsp?error=invalidParent");
			    	}			        
			    	break;
			    case "admin":
			        int adminId = validateUser(conn, username, password, "admins");
			        if (adminId != -1) {
			            HttpSession session = request.getSession(false); // Check if session already exists

			            if (session == null) {
			                session = request.getSession(); // Create a new session if not exists
			            }

			            session.setAttribute("username", username);
			            session.setAttribute("role", "admin");
			    	    session.setAttribute("control", "edit");
			            session.setAttribute("admin_id", adminId); // Store admin_id for later use

			            // Ensure session is set properly before redirection
			            if (session.getAttribute("username") != null) {
			                response.sendRedirect("views/admin/adminDashboard.jsp");
			            } else {
			                response.sendRedirect("index.jsp?error=sessionError");
			            }
			        } else {
			            response.sendRedirect("index.jsp?error=invalidAdmin");
			        }
			        break;

			    default:
			        response.sendRedirect("index.jsp?error=invalidRole");
			        break;
			}
		
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
    // Method to validate user login credentials based on the table
	private Integer validateUser(Connection conn, String username, String password, String tableName) throws Exception {
	    String query = "SELECT * FROM " + tableName + " WHERE username = ? AND password = ?";
	    PreparedStatement ps = conn.prepareStatement(query);

	    ps.setString(1, username);
	    ps.setString(2, password);

	    ResultSet rs = ps.executeQuery();

	    if (rs.next()) {
	        if (tableName.equals("students")) {
	            return rs.getInt("student_id");
	            
	        } else if (tableName.equals("admins")) {
	            return rs.getInt("admin_id");
	        }else if(tableName.equals("teachers")) {
	        	return rs.getInt("teacher_id");
	        }else if(tableName.equals("parent")) {
	        	return rs.getInt("guardian_id");
	        }
	    }

	    return null;
	}

}
