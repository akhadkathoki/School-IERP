<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<form class="">
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
</div>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>