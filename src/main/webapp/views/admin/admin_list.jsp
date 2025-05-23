
<%@ page import="com.IERP_FINAL.models.Admin" %>

<%@ page import="java.util.List " %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admins</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
	.body{
		background-color: #CDD5DB;
	}
      table thead tr th, table tbody tr td {
            text-align: center;
            vertical-align: middle;
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
	table thead tr th{
    background-color: red; /* Table head background color */
    color: white; /* White text for better contrast */
}

table tbody tr:nth-child(even), .tableBg {
    background-color: skyblue; /* Even rows background */
}

table tbody tr:nth-child(odd) {
    background-color: darkblue; /* Odd rows background */
    color: white; /* White text for better contrast */
}


</style>


<body class="body">
<%@ include file='staticAdminComponent.jsp' %>

<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br><br>
	<!-- Subject wise Attendance -->
    <div class="container main mt-4 p-3 shadow-sm mb-3 rounded bg-white  d-flex flex-column justify-content-center align-items-start">
		<div class="w-100 mb-2 d-flex flex-row justify-content-between">
			<h1 class="heading-font  text-right fs-2">Admins</h1>
			<form class="form-group d-flex flex-row ">
				<input class="form-control rounded" type="search" placeholder="Search admin">&nbsp;&nbsp;
				<button class="btn  px-3 text-white" type="button" style="background-color: #292648;" data-bs-toggle="modal" data-bs-target="#addAdminModal">
		        	<i class="bi bi-search"></i>
		        </button>
	        </form>
	   	</div>
  	    <hr class="border  border-dark border-1 mb-4 w-100 break">	 
		<div class="w-100 table-responsive">
	        <table class="table  table-hover ">
	            <thead class="">
	                <tr class="" >
	               	    <th class="text-center" style="color: white; background-color: #292648">Admin ID</th>
	               	    <th class="text-center" style="color: white; background-color: #292648">Role</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Photo</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Full Name</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Gender</th>
	                    <th class="text-center" style="color: white; background-color: #292648">DOB</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Email</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Contact Number</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Date Assigned</th>

	                </tr>
	            </thead>
	            <tbody>
      		    	<%
					    Object obj = request.getAttribute("adminList");
					    List<Admin> adminList = null;
					    
					    if (obj instanceof List<?>) {
					        adminList = (List<Admin>) obj;
					    }
					    
					    if (adminList != null) {
					        for (Admin admin : adminList) {
					%>	
		                <tr class="text-center ">
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= admin.getId() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= admin.getRole() %></td>

		                    <td class="text-center align-middle" style="background-color:#EBF4FF;">
		                    	<% if (admin.getProfilePhoto() != null) { %>
				                    <img class="rounded-circle image-fluid shadow-sm" src="data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(admin.getProfilePhoto())) %>" width="50" height="50" alt="Avatar"/>
				                <% } else { %>
				                    No Image
				                <% } %>
		                 	</td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= admin.getFullName() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= admin.getGender() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= admin.getDateOfBirth() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= admin.getEmail() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= admin.getContactNumber() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= admin.getCreatedAt() %></td>

		                
		                	
		                </tr>
		            	
		            	<% } 
		            }%>
	            </tbody>
	        </table>
	
	     </div>
    </div>   	
   </div>


   	
   	
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>