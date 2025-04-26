<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="com.IERP_FINAL.models.Announcement, com.IERP_FINAL.dao.AnnouncementDAO, com.IERP_FINAL.utils.DBConnection" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher</title>
        <link rel="stylesheet" href="main.css">
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <style>
        /* Sidebar Styles */
        .sideBar {
            width: 300px;
            height: 100vh;
            position: fixed;
            margin-top: 64px;
            background-color: #292648;
            transition: all 0.3s ease-in-out;
            left: -300px;
        }
        .sideBar.show {
            left: 0;
        }
        .nav-item {
            border-bottom: 1px solid grey;
            padding: 4px 20px;
        }
        .nav-item-option {
            border: none;
            padding: 2px 20px;
            background-color: #1A1736;
        }
        .nav-item-option:hover {
            background-color: #36335C;
        }

        /* Navbar Styles */
        .navbar {
     	    position: fixed;
        	width: 100%;
            background-color: #292648;
        }
        .navbar-brands {
            color: #EBF4FF;
            text-decoration: none;
            font-weight: bold;
            font-size: 32px;
        }
        .navbar-toggler {
            border: none;
            outline: none;
        }
        .navbar-toggler:focus {
            box-shadow: none;
        }
        .form-control {
            border-radius: 30px;
        }
        .user-card {
            display: flex;
            align-items: center;
            width: 200px;
            color: #292648;
            background-color: #CBE2FE;
            padding: 8px;
            border-radius: 8px;
        }
        .user-card img {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            margin-right: 15px;
        }
        .menuBtn{
        	border: 1px solid #292648;
        	color: #292648;
        }
         .menuBtn:hover{
        	border: 1px solid #292648;
        	background-color: #292648;
        	color: #EBF4FF;
        }
        .lang-items{
        	color: #292648;
        }
         .lang-items:hover{
         	color: #EBF4FF;
        	background-color: #292648;
        }
           /* Chatbot Button */
        .chatbot-btn {
            position: fixed;
            bottom: 20px;
            right: 20px;
            background-color: #292648;
            color: white;
            border: none;
            border-radius: 50%;
            width: 60px;
            height: 60px;
            font-size: 24px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        /* Chatbot Container */
        .chatbot-container {
            position: fixed;
            bottom: 90px;
            right: 20px;
            width: 320px;
            background: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            display: none;
            border: 1px solid #ddd;
        }

        /* Show Chatbot */
        .show-chatbot {
            display: block;
        }

        /* Chatbot Header */
        .chatbot-header {
            background: #007bff;
            color: white;
            padding: 10px;
            border-top-left-radius: 10px;
            border-top-right-radius: 10px;
            font-weight: bold;
            text-align: center;
        }

        /* Chatbot Body */
        .chatbot-body {
            padding: 10px;
            height: 200px;
            overflow-y: auto;
        }

        /* Chatbot Footer */
        .chatbot-footer {
            padding: 10px;
            border-top: 1px solid #ddd;
            display: flex;
            gap: 5px;
        }

        .chatbot-footer input {
            flex: 1;
        }
       
    </style>
</head>

<body>
	<%
	    HttpSession sessions = request.getSession(false);
	    if (sessions == null || sessions.getAttribute("teacherId") == null) {
	        response.sendRedirect("../../index.jsp?error=sessionExpired");
	        return;
	    }
	    if (sessions == null || session.getAttribute("username") == null) {
	        response.sendRedirect("../../index.jsp?error=sessionExpired");
	        return;
	    }
	    String teacherUsername = (String) session.getAttribute("username");
	    int teacherId = Integer.parseInt(sessions.getAttribute("teacherId").toString());
	%>

<!-- Navbar -->
<nav class="container-fouid navbar shadow navbar-expand-lg navbar-dark px-3">
    <button class="btn border-light text-light me-3" id="toggleSidebar"><i class="bi bi-list"></i></button>
        
    <a class="navbar-brands mx-3" >Shree Janahit ERP</a>

    <button class="navbar-toggler text-white" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <i class="bi bi-three-dots-vertical " ></i>
    </button>
     

    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
        

        <!-- Language Selector & User Card -->
        <div class="d-flex align-items-center">
            <div class="dropdown me-3">
                <button class="btn dropdown-toggle text-light " type="button" data-bs-toggle="dropdown">
                    Language
                </button>
                <ul class="dropdown-menu">
                    <li><a class="dropdown-item lang-items" href="#">English</a></li>
                    <li><a class="dropdown-item lang-items" href="#">नेपाली</a></li>
                </ul>
            </div>
         
        </div>
    </div>
</nav>

<!-- Sidebar -->
<div class="sideBar text-white pt-2" id="sidebar">
    <ul class="nav flex-column  overflow-auto">
        <!-- Home Section -->
        <li class="nav-item">
            <h6 class="text-uppercase mt-3">Home</h6>
        </li>
        
        <li class="nav-item nav-item-option">
            <a href="teacherDashboard.jsp" class="nav-link text-white"><i class="bi bi-speedometer2"></i> Dashboard</a>
        </li>
        <li class="nav-item nav-item-option">
            <a href="profile.jsp" class="nav-link text-white"><i class="bi bi-person"></i> Profile</a>
        </li>


        <!-- Academics Section -->
        <li class="nav-item ">
            <h6 class="text-uppercase mt-3">Academics</h6>
        </li>
        <li class="nav-item nav-item-option">
        	<form action="select_class.jsp" method="get" >
      	        <input type="hidden" name="teacher_id" value="<%= teacherId %>">

				<button class="nav-link text-white" > 
					<i class="bi bi-calendar-check"></i> Attendance
				</button>	
			</form>	
        </li>

        <li class="nav-item nav-item-option">
            <a href="result.jsp" class="nav-link text-white"><i class="bi bi-clipboard-data"></i> Results</a>
        </li>

        <!-- Other Sections -->
        <li class="nav-item">
            <h6 class="text-uppercase mt-3">Other</h6>
        </li>
        <li class="nav-item nav-item-option">
            <a href="leave_application.jsp" class="nav-link text-white"><i class="bi bi-file-earmark-text"></i> Leave Applications</a>
        </li>
        <li class="nav-item nav-item-option">
            <a href="THolidayServlet" class="nav-link text-white"><i class="bi bi-calendar-event"></i> Holidays</a>
        </li>
        <li class="nav-item nav-item-option">
            <a href="achievements.jsp" class="nav-link text-white"><i class="bi bi-trophy"></i> Achievements</a>
        </li>


        <!-- Logout -->
        <li class="nav-item nav-item-option">
            <a href="../index.jsp" class="nav-link text-white"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </li>
    </ul>
</div>

 <!-- Chatbot Button 
    <button class="chatbot-btn" data-bs-toggle="collapse" data-bs-target="#chatbotBox">
        💬
    </button> -->

    <!-- Chatbot Box -->
    <div id="chatbotBox" class="chatbot-container collapse">
        <div class="chatbot-header">
            IERP Chatbot
        </div>
        <div class="chatbot-body">
            <p>Hello! How can I assist you?</p>
        </div>
        <div class="chatbot-footer">
            <input type="text" class="form-control" placeholder="Type a message...">
            <button class="btn btn-primary">Send</button>
        </div>
    </div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<!-- Sidebar Toggle Script -->
<script>
    document.getElementById("toggleSidebar").addEventListener("click", function() {
        document.getElementById("sidebar").classList.toggle("show");
    });
    document.getElementById("slider").addEventListener("mouseleave", function() {
        document.getElementById("sidebar").classList.toggle("show");
    });
</script>

</body>
</html>
