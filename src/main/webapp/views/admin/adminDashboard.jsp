<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    int studentCount = 0;
    int teacherCount = 0;
    int parentCount = 0;
    int holidayCount = 0;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/school_erp", "root", "");
        Statement stmt = con.createStatement();

        ResultSet rs1 = stmt.executeQuery("SELECT COUNT(*) FROM students");
        if (rs1.next()) studentCount = rs1.getInt(1);

        ResultSet rs2 = stmt.executeQuery("SELECT COUNT(*) FROM teachers");
        if (rs2.next()) teacherCount = rs2.getInt(1);

   //     ResultSet rs3 = stmt.executeQuery("SELECT COUNT(*) FROM parents");
    //    if (rs3.next()) parentCount = rs3.getInt(1);

        ResultSet rs4 = stmt.executeQuery("SELECT COUNT(*) FROM holidays");
        if (rs4.next()) holidayCount = rs4.getInt(1);

        con.close();
    } catch (Exception e) {
        out.println("Database error: " + e.getMessage());
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    
</head>
<style>
	.body{
		background-color: #CDD5DB;
	}
	.mainBtnBg{
    	background-color: #292648;
	}
	.heading-font{
		color: #292648;
		font-weight: bold;
		font-size: 24px;
	}
	.a-font{
	color: #292648;
	font-weight: bold;
	font-size: 16px;
	}
	.p-prc{
		height: 170px;
		width: 170px;
	}
	.announce-card{
		background-color: #EBF4FF;
	}
	.main{
	
	}
	.break{
		margin-top: -1px;
	}
	    
</style>
<body class="body ">
	<%
	    HttpSession sessions = request.getSession(false);
	    if (sessions == null || session.getAttribute("username") == null) {
	        response.sendRedirect("../../index.jsp?error=sessionExpired");
	        return;
	    }
	    String adminUsername = (String) session.getAttribute("username");
	%>


<%@ include file='staticAdminComponent.jsp' %>



<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br><br><br>
	
	<h1 class="heading-font fs-3 text-right">Welcome   <span class="text-underline fs-2 text-light rounded shadow bg-success bg-opacity-75 px-3"><%= adminUsername %></span> 👋</h1>
	<br>

	<div class="container main  p-3 shadow-sm rounded bg-white d-flex flex-column justify-content-center align-items-start">
	<h1 class="heading-font  text-right">Statistics</h1>

    <hr class="border  border-secondary border-1 mb-4 w-100 break">	 
	<div class="row w-100">	
		<div class="col-12 col-md-6  pl-2 mb-3 text-white  rounded ">
			<form action="FetchAllStudentData" method="post"  class="text-decoration-none text-white">
			
				<button class="bg-primary w-100 border-0  text-white bg-opacity-50 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div  class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-calendar-check fs-1"></i>
						<h4>Students</h4>
					</div>		
					<div class="vr border border-light border-2 d-sm-none "></div>
					<div class="d-flex flex-column justify-content-center  align-items-center text-center">
						<h1><%= studentCount %></h1>
					</div>
				</button>	
			</form>
		</div>		

		<div class="col-12 col-md-6  pl-2 mb-3 text-white  rounded ">
			<form action="TeacherServlet" method="post" enctype="multipart/form-data" class="text-decoration-none text-white">
				<button class="bg-success bg-opacity-50 w-100 border-0 text-white p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-clipboard-check fs-1"></i>
						<h4>Teachers</h4>
					</div>		
					<div class="vr border border-light border-2 d-sm-none"></div>
					<div class="d-flex flex-column justify-content-center  align-items-center text-center">
						<h1><%= teacherCount %></h1>
					</div>
				</button>		
			</form>		
		</div>
		
		
		<div class="col-12 col-md-6  pl-2 mb-3 text-white  rounded ">
			<a href="RegisterParentInfo" class="text-decoration-none text-white">		
				<div class="bg-secondary bg-opacity-75 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-calendar-heart fs-1"></i>
						<h4>Parents</h4>
					</div>		
				
				</div>				
			</a>
		</div>
		
		
		<div class="col-12 col-md-6  pl-2 mb-3 text-white  rounded ">
			<form action="HolidayServlet" method="get" class="text-decoration-none text-white">

				<button class="bg-danger bg-opacity-50 w-100 border-0 text-white p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-calendar-heart fs-1"></i>
						<h4>Holiday</h4>
					</div>		
					<div class="vr border border-light border-2 d-sm-none"></div>
					<div class="d-flex flex-column justify-content-center  align-items-center text-center">
						<h1><%= holidayCount %></h1>
					</div>
				</button>	
			</form>			
		</div>
		
		
	</div>		
</div>

  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
