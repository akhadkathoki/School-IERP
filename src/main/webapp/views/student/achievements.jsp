<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.IERP_FINAL.models.Achievement" %>
<%@ page import="com.IERP_FINAL.dao.AchievementDAO" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Achievements</title>    
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
	.topic-font{
		color: #292648;
		font-weight: bold;
	}
	.heading-font{
		color: #292648;
		font-weight: bold;
		font-size: 24px;
	}
	.achieveCard{
		background-color: #EBF4FF;

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

   .truncate-text {
           display: -webkit-box;
           -webkit-line-clamp: 3; /* Limit to 3 lines */
           -webkit-box-orient: vertical;
           overflow: hidden;
           text-overflow: ellipsis;
       }
</style>
<body class="body ">

<%@ include file='staticStudentComponent.jsp' %>


<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br><br>
<div class="container main  mt-4 p-3 shadow-sm rounded bg-white d-flex flex-column justify-content-center align-items-start">
	<div class="w-100 mb-2 d-flex flex-row justify-content-between">
		<h1 class="heading-font  text-right fs-4">My Achievements</h1>
		<button class="btn px-lg-5 px-3 text-white" type="button" style="background-color: #292648;" data-bs-toggle="modal" data-bs-target="#addAchievementModal">
        	Add Achievements
        </button>
   	</div>
    <hr class="border  border-secondary border-1 mb-4 w-100 break">	
     
	<div class="row  d-flex flex-row justify-content-start">	
		
	<%
	   Object obj = request.getAttribute("achievements");
	    List<Achievement> achievementList = null;
	
	    if (obj instanceof List<?>) {
	    	achievementList = (List<Achievement>) obj;
	    }
	
	    if (achievementList != null) {
	        for (Achievement achieve : achievementList) {
		
	%>
	    <div class="col-12 rounded col-sm-6 col-md-4 p-2 col-xl-3 mb-3 text-white">
	        <div class="shadow w-100  border-none d-flex flex-column justify-content-center h-100 rounded" style="width: 18rem; ">
              <img class="card-img-top img-fluid w-100" style="height:  250px; width: 100%; "
			     src="<%= (achieve.getTestimonialImage() != null) ? 
    "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(achieve.getTestimonialImage()) : 
    "default_image_path.jpg" %>">
	            <div class="p-2 py-3  achieveCard">
	                <h5 class="fw-bold topic-font"><%= achieve.getTitle() %></h5>
	                <p class="truncate-text text-secondary">
	                	<%= achieve.getDescription() %>
	                </p> 
	                
 	                <button class="btn px-lg-3 px-5 text-white" type="button" style="background-color: #292648;" data-bs-toggle="modal" data-bs-target="#Modal_<%= achieve.getAchievementId() %>">
	                    View More
	                </button>
	            </div>
	        </div>
	    </div>

	    <!-- Achievement View More Modal -->
	    <div class="modal fade container bd-example-modal-lg" id="Modal_<%= achieve.getAchievementId() %>" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	                <div class="modal-header">
	                	<h5 class="fw-bold topic-font"><%= achieve.getTitle() %></h5>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body row">
	                	<div class="col-12 col-lg-6 d-lg-none">
	                		<div>
   		                    	<img class="shadow img-fluid rounded mb-3"  src="<%= (achieve.getTestimonialImage() != null) ? 
    "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(achieve.getTestimonialImage()) : 
    "default_image_path.jpg" %>" alt="Card image cap">
   		                    </div>
	                	</div>
	                	<div class="col-12 col-lg-6 ">
 							<div class="w-100 p-3 d-flex flex-row justify-content-start align-items-center">
		  					<table class="table table-borderless">
							 <tbody>
							 	
								    <tr>
									  <th scope="row">Activity Type:</th>
									  <td><%= achieve.getActivityType() %></td>
									</tr>
									<tr>
									  <th scope="row">Title:</th>
									  <td><%= achieve.getTitle() %></td>
									</tr>
									<tr>
									  <th scope="row">From:</th>
									  <td><%= achieve.getFromDate() %></td>
									</tr>
									<tr>
									  <th scope="row">To:</th>
									  <td><%= achieve.getToDate() %></td>
									</tr>
									<tr>
									  <th scope="row">Days:</th>
									  <td><%= achieve.getNumberOfDays() %></td>
									</tr>
									<tr>
									  <th scope="row">Awarded By:</th>
									  <td><%= achieve.getOrganization() %></td>
									</tr>
									<tr>
									  <th scope="row">Description:</th>
									  <td><%= achieve.getDescription() %></td>
									</tr>

								 

							  </tbody>
							</table>
						</div>                	
                   		</div>
                		<div class="col-12 col-md-6 d-none d-lg-block">
	                		<div>
   		                    	 	<img class="shadow img-fluid rounded mb-3"  src="<%= (achieve.getTestimonialImage() != null) ? 
    "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(achieve.getTestimonialImage()) : 
    "default_image_path.jpg" %>" alt="Card image cap">
   		                    </div>	                	
                    	</div>
	                   
	                </div>
	                <div class="modal-footer">

	 	                <button class="btn px-lg-3 px-5 text-white" type="button" style="background-color: #292648;" data-bs-toggle="modal" data-bs-target="#editAchievementModal_<%= achieve.getAchievementId() %>">
		                    Edit
		                </button>	                
	                </div>
	            </div>
	        </div>
	    </div>
	    
	    
		<!-- Edit Achievement Modal -->
		<div class="modal fade container bd-example-modal-lg rounded" id="editAchievementModal_<%= achieve.getAchievementId() %>" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-lg rounded shadow  bg-light">
		        <div class="modal-content bg-primary bg-opacity-10"> 
		            <div class="modal-header">
		            <h5 class="topic-font">Edit Achievements</h5>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body ">
		            	<form class="" action="AchievementServlet" method="post" enctype="multipart/form-data">
		            		<input type="hidden" name="action" value="update">
 			          		<input type="hidden" name="achievementId" value="<%= achieve.getAchievementId() %>">
 			          		<input type="hidden" name="id" value="<%= achieve.getStudentId() %>">
		            		
						    <div class="row mb-3">
						        <div class="form-group col-md-6">
						            <label for="activityType" class="topic-font fw-bold">Activity Type:</label>
						            <input type="text" class="form-control shadow-sm rounded" id="activityType" name="activityType" value="<%= achieve.getActivityType() %>">
						        </div>
						        <div class="form-group col-md-6">
						            <label for="title" class="topic-font fw-bold">Title:</label>
						            <input type="text" class="form-control shadow-sm rounded" id="title" name="title" value="<%= achieve.getTitle() %>">
						        </div>
						    </div>
						
						    <div class="row mb-3">
						        <div class="form-group col-md-6">
						            <label for="organizations" class="topic-font fw-bold">Organizations:</label>
						            <input type="text" class="form-control shadow-sm rounded" id="organizations" name="organizations" value="<%= achieve.getOrganization() %>">
						        </div>
						        <div class="form-group col-md-6">
						            <label for="noOfDays" class="topic-font fw-bold">No of Days:</label>
						            <input type="number" class="form-control shadow-sm rounded" id="noOfDays" name="noOfDays" value="<%= achieve.getNumberOfDays() %>">
						        </div>
						    </div>
						
						    <div class="row mb-3">
						        <div class="form-group col-md-6">
						            <label for="fromDate" class="topic-font fw-bold">From:</label>
						            <input type="date" class="form-control shadow-sm rounded" id="fromDate" name="fromDate" value="<%= achieve.getFromDate() %>">
						        </div>
						        <div class="form-group col-md-6">
						            <label for="toDate" class="topic-font fw-bold">To:</label>
						            <input type="date" class="form-control shadow-sm rounded" id="toDate" name="toDate" value="<%= achieve.getToDate() %>">
						        </div>
						    </div>
						
						    <div class="row mb-3">
						        <div class="form-group col-md-12">
						            <label for="description" class="topic-font fw-bold">Description:</label>
						            <input type="text" class="form-control shadow-sm rounded" id="description" name="description" value="<%= achieve.getDescription() %>">
						        </div>
						    </div>
						
						    <div class="row mb-3">
						        <div class="form-group col-md-12">
						            <label for="testimonialImage" class="topic-font fw-bold">Testimonial Image:</label>
						            <input type="file" class="form-control shadow-sm rounded" id="testimonialImage" name="testimonialImage" accept="image/*">
						        </div>
						    </div>
						 	<div class="mb-3 d-flex pt-3 flex-row justify-content-end">	
						    	<button type="submit" class="btn text-white px-5" style="background-color: #292648;">Save</button>
						   	</div>
						</form>
		
			        </div>
			    </div>
			</div>
		</div>
	<% } }%>


	</div>		


</div>


<!-- Add Achievement Modal -->
<div class="modal fade container bd-example-modal-lg rounded" id="addAchievementModal" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg rounded shadow  bg-light">
        <div class="modal-content bg-primary bg-opacity-10"> 
            <div class="modal-header">
            <h5 class="topic-font">Add Achievements</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body ">
            	<form class="" action="AchievementServlet" method="post" enctype="multipart/form-data">
            		<input type="hidden" name="action" value="add">
            		<input type="hidden" name="studentId" value="<%= studentId %>">
				    <div class="row mb-3">
				        <div class="form-group col-md-6">
				            <label for="activityType" class="topic-font fw-bold">Activity Type:</label>
				            <input type="text" class="form-control shadow-sm rounded" id="activityType" name="activityType" placeholder="Activity Type">
				        </div>
				        <div class="form-group col-md-6">
				            <label for="title" class="topic-font fw-bold">Title:</label>
				            <input type="text" class="form-control shadow-sm rounded" id="title" name="title" placeholder="Title">
				        </div>
				    </div>
				
				    <div class="row mb-3">
				        <div class="form-group col-md-6">
				            <label for="organizations" class="topic-font fw-bold">Organizations:</label>
				            <input type="text" class="form-control shadow-sm rounded" id="organizations" name="organizations" placeholder="Organizations">
				        </div>
				        <div class="form-group col-md-6">
				            <label for="noOfDays" class="topic-font fw-bold">No of Days:</label>
				            <input type="number" class="form-control shadow-sm rounded" id="noOfDays" name="noOfDays" placeholder="No of Days">
				        </div>
				    </div>
				
				    <div class="row mb-3">
				        <div class="form-group col-md-6">
				            <label for="fromDate" class="topic-font fw-bold">From:</label>
				            <input type="date" class="form-control shadow-sm rounded" id="fromDate" name="fromDate">
				        </div>
				        <div class="form-group col-md-6">
				            <label for="toDate" class="topic-font fw-bold">To:</label>
				            <input type="date" class="form-control shadow-sm rounded" id="toDate" name="toDate">
				        </div>
				    </div>
				
				    <div class="row mb-3">
				        <div class="form-group col-md-12">
				            <label for="description" class="topic-font fw-bold">Description:</label>
				            <textarea class="form-control shadow-sm rounded" id="description" name="description" placeholder="Description"></textarea>
				        </div>
				    </div>
				
				    <div class="row mb-3">
				        <div class="form-group col-md-12">
				            <label for="testimonialImage" class="topic-font fw-bold">Testimonial Image:</label>
				            <input type="file" class="form-control shadow-sm rounded" id="testimonialImage" name="testimonialImage" accept="image/*">
				        </div>
				    </div>
				 	<div class="mb-3 d-flex pt-3 flex-row justify-content-end">	
				    	<button type="submit" class="btn text-white px-5" style="background-color: #292648;">Add</button>
				   	</div>
				</form>

	        </div>
	    </div>
	</div>
</div>
</div>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
