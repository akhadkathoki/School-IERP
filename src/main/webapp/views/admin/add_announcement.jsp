<% // @  page import="com.IERP_FINAL.models.Announcement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.IERP_FINAL.models.Announcement" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Announcement</title>    
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
                <h1 class="heading-font text-right fs-4">Add Announcement</h1>
                <hr class="border border-secondary border-1 mb-4 w-100 break">
                <div class="row w-100 d-flex flex-row justify-content-start"> 

                   <form class="row g-3" action="AnnouncementServlet" method="post">
					    <!-- Heading -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="heading" class="topic-font fw-bold">Heading:</label>
					        <input 
					            type="text" 
					            class="form-control shadow-sm rounded" 
					            id="heading" 
					            name="heading" 
					            placeholder="Enter announcement heading" 
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
					            placeholder="Select date" 
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
					            placeholder="Select time" 
					            required
					        >
					    </div>
					
					    <!-- Description -->
					    <div class="form-group col-12 mb-3">
					        <label for="description" class="topic-font fw-bold">Description:</label>
					        <textarea 
					            class="form-control shadow-sm rounded" 
					            id="description" 
					            name="description" 
					            rows="4" 
					            placeholder="Write a brief description about the announcement..." 
					            required
					        ></textarea>
					    </div>
					
					    <!-- Submit Button -->
					    <div class="d-flex flex-row justify-content-end">
					        <button type="submit" class="btn text-white px-3" style="background-color: #292648;">Save</button>
					    </div>
					</form>

                </div> 
            </div>	       
        </div>
        
        <!-- Announcements Details -->
		<div class="col-12 col-md-6 p-3">
			<div class="d-flex  flex-column justify-content-center ">
				<div class=" w-100 h-100  p-2 shadow-sm rounded bg-white">
					<h1 class="heading-font  text-right">Announcements</h1>
					<hr class="border border-secondary border-1 mb-3 w-100 break">	 
					
					<div class="d-flex shadow-sm flex-column justfy-content-start overflow-auto" style="height: 600px;">
						
						 <%
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
									<div>
										<form action="AnnouncementServlet" method="get" style="display:inline;">
	                   	                	<input type="hidden" name="action" value="edit">
	                						<input type="hidden" name="announcement_id" value="<%= announce.getId() %>">
											<button type="submit" class="btn  btn-sm">
										        <i class="bi bi-pencil"></i>
										    </button>
										</form>
										
										<form action="AnnouncementServlet" method="get" style="display:inline;">
										    <input type="hidden" name="announcement_id" value="<%= announce.getId() %>" />
										    <input type="hidden" name="action" id="action" value="delete">
										    <button type="submit" class="btn  btn-sm">
										        <i class="bi bi-trash"></i>
										    </button>
										</form>
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

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
