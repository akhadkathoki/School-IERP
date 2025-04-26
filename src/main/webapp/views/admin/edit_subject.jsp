<%@page import="com.IERP_FINAL.models.Subject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Subject</title>    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
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
        -webkit-line-clamp: 3; /* Limit to 3 lines */
        -webkit-box-orient: vertical;
        overflow: hidden;
        text-overflow: ellipsis;
    }
</style>
<body class="body">

<%@ include file='staticAdminComponent.jsp' %>

<div class="container main p-3 d-flex flex-column justify-content-center align-items-start">
    <br><br>
    
    <div class="row d-flex flex-row justify-content-center w-100">   
		    
	       <div class="col-12 col-md-6 p-3">
	       
	    	<div class="main mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
		        <h1 class="heading-font text-right fs-4">Edit Subject</h1>
		        <hr class="border border-secondary border-1 mb-4 w-100 break">
		        <div class="row w-100 d-flex flex-row justify-content-start">  
					
			        <%
					    Subject subjectInfo = (Subject) request.getAttribute("subject");
					%>
		            <!-- Classroom creation form -->
					<form class="row g-3" action="AddSubjectServlet" method="post">
						  <input type="hidden" name="action" value="update">
              			  <input type="hidden" name="subject_id" value="<%= subjectInfo.getSubjectId() %>">
                
                
					    <!-- Subject Name -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="subjectName" class="topic-font fw-bold">Subject Name:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="subjectName" name="subject_name" value="<%= subjectInfo.getSubjectName() %>" required>
					    </div>
					
					    <!-- Subject Code -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="subjectCode" class="topic-font fw-bold">Subject Code:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="subjectCode" name="subject_code" value="<%= subjectInfo.getSubjectCode() %>" required>
					    </div>
					
					    <!-- Subject Type -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="subjectType" class="topic-font fw-bold">Subject Type:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="subjectType" name="subject_type" value="<%= subjectInfo.getSubjectType() %>" required>
					    </div>
					
					    <!-- Class Name -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="className" class="topic-font fw-bold">Class Name:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="className" name="class_name" value="<%= subjectInfo.getClassName() %>" required>
					    </div>
					
					    <!-- Full Marks -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="fullMarks" class="topic-font fw-bold">Full Marks:</label>
					        <input type="number" class="form-control shadow-sm rounded" id="fullMarks" name="full_marks" value="<%= subjectInfo.getFullMarks() %>" required>
					    </div>
					
					    <!-- Subject Teacher ID -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="subjectTeacherId" class="topic-font fw-bold">Teacher ID:</label>
					        <input type="number" class="form-control shadow-sm rounded" id="subjectTeacherId" name="subject_teacher_id" value="<%= subjectInfo.getSubjectTeacherId() %>" required>
					    </div>
					
					    <!-- Submit Button -->
					    <div class="d-flex flex-row justify-content-end">
					        <button type="submit" class="btn text-white px-3" style="background-color: #292648;">Save</button>
					    </div>
					</form>

		        </div> 
			</div>	       
			
			
	    </div>
	  
	</div>
    
    <!-- Class Card List (To show the submitted classes) -->
        		
			
	
</div>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
