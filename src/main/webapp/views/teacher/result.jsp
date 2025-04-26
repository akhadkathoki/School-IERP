<%@ page import="com.IERP_FINAL.models.Subject, java.util.*, java.sql.*, com.IERP_FINAL.utils.DBConnection, com.IERP_FINAL.models.StudentAttendance, com.IERP_FINAL.models.StudentMarks" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fetch Student</title>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>

<style>
    .body {
        background-color: #CDD5DB;
    }
    .mainBtnBg {
        background-color: #292648;
    }
    .topic-font {
        color: #292648;
        font-weight: bold;
    }
    .heading-font {
        color: #292648;
        font-weight: bold;
        font-size: 24px;
    }
    .achieveCard {
        background-color: #EBF4FF;
    }
    .announce-card {
        background-color: #EBF4FF;
    }
    .break {
        margin-top: -1px;
    }
</style>

<body class="body">
<%@ include file='staticTeacherComponent.jsp' %>


<%
	String teacherIdParam = request.getParameter("teacher_id");
	String className = request.getAttribute("className") != null 
		    ? (String) request.getAttribute("className") 
		    : "";
	String action = request.getAttribute("action") != null 
		    ? (String) request.getAttribute("action") 
		    : "";
	 String term = request.getAttribute("term") != null 
		        ? (String) request.getAttribute("term") 
		        : "";

		    int year = 0;
		    Object yearObj = request.getAttribute("year");
		    if (yearObj != null) {
		        try {
		            year = Integer.parseInt(yearObj.toString());
		        } catch (NumberFormatException e) {
		            year = 0; // or handle the error appropriately
		        }
		    }
	String subName = java.util.Objects.toString(request.getAttribute("subjectName"), "");

	

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    Set<String> classNames = new HashSet<>();
    Set<String> subjectNames = new HashSet<>();

    try {
        conn = DBConnection.getConnection();
        
        

       
        
        String sql2 = "SELECT DISTINCT class_name FROM classrooms WHERE class_teacher_id = ?";
        stmt = conn.prepareStatement(sql2);
        stmt.setInt(1, teacherId);
        rs = stmt.executeQuery();

        while (rs.next()) {
        	
            classNames.add(rs.getString("class_name"));  
            
            String sql1 = "SELECT DISTINCT subject_name FROM subjects WHERE class_name = ?";
            stmt = conn.prepareStatement(sql1);
            stmt.setString(1, rs.getString("class_name"));
            rs = stmt.executeQuery();

            while (rs.next()) {
                subjectNames.add(rs.getString("subject_name"));            
            }
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

 
%>

<div class="container main p-3 d-flex flex-column justify-content-center align-items-start">
    <br><br>
    <div class="row w-100 d-flex flex-row justify-content-center w-100">   
        <div class="col-12 p-3">
            <div class="main mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
                <h1 class="heading-font text-right fs-4">Fetch Students</h1>
                <hr class="border border-secondary border-1 mb-4 w-100 break">
                <form class="row  w-100" action="ResultServlet" method="get" id="fetchForm">
                    <input type="hidden" name="teacherId" value="<%= teacherId %>">
					                    <!-- Action Dropdown -->
					<div class="form-group col-12 col-md-6 col-lg-4 mb-3">
					    <label for="action" class="topic-font fw-bold">Action</label>
					    <select class="form-control shadow-sm rounded" name="action" id="action" required>
					        <option value="">Select Action</option>
					        <option value="insert">Insert</option>
					        <option value="view">View</option>
					    </select>
					</div>
                    <div class="form-group col-12 col-md-6 col-lg-4 mb-3">
                        <label for="class_name" class="topic-font fw-bold">Class Name:</label>
                        <select class="form-control shadow-sm rounded" id="class_name" name="class_name" required>
                            <option value="">Select Class</option>
                            <%
                                for(String cname : classNames) {
                            %>
                            <option value="<%= cname %>"><%= cname %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                    
					<div class="form-group col-12 col-md-6 col-lg-4 mb-3">
                        <label for="year" class="topic-font fw-bold">Year</label>
                        <input type="number" class="form-control shadow-sm rounded" name="year" id="year" placeholder="Enter the Month" >
                    </div>
					<div class="form-group col-12 col-md-6 col-lg-4 mb-3">
					    <label for="term" class="topic-font fw-bold">Term</label>
					    <select class="form-control shadow-sm rounded" name="term" id="term" required>
					        <option value="">---Select Term---</option>
					        <option value="First Term">First Term</option>
					        <option value="Second Term">Second Term</option>
					        <option value="Third Term">Third Term</option>
					    </select>
					</div>

                    <div class="d-flex flex-row justify-content-end">
                        <button type="submit" class="btn btn-sm text-white px-3" style="background-color: #292648;">Fetch</button>
                    </div>
                    
                </form>
            </div>	       
        </div>
    </div>

    <div class="container main mt-4 p-3 shadow-sm mb-3 rounded bg-white d-flex flex-column justify-content-center align-items-start">
        <div class="w-100 mb-2 d-flex flex-row justify-content-between">
            <h1 class="heading-font text-right fs-2"><%= className %> Attendance</h1>
        </div>
        <hr class="border border-dark border-1 mb-4 w-100 break">
        <form class="w-100 table-responsive" action="ResultServlet" method="post">
        	<input type="hidden" name="action" value="<%= action %>">
        	<input type="hidden" name="term" value="<%= term %>">
        	<input type="hidden" name="className" value="<%= className %>">
        	<input type="hidden" name="year" value="<%= year %>">
        	<input type="hidden" name="teacherId" value="<%= teacherId %>">
			
			<% if("view".equals(action)){ %>
				
	<table class="table table-hover">
    <thead>
      <tr>
        <th class="text-center" style="color: white; background-color: #292648">Student ID</th>
        <th class="text-center" style="color: white; background-color: #292648">Class</th>
        <th class="text-center" style="color: white; background-color: #292648">Subject</th>
        <th class="text-center" style="color: white; background-color: #292648">Full Marks</th>
        <th class="text-center" style="color: white; background-color: #292648">Marks</th>
        <th class="text-center" style="color: white; background-color: #292648">Percentage</th>
        <th class="text-center" style="color: white; background-color: #292648">Grade</th>
        <th class="text-center" style="color: white; background-color: #292648">Term</th>
        <th class="text-center" style="color: white; background-color: #292648">Academic Year</th>
      </tr>
    </thead>
    <tbody>
      <%
        // Retrieve the list of StudentMarks from the request
        Object obj = request.getAttribute("result");
        List<StudentMarks> allStudentMarks = null;

        if (obj instanceof List<?>) {
            allStudentMarks = (List<StudentMarks>) obj;
        }

        if (allStudentMarks != null) {
            for (StudentMarks studentMark : allStudentMarks) {
      %>
          <tr>
            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= studentMark.getStudentId() %></td>
            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= studentMark.getClassName() %></td>
            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= studentMark.getSubjectName() %></td>
            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= studentMark.getFullMarks() %></td>
            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= studentMark.getMarks() %></td>
            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= studentMark.getPercentage() %> %</td>
            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= studentMark.getGrade() %></td>
            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= studentMark.getTerm() %></td>
            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= studentMark.getAcademicYear() %></td>
          </tr>
      <%
            }
        } else {
      %>
          <tr>
            <td colspan="11" class="text-center" style="background-color:#f9f9f9; color: #555;">
              No student marks records available.
            </td>
          </tr>
      <%
        }
      %>
    </tbody>
</table>



			
			
			<%}else{ %>
			
            <table class="table table-hover">
                <thead>
                   <tr>
                   		<th class="text-center" style="color: white; background-color: #292648">Student ID</th>
				            <th class="text-center" style="color: white; background-color: #292648">Roll No</th>
				            <th class="text-center" style="color: white; background-color: #292648">Name</th>
				            <th class="text-center" style="color: white; background-color: #292648">Class</th>
				          <%
							    Object obj = request.getAttribute("subjectList");
							    List<Map<String, String>> subjectList = null;
							
							    if (obj instanceof List<?>) {
							        subjectList = (List<Map<String, String>>) obj;
							    }
							
							    if (subjectList != null) {
							        for (Map<String, String> sub : subjectList) {
							%>
							    <th class="text-center" style="color: white; background-color: #292658">Full Marks</th>
							    <th class="text-center" style="color: white; background-color: #292658"><%= sub.get("subjectName") %></th>
							<%
							        }
							    }
							%>

				        </tr>

                </thead>
                <tbody>
             		 <%						
             		List<StudentMarks> studentList = (List<StudentMarks>) request.getAttribute("studentList");
             	    if (studentList != null) {
             	        for (StudentMarks student : studentList) {
                    %>
                    <tr>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getStudentId() %>
                            <input type="hidden" name="studentId_2" value="<%= student.getStudentId() %>">
                        </td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getRollNo() %>
                            <input type="hidden" name="rollNo_2" value="<%= student.getRollNo() %>">
                        </td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getStudentName() %>
                            <input type="hidden" name="fullName_2" value="<%= student.getStudentName() %>">
                        </td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getClassName() %>
                        	<input type="hidden" name="parentName_2" value="<%= student.getClassName() %>">
                        </td>
                        
                         <%
						    // Retrieve the subject list from the request
						    Object obj3 = request.getAttribute("subjectList");
						    List<Map<String, String>> subjectList1 = null;
						
						    // Check if the object is an instance of List
						    if (obj3 instanceof List<?>) {
						        subjectList1 = (List<Map<String, String>>) obj3;
						    }
						
						    // If subject list is not null, iterate over each subject
						    if (subjectList1 != null) {
						        for (Map<String, String> sub1 : subjectList1) {
						%>

						    <td class="text-center align-middle" style="background-color:#EBF4FC;">
						        <input type="hidden" name="subjectId_2" value="<%= sub1.get("subjectId") %>"> <!-- Use the key for subjectId -->
						        <input type="hidden" name="subjectName_2" value="<%= sub1.get("subjectName") %>"> <!-- Use the key for subjectId -->
						        <input type="number" class="form-control rounded" style="width: 100px" name="full_marks" />
						    </td>
						
						    <!-- Second TD for Actual Marks -->
						    <td class="text-center align-middle" style="background-color:#EBF4FC;">
						        <input type="number" class="form-control rounded" style="width: 100px" name="actual_marks" />
						    </td>

						<%
						        }
						    }
						%>
					

                       
                    </tr>
                    
                   <% }} }%>
                </tbody>
            </table>
            <div class="d-flex flex-row justify-content-end">
                <button type="submit" class="btn btn-sm text-white px-3" style="background-color: #292648;">Save</button>
            </div>
        </form>
    </div>
</div>

<script>
	



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
