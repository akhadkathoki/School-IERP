<%@ page import="com.IERP_FINAL.models.Subject, java.util.*, java.sql.*, com.IERP_FINAL.utils.DBConnection, com.IERP_FINAL.models.StudentAttendance" %>
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
	String month = java.util.Objects.toString(request.getAttribute("month"), "");
	int totalClass = request.getAttribute("totalClass") != null 
	    ? (int) request.getAttribute("totalClass") 
	    : 0;
	String subName = java.util.Objects.toString(request.getAttribute("subjectName"), "");


	
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    Set<String> classNames = new HashSet<>();
    Set<String> subjectNames = new HashSet<>();

    try {
        conn = DBConnection.getConnection();

        String sql = "SELECT DISTINCT class_name, subject_id, subject_name FROM subjects WHERE subject_teacher_id = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, teacherId);
        rs = stmt.executeQuery();

        while (rs.next()) {
            classNames.add(rs.getString("class_name"));
            subjectNames.add(rs.getString("subject_name"));
            
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
                <form class="row  w-100" action="FetchAttendanceTableServlet" method="get" id="fetchForm">
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
                        <label for="subject_name" class="topic-font fw-bold">Subject Name:</label>
                        <select class="form-control shadow-sm rounded" id="subject_name" name="subject_name" required>
                            <option value="">Select Subject</option>
                            <%
                                for(String sname : subjectNames) {
                            %>
                            <option value="<%= sname %>"><%= sname %></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
					<div class="form-group col-12 col-md-6 col-lg-4 mb-3">
                        <label for="month" class="topic-font fw-bold">Month</label>
                        <input type="month" class="form-control shadow-sm rounded" name="month" id="month" placeholder="Enter the Month" >
                    </div>
                    <div class="form-group col-12 col-md-6 col-lg-4 mb-3">
                        <label for="total_class" class="topic-font fw-bold">Total Classes</label>
                        <input type="number" class="form-control shadow-sm rounded" name="total_class" id="total_class" placeholder="Total class conducted" min="0">
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
        <form class="w-100 table-responsive" action="AttendanceControllerServlet" method="post">
        	<input type="hidden" name="action" value="<%= action %>">
        	<input type="hidden" name="attSubject_name" value="<%= subName %>">
        	<input type="hidden" name="attClassName" value="<%= className %>">
        	<input type="hidden" name="attMonth" value="<%= month %>">
        	<input type="hidden" name="attTeacherId" value="<%= teacherId %>">
        	<input type="hidden" name="attTotalClass" value="<%= totalClass %>">
			
			<% if("view".equals(action)){ %>
				
				<table class="table table-hover">
				    <thead>
				        <tr>
				            <th class="text-center" style="color: white; background-color: #292648">Student ID</th>
				            <th class="text-center" style="color: white; background-color: #292648">Roll No</th>
				            <th class="text-center" style="color: white; background-color: #292648">Name</th>
				            <th class="text-center" style="color: white; background-color: #292648">Parent Name</th>
				            <th class="text-center" style="color: white; background-color: #292648">Class</th>
				            <th class="text-center" style="color: white; background-color: #292648">Subject</th>
				            <th class="text-center" style="color: white; background-color: #292648">Month</th>
				            <th class="text-center" style="color: white; background-color: #292648">Total Classes</th>
				            <th class="text-center" style="color: white; background-color: #292648">Total Present</th>
				            <th class="text-center" style="color: white; background-color: #292648">Total Absent</th>
				            <th class="text-center" style="color: white; background-color: #292648">Attendance %</th>
				        </tr>
				    </thead>
				    <tbody>
				        <%
				        Object obj = request.getAttribute("studentAttendance");
                        List<StudentAttendance> allAttendance = null;

                        if (obj instanceof List<?>) {
                        	allAttendance = (List<StudentAttendance>) obj;
                        }

                        if (allAttendance != null) {
                            for (StudentAttendance attendance : allAttendance) {
				        
				        
				        %>
				        <tr>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getStudentId() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getRollNo() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getName() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getParentName() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getClassName() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getSubjectName() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getMonth() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getTotalClass() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getTotalPresent() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getTotalAbsent() %></td>
				            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= attendance.getAttendancePercent() %> %</td>
				        </tr>
				        <%
				                }
				            } else {
				        %>
				        <tr>
				            <td colspan="11" class="text-center" style="background-color:#f9f9f9; color: #555;">
				                No attendance records available.
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
                        <th class="text-center" style="color: white; background-color: #292648">Parent Name</th>
                        <th class="text-center" style="color: white; background-color: #292648">Total Present</th>
                      <% if ("view".equals(action)) { %>
                    	    <th class="text-center" style="color: white; background-color: #292648">Total Absent</th>
                    	    <th class="text-center" style="color: white; background-color: #292648">Attendance%</th>
						<% } %>       
                    </tr>
                </thead>
                <tbody>
             		 <%						
                        Object obj = request.getAttribute("studentAttendanceForm");
                        List<StudentAttendance> attendanceList = null;

                        if (obj instanceof List<?>) {
                        	attendanceList = (List<StudentAttendance>) obj;
                        }

                        if (attendanceList != null) {
                            for (StudentAttendance student : attendanceList) {
                    %>
                    <tr>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getStudentId() %>
                            <input type="hidden" name="studentId_2" value="<%= student.getStudentId() %>">
                        </td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getRollNo() %>
                            <input type="hidden" name="rollNo_2" value="<%= student.getRollNo() %>">
                        </td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getName() %>
                            <input type="hidden" name="fullName_2" value="<%= student.getName() %>">
                        </td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getParentName() %>
                        	<input type="hidden" name="parentName_2" value="<%= student.getParentName() %>">
                        </td>
                        
                        <td class="text-center align-middle" style="background-color:#EBF4FF;">
							<% if ("insert".equals(action)) { %>
						        <input type="number" name="totalPresent" class="form-control rounded" placeholder="Enter Total Present">
							<% }else if ("update".equals(action)) { %>
						        <input type="number" name="totalPresent" class="form-control rounded"
						               value="<%= student.getTotalPresent() %>">
							<%} else if ("view".equals(action)) { %>
						    	<span><%= student.getTotalPresent() %></span>
						        <input type="hidden" name="totalPresent" class="form-control rounded"
						               value="<%= student.getTotalPresent() %>" readonly>
						    <% } %>
						</td>
						<% if ("view".equals(action)) { %>
							 <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getTotalAbsent() %>
	                        </td>

							 <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getAttendancePercent() %>
	                        </td>
						<% } %>                       
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
