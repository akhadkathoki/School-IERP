<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.IERP_FINAL.models.Announcement, com.IERP_FINAL.dao.AnnouncementDAO, com.IERP_FINAL.utils.DBConnection" %>
<%@ page import="java.sql.*, java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>    
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

<%@ include file='staticStudentComponent.jsp' %>




<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br><br><br>
	
	<h1 class="heading-font fs-3 text-right">Welcome   <span class="text-underline fs-2 text-light rounded shadow bg-success bg-opacity-75 px-3"><%= adminUsername %></span> 👋</h1>
	<br>

	
	<div class="container main  p-3 shadow-sm rounded bg-white d-flex flex-column justify-content-center align-items-start">

	<h1 class="heading-font  text-right">Statistics</h1>

    <hr class="border  border-secondary border-1 mb-4 w-100 break">	 
	<div class="row w-100">	
		<div class="col-12 col-sm-6 col-lg-3 pl-2 mb-3 text-white  rounded ">
			<a href="select_attendance.jsp" class="text-decoration-none text-white">
				<div class="bg-primary bg-opacity-75 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div  class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-calendar-check fs-1"></i>
						<h4>Attendance</h4>
					</div>		

				</div>	
			</a>
		</div>		

		<div class="col-12 col-sm-6 col-lg-3 pl-2 mb-3 text-white  rounded ">
			<a href="result.jsp" class="text-decoration-none text-white">
				<div class="bg-success bg-opacity-75 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-clipboard-check fs-1"></i>
						<h4>Result</h4>
					</div>		
					<div class="vr border border-light border-2 d-sm-none"></div>
					<div class="d-flex flex-column justify-content-center  align-items-center text-center">
						<h1>10</h1>
					</div>
				</div>		
			</a>		
		</div>
		
		
		<div class="col-12 col-sm-6 col-lg-3 pl-2 mb-3 text-white  rounded ">
			<a href="holidays_list.jsp" class="text-decoration-none text-white">		
				<div class="bg-secondary bg-opacity-75 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-calendar-heart fs-1"></i>
						<h4>Holidays</h4>
					</div>		

				</div>				
			</a>
		</div>
		
		
		<div class="col-12 col-sm-6 col-lg-3 pl-2 mb-3 text-white  rounded ">
			<a href="AchievementServlet?action=list&id=<%= studentId %>" class="text-decoration-none text-white">

				<div class="bg-danger bg-opacity-75 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-trophy fs-1"></i>
						<h4>Achievements</h4>
					</div>		
					<div class="vr border border-light border-2 d-sm-none"></div>
					<div class="d-flex flex-column justify-content-center  align-items-center text-center">
						<h1>15</h1>
					</div>
				</div>	
			</a>			
		</div>
		
		
	</div>		
</div>

<div class="container p-0">
	<div class="row p-0" >
			
		<div class="col-12 p-3 ">
			<div class="d-flex  flex-column justify-content-center ">
				<div class=" w-100  p-2 shadow-sm rounded bg-white">
					<h1 class="heading-font  text-right">Announcements</h1>
	  				<hr class="border  border-secondary border-1 mb-3 w-100 break">	 
	  				
	  				<div class="d-flex shadow-sm flex-column justfy-content-start overflow-auto" style="height: 600px;">
 						
 						 <%
 						Connection conn = DBConnection.getConnection(); // Or however you get your DB connection
 						AnnouncementDAO announcementDAO = new AnnouncementDAO(conn); // Pass the connection
 						List<Announcement> announcements = announcementDAO.getAllAnnouncements();
 						request.setAttribute("announcementList", announcements);
 	                    
                        Object obj = request.getAttribute("announcementList");
                        List<Announcement> announcementList = null;

                        if (obj instanceof List<?>) {
                        	announcementList = (List<Announcement>) obj;
                        }

                        if (announcementList != null) {
                            for (Announcement announce : announcementList) {
                    %>
							<!-- Feedback Card -->
							<div class="p-3 mb-3 announce-card shadow-sm rounded d-flex flex-column justify-content-start"> 
								<div class="mb-1 d-flex flex-row justify-content-between p-0"> 
									<div class="d-flex flex-row ">
										<p class="mb-1 fw-bold" style="font-size: 16px; color: #626161;"><%= announce.getDate() %></p>
										&nbsp;&nbsp;&nbsp;&nbsp;
										<p class="fw-bold" style="font-size: 16px; color: #626161;"><%= announce.getTime() %></p>
									</div>
									
								</div>
								<h2 class="fw-bold" style="font-size: 20px; color: #292648;">✉️ <%= announce.getHeading() %></h2>

								<p class="mb-0 " style="font-size: 18px; color: #626161;"><%= announce.getDescription() %></p>
							</div>
						<%
								}
							}
						%>
	  					  			
	  				</div>
				</div>
				
	
			</div>
		</div>
	
	
	</div>
</div>
	
	
</div>

  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
