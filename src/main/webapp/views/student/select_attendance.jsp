<%@ page import="com.IERP_FINAL.models.Student"%>
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
<%@ include file='staticStudentComponent.jsp' %>

<% 
    // Fetch username from session or request
    String username = (String) session.getAttribute("username");
    if (username == null) {
        // Handle case when username is not found in session (e.g., redirect to login page)
        response.sendRedirect("login.jsp");
        return;
    }

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String month = request.getParameter("month");

    try {
        conn = DBConnection.getConnection();

        // Step 1: Fetch student ID based on username

        // Step 2: Fetch attendance records based on student_id and month
        if (studentId > 0 && month != null) {
            String sql2 = "SELECT * FROM attendance WHERE student_id = ? AND month = ?";
            stmt = conn.prepareStatement(sql2);
            stmt.setInt(1, studentId);
            stmt.setString(2, month);
            rs = stmt.executeQuery();

            // Step 3: Process attendance records
            List<StudentAttendance> allAttendance = new ArrayList<>();
            while (rs.next()) {
	              StudentAttendance sa = new StudentAttendance();
	              sa.setStudentId(rs.getInt("student_id"));
	              sa.setRollNo(rs.getString("roll_no"));
	              sa.setName(rs.getString("name"));
	              sa.setParentName(rs.getString("parent_name"));
	              sa.setClassName(rs.getString("class_name"));
	              sa.setMonth(rs.getString("month"));
	              sa.setTotalClass(rs.getInt("total_classes"));
	              sa.setSubjectName(rs.getString("subject_name"));
	              sa.setTotalPresent(rs.getInt("total_present"));
	              sa.setTotalAbsent(rs.getInt("total_absent"));
	              sa.setAttendancePercent(rs.getInt("attendance_percent"));
	              
                allAttendance.add(sa);
	            }

            // Set the attendance list to the request attribute for display
            request.setAttribute("studentAttendance", allAttendance);
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
                <form class="row w-100" action="select_attendance.jsp" method="get" id="fetchForm">
                    <input type="hidden" name="studentId" value="<%= studentId %>">
                    


                    <div class="form-group col-12 mb-3">
                        <label for="month" class="topic-font fw-bold">Month</label>
                        <input type="month" class="form-control shadow-sm rounded" name="month" id="month" placeholder="Enter the Month" >
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
            <h1 class="heading-font text-right fs-2"><%= month %> Attendance</h1>
        </div>
        <hr class="border border-dark border-1 mb-4 w-100 break">
        <div class="w-100 table-responsive" >
          

                <table class="table table-hover">
                    <thead>
                        <tr>
                           
                            <th class="text-start" style="color: white; background-color: #292648">Subject</th>
                            <th class="text-start" style="color: white; background-color: #292648">Total Classes</th>
                            <th class="text-start" style="color: white; background-color: #292648">Total Present</th>
                            <th class="text-start" style="color: white; background-color: #292648">Total Absent</th>
                            <th class="text-start" style="color: white; background-color: #292648">Attendance %</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            List<StudentAttendance> allAttendance = (List<StudentAttendance>) request.getAttribute("studentAttendance");
                            if (allAttendance != null) {
                                for (StudentAttendance attendance : allAttendance) {
                        %>
                        <tr>
                            <td class="text-start align-middle" style="background-color:#EBF4FF;"><%= attendance.getSubjectName() %></td>
                            <td class="text-start align-middle" style="background-color:#EBF4FF;"><%= attendance.getTotalClass() %></td>
                            <td class="text-start align-middle" style="background-color:#EBF4FF;"><%= attendance.getTotalPresent() %></td>
                            <td class="text-start align-middle" style="background-color:#EBF4FF;"><%= attendance.getTotalAbsent() %></td>
                            <td class="text-start align-middle" style="background-color:#EBF4FF;"><%= attendance.getAttendancePercent() %> %</td>
                        </tr>
                        <%
                                }
                            }
                        %>
                    </tbody>
                </table>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
