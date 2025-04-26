<% // @  page import="com.IERP_FINAL.models.Announcement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.IERP_FINAL.models.Announcement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Announcement</title>    
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
    .p-prc {
        height: 170px;
        width: 170px;
    }
    .announce-card {
        background-color: #EBF4FF;
    }
    .main {
    }
    .break {
        margin-top: -1px;
    }
    .truncate-text {
        display: -webkit-box;
        -webkit-line-clamp: 3;
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>
<body class="body">

<%@ include file='staticAdminComponent.jsp' %>

<div class="container main p-3 d-flex flex-column justify-content-center align-items-start">
    <br><br><br>
    
    <div class="row d-flex flex-row justify-content-center w-100">   
        <div class="col-12 col-md-6 p-3">
            <div class="main  p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
                <h1 class="heading-font text-right fs-4">Edit Announcement</h1>
                <hr class="border border-secondary border-1 mb-4 w-100 break">
                <div class="row w-100 d-flex flex-row justify-content-start"> 

 					 <%
					    Announcement announce = (Announcement) request.getAttribute("announcement");
					%>

                   <form class="row g-3" action="AnnouncementServlet" method="post">
                  		<input type="hidden" name="announcement_id" value="<%= announce.getId() %>">
                   		
					    <!-- Heading -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="heading" class="topic-font fw-bold">Heading:</label>
					        <input 
					            type="text" 
					            class="form-control shadow-sm rounded" 
					            id="heading" 
					            name="heading" 
					            value="<%= announce.getHeading() %>"
					            required
					        >
					    </div>
					
					    <!-- Date -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="date" class="topic-font fw-bold">Date:</label>
					        <input 
					            type="date" 
					            class="form-control shadow-sm rounded" 
					            id="date" 
					            name="date" 
					            value="<%= announce.getDate() %>"
					            required
					        >
					    </div>
					
					    <!-- Time -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="time" class="topic-font fw-bold">Time:</label>
					        <input 
					            type="time" 
					            class="form-control shadow-sm rounded" 
					            id="time" 
					            name="time" 
					            value="<%= announce.getTime() %>"
					            required
					        >
					    </div>
					
					    <!-- Description -->
					    <div class="form-group col-12 mb-3">
					        <label for="description" class="topic-font fw-bold">Description:</label>
					        <input 
					            class="form-control shadow-sm rounded" 
					            id="description" 
					            name="description" 
				
					            value="<%= announce.getDescription() %>"
					            required
					        >
					    </div>
					
					    <!-- Submit Button -->
					    <div class="d-flex flex-row justify-content-end">
					        <button type="submit" class="btn text-white px-3" style="background-color: #292648;">Save</button>
					    </div>
					</form>

                </div> 
            </div>	       
        </div>
        
>
		
    </div>
</div>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
