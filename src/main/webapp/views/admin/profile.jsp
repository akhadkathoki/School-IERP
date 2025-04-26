<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.IERP_FINAL.models.Admin" %>
<%@ page import="java.util.Base64" %>
<%@ page import="java.util.List " %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    
</head>

<style>
	.body{
		background-color: #CDD5DB;
	}
	.name{
		color: #292648;
	}
	.subName{
		color: #8E8C8C;
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


<% 
    List<Admin> adminList = (List<Admin>) request.getAttribute("adminList");
    if (adminList != null && !adminList.isEmpty()) {
        for (Admin adminOnly : adminList) {
%>
<body class="body ">

<%@ include file='staticAdminComponent.jsp' %>

<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br>
<div class="container main  mt-4 p-3 bg-transparent d-flex flex-column justify-content-center align-items-start">
	<h1 class="heading-font  text-right fs-2">Profile</h1>

    <hr class="border  border-dark border-2 mb-4 w-100 break">	 
	<div class="row w-100">	
	
		<div class="col-12  col-lg-3 pl-2 mb-3 text-white  rounded ">
			<div class=" d-flex flex-column justify-content-start align-items-center" > 
				<div class="bg-white w-100 pt-4 mb-3 d-flex flex-column justify-content-center align-items-center text-center rounded shadow-sm border-none ">
							 <% if (adminOnly != null && adminOnly.getProfilePhoto() != null) { %>
						        <img class="p-prc mb-3 rounded-circle border border-4 border-info shadow" 
						             src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(adminOnly.getProfilePhoto()) %>" 
						             alt="Profile Image">
						             
						    <% } else { %>
      		  					<img class="p-prc mb-3 rounded-circle border border-4 border-info shadow"  alt=""  src="">

						    <% } %>
								
					<h4 class="name fs-2 fw-bold text-center"><%= adminOnly.getFullName() %></h4>
					<p class="name text-center fw-bold"><%= adminOnly.getRole() %></p>
				</div>		
				<button class="btn px-3 w-100 text-white mb-3" style="background-color: #292648;">Download PDF</button>
			
			</div>	
		</div>		

		<div class="col-12 col-lg-9 pl-2 mb-3 text-white  rounded ">
			<!-- Information as per category  -->
		
				<div class="p-3 pl-4 shadow-sm mb-3 rounded bg-white d-flex flex-column justify-content-center align-items-start" > 
					<h1 class="heading-font  text-right">Perosnal Details</h1>
				    <hr class="border  border-dark border-1 mb-4 w-100 break">	 
				
					<div class="row w-100 d-flex  p-2 flex-row justify-content-start align-items-center ">
					
							<!-- Data from table -->
							    <div class="col-12 mb-3 col-md-6 d-flex flex-column">
							        <strong class="col-4 name">ID:</strong>
							        <input type="text" disabled class="form-control rounded col-8 subName" placeholder="<%= adminOnly.getId() %>">
							    </div>
							
							    <div class="col-12 mb-3 col-md-6 d-flex flex-column">
							        <strong class="col-4 name">Full Name:</strong>
							        <input type="text" disabled class="form-control rounded col-8 subName" placeholder="<%= adminOnly.getFullName() %>">
							    </div>
							    
							
							    <div class="col-12 mb-3 col-md-6 d-flex flex-column">
							        <strong class="col-4 name">Username:</strong>
							        <input type="text" disabled class="form-control rounded col-8 subName" placeholder="<%= adminOnly.getUsername() %>">
							    </div>
							
							
							    <div class="col-12 mb-3 col-md-6 d-flex flex-column">
							        <strong class="col-4 name">Gender:</strong>
							        <input type="text" disabled class="form-control rounded col-8 subName" placeholder="<%= adminOnly.getGender() %>">
							    </div>
							
							    <div class="col-12 mb-3 col-md-6 d-flex flex-column">
							        <strong class="col-4 name">Date of Birth:</strong>
							        <input type="text" disabled class="form-control rounded col-8 subName" placeholder="<%= adminOnly.getDateOfBirth() %>">
							    </div>
							
							    <div class="col-12 mb-3 col-md-6 d-flex flex-column">
							        <strong class="col-4 name">Contact Number:</strong>
							        <input type="text" disabled class="form-control rounded col-8 subName" placeholder="<%= adminOnly.getContactNumber() %>">
							    </div>
							
							    <div class="col-12 mb-3 col-md-6 d-flex flex-column">
							        <strong class="col-4 name">Email:</strong>
							        <input type="text" disabled class="form-control rounded col-8 subName" placeholder="<%= adminOnly.getEmail() %>">
							    </div>
							    
							    <div class="col-12 mb-3 col-md-6 d-flex flex-column">
							        <strong class="col-4 name">Created At:</strong>
							        <input type="text" disabled class="form-control rounded col-8 subName" placeholder="<%= adminOnly.getCreatedAt() %>">
							    </div>
							
						
					
					</div>	
				</div>		
			
		</div>
		
	</div>		
</div>
</div>


<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
<% }} else { %>
	<body class="bg-secondary bg-opacity-50">
		<%@ include file='staticAdminComponent.jsp' %>
		
		<div class="container main min-vh-100 p-3 d-flex text-center flex-column justify-content-center align-items-center">
			<br>
			<div class="container main  mt-4 p-3 bg-transparent d-flex flex-column justify-content-center text-center align-items-center">
				<h1 class="heading-font  text-right fs-5">Data not Available</h1>
			</div>
			<script src="bootstrap.bundle.min.js"></script>
			<script src="dashboard.js"></script>
		</div>

  	</body>
<% } %>
</html>
