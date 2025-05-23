<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.IERP_FINAL.models.LeaveApplicationModel" %>
<%@ page import="com.IERP_FINAL.dao.LeaveApplicationDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Application</title>    
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
<div class="container main  mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
		<h1 class="heading-font  text-right fs-4">Leave Application</h1>

    <hr class="border  border-secondary border-1 mb-4 w-100 break">	 
	<div class="row w-100 d-flex flex-row justify-content-start">	
	
		<!-- Leave Application Form -->
	<form class="" action="LeaveApplication" method="post">
		<input type="hidden" name="action" value="add">
		<input type="hidden" name="id" value="<%= studentId %>">
	    <div class="row mb-3">
	        <div class="form-group col-md-6">
	            <label for="leaveType" class="topic-font fw-bold">Leave Type:</label>
	            
	            <select class="form-control  rounded" id="leaveType" name="leaveType">
	                <option value="">Select Leave Type</option>
	                <option value="sick">Sick Leave</option>
	                <option value="vacation">Vacation Leave</option>
	                <option value="personal">Personal Leave</option>
	                <option value="other">Other</option>
	            </select>
	        </div>
	        <div class="form-group col-md-6">
	            <label for="subject" class="topic-font fw-bold">Subject:</label>
	            <input type="text" class="form-control  rounded" id="subject" name="subject" placeholder="Subject">
	        </div>
	    </div>
	
	    <div class="row mb-3">
	        <div class="form-group col-md-6">
	            <label for="fromDate" class="topic-font fw-bold">From:</label>
	            <input type="date" class="form-control  rounded" id="fromDate" name="fromDate">
	        </div>
	        <div class="form-group col-md-6">
	            <label for="toDate" class="topic-font fw-bold">To:</label>
	            <input type="date" class="form-control  rounded" id="toDate" name="toDate">
	        </div>
	    </div>
	
	    <div class="row mb-3">
	        <div class="form-group col-md-12">
	            <label for="description" class="topic-font fw-bold">Description:</label>
	            <textarea class="form-control  rounded" id="description" name="description" placeholder="Description"></textarea>
	        </div>
	    </div>
	
		<div class="d-flex flex-row justify-content-end">
	    	<button type="submit" class="btn text-white px-3" style="background-color: #292648;">Submit Application</button>
	    </div>
	</form>
	
	

	</div>		
</div>

	<div class="container mt-4 main  p-3 shadow-sm rounded bg-white d-flex flex-column justify-content-center align-items-start">

	<h1 class="heading-font  text-right">Your Child's Leave Applications</h1>

    <hr class="border  border-secondary border-1 mb-4 w-100 break">	 
	<div class="row w-100">	
	
		<%
		   Object obj = request.getAttribute("leaveApplications");
		    List<LeaveApplicationModel> leaveList = null;
		
		    if (obj instanceof List<?>) {
		    	leaveList = (List<LeaveApplicationModel>) obj;
		    }
		
		    if (leaveList != null) {
		        for (LeaveApplicationModel leave : leaveList) {
			
		%>

		<div class="col-12 col-md-6  pl-2 mb-3 text-white  rounded ">
			<button  class="btn  text-decoration-none text-white" data-bs-toggle="modal" data-bs-target="#Modal_<%= leave.getId() %>">
				<div class="mainBtnBg card-hover rounded shadow-sm border-none d-flex flex-column justify-content-around " > 
					<div  class="d-flex flex-row justify-content-start align-items-start ">
						<h5 class="mt-2 mx-3"><%= leave.getLeaveType() %> Leave</h5>
					</div>		
					<div class="announce-card py-2 px-3 body d-flex flex-column justify-content-center  text-start">
					<strong class="text-dark"><%= leave.getFromDate() %> to <%= leave.getToDate() %></strong>
						<p class="truncate-text text-secondary  fs-6"><%= leave.getDescription() %>
						</p>
					</div>
				</div>	
			</button>
		</div>	
		
			    <!-- Achievement View More Modal -->
	    <div class="modal fade container bd-example-modal-lg" id="Modal_<%= leave.getId() %>" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
		    <div class="modal-dialog modal-lg">
		        <div class="modal-content">
		            <div class="modal-header pb-2">
		                <h3 class="fw-bold topic-font"><%= leave.getLeaveType() %> Leave</h3>
		                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		            </div>
		            <div class="modal-body row">
		                <div class="col-12">
		                    <div class="w-100 p-3 d-flex flex-column justify-content-start text-start">
		                        <h4 class="fw-bold name">Application With <%= leave.getLeaveType() %></h4>
		                        <h5 class="fs-6 mb-3">From <%= leave.getFromDate() %> To <%= leave.getToDate() %></h5>
		                        <p class="text-secondary">
		                            <%= leave.getDescription() %>
		                        </p>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
			  	
	<% }} %>
	</div>		



</div>
	

</div>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>