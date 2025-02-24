<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Janahit School Management System</title>
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
    </style>
</head>

<body>

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
            <a href="studentDashboard.jsp" class="nav-link text-white"><i class="bi bi-speedometer2"></i> Dashboard</a>
        </li>
        <li class="nav-item nav-item-option">
            <a href="profile.jsp" class="nav-link text-white"><i class="bi bi-person"></i> Profile</a>
        </li>

        <!-- Academics Section -->
        <li class="nav-item ">
            <h6 class="text-uppercase mt-3">Academics</h6>
        </li>
        <li class="nav-item nav-item-option">
            <a href="attendance.jsp" class="nav-link text-white"><i class="bi bi-calendar-check"></i> Attendance</a>
        </li>

        <li class="nav-item nav-item-option">
            <a href="results.jsp" class="nav-link text-white"><i class="bi bi-clipboard-data"></i> Results</a>
        </li>

        <!-- Other Sections -->
        <li class="nav-item">
            <h6 class="text-uppercase mt-3">Other</h6>
        </li>
        <li class="nav-item nav-item-option">
            <a href="leave_application.jsp" class="nav-link text-white"><i class="bi bi-file-earmark-text"></i> Leave Application</a>
        </li>
        <li class="nav-item nav-item-option">
            <a href="holidays.jsp" class="nav-link text-white"><i class="bi bi-calendar-event"></i> Holidays</a>
        </li>
        <li class="nav-item nav-item-option">
            <a href="achievements.jsp" class="nav-link text-white"><i class="bi bi-trophy"></i> Achievements</a>
        </li>
        <li class="nav-item nav-item-option">
            <a href="feedbacks.jsp" class="nav-link text-white"><i class="bi bi-chat-left-text"></i> Feedbacks</a>
        </li>

        <!-- Logout -->
        <li class="nav-item nav-item-option">
            <a href="../index.jsp" class="nav-link text-white"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </li>
    </ul>
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
