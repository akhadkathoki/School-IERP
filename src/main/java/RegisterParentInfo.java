

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.util.List;

import com.IERP_FINAL.dao.ParentGuardianDAOImpl;
import com.IERP_FINAL.models.ParentGuardian;

@WebServlet("/views/admin/RegisterParentInfo")
public class RegisterParentInfo extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ParentGuardianDAOImpl dao;

    public RegisterParentInfo() {
        super();
    }

    @Override
    public void init() throws ServletException {
        try {
            dao = new ParentGuardianDAOImpl();
        } catch (Exception e) {
            throw new ServletException("DB Connection error: " + e.getMessage());
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String action = request.getParameter("action");
    	if (action == null) action = "list";
    	System.out.println("Action received: " + action);  // Log the action

    	try {
    	    switch (action) {
    	        case "edit":
    	            showEditForm(request, response);
    	            break;
    	        default:
    	            listGuardians(request, response);
    	            break;
    	    }
    	} catch (Exception e) {
    	    e.printStackTrace();
    	    response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Internal server error");
    	

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	 String action = request.getParameter("action");
    	    if (action == null) action = "";

    	    try {
    	        switch (action) {
    	            case "insert":
    	                insertGuardian(request, response);
    	                break;
    	            case "update":
    	                updateGuardian(request, response);
    	                break;
    	            case "delete":
    	                deleteGuardian(request, response);
    	                break;
    	            default:
    	                // redirect to the servlet itself
    	                response.sendRedirect(request.getContextPath() + "/views/admin/RegisterParentInfo?action=list");
    	                break;
    	        }
    	    } catch (Exception e) {
    	        throw new ServletException("POST error: " + e.getMessage());
    	    }
    }

    // ---------------- GET Handlers ----------------

    private void listGuardians(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        List<ParentGuardian> list = dao.getAll();
        request.setAttribute("guardianList", list);
        request.getRequestDispatcher("parent_list.jsp").forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        ParentGuardian guardian = dao.getById(id);
        request.setAttribute("guardian", guardian);
        request.getRequestDispatcher("parentProfile.jsp").forward(request, response);
    }

    // ---------------- POST Handlers ----------------

    private void insertGuardian(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ParentGuardian pg = extractGuardianFromRequest(request);
        
        boolean isInserted = dao.insert(pg); // assume it returns boolean or check some condition

        if (!isInserted) {
            throw new Exception("Failed to insert guardian.");
        }

        response.sendRedirect("parentGuardian");
    }


    private void updateGuardian(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        ParentGuardian pg = extractGuardianFromRequest(request);
        pg.setGuardianId(Integer.parseInt(request.getParameter("id")));
        dao.update(pg);
        response.sendRedirect("parentGuardian?action=list");
    }

    private void deleteGuardian(HttpServletRequest request, HttpServletResponse response)
            throws Exception {
        int id = Integer.parseInt(request.getParameter("id"));
        dao.delete(id);
        response.sendRedirect("parentGuardian?action=list");
    }

    // ---------------- Helper ----------------

    private ParentGuardian extractGuardianFromRequest(HttpServletRequest req) throws Exception {
        ParentGuardian pg = new ParentGuardian();

        // Handle form parameters
        pg.setStudentId(Integer.parseInt(req.getParameter("studentId")));
        pg.setRole(req.getParameter("role"));
        pg.setFullName(req.getParameter("fullName"));
        pg.setGender(req.getParameter("gender"));
        
        pg.setDateOfBirth(java.sql.Date.valueOf(req.getParameter("dateOfBirth")));
        pg.setNationality(req.getParameter("nationality"));
        pg.setContactNumber(req.getParameter("contactNumber"));
        pg.setEmailAddress(req.getParameter("emailAddress"));
        pg.setUsername(req.getParameter("username"));
        pg.setPassword(req.getParameter("password"));
        pg.setPermanentAddress(req.getParameter("permanentAddress"));
        pg.setTemporaryAddress(req.getParameter("temporaryAddress"));
        pg.setCitizenshipNumber(req.getParameter("citizenshipNumber"));
        pg.setCitizenshipIssuePlace(req.getParameter("citizenshipIssuePlace"));
        pg.setCitizenshipIssueDate(java.sql.Date.valueOf(req.getParameter("citizenshipIssueDate")));

        // Handle photo upload
        Part photoPart = req.getPart("photo");
        if (photoPart != null) {
            InputStream photoInputStream = photoPart.getInputStream();
            byte[] photoBytes = new byte[photoInputStream.available()];
            photoInputStream.read(photoBytes);
            pg.setPhoto(photoBytes);
        }

        return pg;
    }

}
