<%@page import="com.IERP_FINAL.models.Subject,  java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Class Component</title>    
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
    
    <div class="row ">
    
	    <div class="col-12 col-md-6 p-3">
	    	<div class="main mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
		        <h1 class="heading-font text-right fs-4">Add Student</h1>
		        <hr class="border border-secondary border-1 mb-4 w-100 break">
		        <div class="row w-100 d-flex flex-row justify-content-start">  
					
		            <!-- Add Student form -->
					<form class="row g-3" action="ClassSubjectStudentServlet" method="post">
					    <input type="hidden" name="action" value="add">
						
						<!-- Class Name -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="roll_no" class="topic-font fw-bold">Roll No:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="roll_no" name="roll_no" placeholder="e.g., Level 1" required>
					    </div>
					    
					    <!-- Class Name -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="class_name" class="topic-font fw-bold">Class Name:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="class_name" name="class_name" placeholder="e.g., Level 1" required>
					    </div>
					
					  
					
					    <!-- Student IDs (comma-separated) -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="student_ids" class="topic-font fw-bold">Student IDs (comma-separated):</label>
					        <input type="text" class="form-control shadow-sm rounded" id="student_ids" name="student_ids" placeholder="e.g., 101,102,103" required>
					    </div>
					
					    <!-- Submit Button -->
					    <div class="d-flex flex-row justify-content-end">
					        <button type="submit" class="btn text-white px-3" style="background-color: #292648;">Add Students</button>
					    </div>
					</form>

		        </div> 
			</div>	     
			<div class="container mt-5  mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
	            <h2 class="heading-font">Student List</h2>
	            <hr class="border border-secondary border-1 mb-4 w-100 break">
	            
	            <div class=" table-responsive row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-3 w-100">
	            
	           		<table class="table table-hover">
					    <thead>
					        <tr>
					            <th class="text-center" style="color: white; background-color: #292648">Action</th>
					            <th class="text-center" style="color: white; background-color: #292648">Student ID</th>
					            <th class="text-center" style="color: white; background-color: #292648">Roll No</th>
					            <th class="text-center" style="color: white; background-color: #292648">Student Name</th>
					            <th class="text-center" style="color: white; background-color: #292648">Class Name</th>
					            <th class="text-center" style="color: white; background-color: #292648">Class Teacher</th>
					        </tr>
					    </thead>
					    <tbody>
					        <%
					            Object obj = request.getAttribute("cssList");
					            List<Map<String, Object>> cssList = null;
					
					            if (obj instanceof List<?>) {
					                cssList = (List<Map<String, Object>>) obj;
					            }
					
					            if (cssList != null) {
					                for (Map<String, Object> entry : cssList) {
					        %>
					        <tr class="text-center" onclick="window.location.href='ClassSubjectStudentServlet?studentId=<%= entry.get("student_id") %>&action=getById'">
					            <td class="text-center align-middle" style="background-color:#EBF4FF;">
					                <form action="ClassSubjectStudentServlet" method="get" style="display:inline;">
					                    <input type="hidden" name="action" value="getById">
					                    <input type="hidden" name="studentId" value="<%= entry.get("student_id") %>" />
					                    <button type="submit" class="btn btn-warning">
					                        <i class="bi bi-pencil"></i>
					                    </button>
					                </form>
					                <br>
					                <form action="ClassSubjectStudentServlet" method="POST" style="display:inline;">
					                    <input type="hidden" name="action" value="delete">
					                    <input type="hidden" name="studentId" value="<%= entry.get("student_id") %>" />
					                    <button type="submit" class="btn btn-danger">
					                        <i class="bi bi-trash"></i>
					                    </button>
					                </form>
					            </td>
					            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= entry.get("student_id") %></td>
					            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= entry.get("roll_no") %> </td>
					            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= entry.get("student_name") %></td>
					            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= entry.get("class_name") %></td>
					            <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= entry.get("teacher_name") %></td>
					        </tr>
					        <% } } %>
					    </tbody>
					</table>
	           		
				</div>		
				
			</div>   
		    </div>
		    
	       <div class="col-12 col-md-6 p-3">
	    	<div class="main mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
		        <h1 class="heading-font text-right fs-4">Add Subject</h1>
		        <hr class="border border-secondary border-1 mb-4 w-100 break">
		        <div class="row w-100 d-flex flex-row justify-content-start">  
					
		            <!-- Classroom creation form -->
					<form class="row g-3" action="AddSubjectServlet" method="post">

					    <!-- Subject Name -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="subjectName" class="topic-font fw-bold">Subject Name:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="subjectName" name="subject_name" placeholder="e.g., Mathematics" required>
					    </div>
					
					    <!-- Subject Code -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="subjectCode" class="topic-font fw-bold">Subject Code:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="subjectCode" name="subject_code" placeholder="e.g., MATH101" required>
					    </div>
					
					    <!-- Subject Type -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="subjectType" class="topic-font fw-bold">Subject Type:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="subjectType" name="subject_type" placeholder="e.g., Theory / Practical" required>
					    </div>
					
					    <!-- Class Name -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="className" class="topic-font fw-bold">Class Name:</label>
					        <input type="text" class="form-control shadow-sm rounded" id="className" name="class_name" placeholder="e.g., Level 1-A" required>
					    </div>
					
					    <!-- Full Marks -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="fullMarks" class="topic-font fw-bold">Full Marks:</label>
					        <input type="number" class="form-control shadow-sm rounded" id="fullMarks" name="full_marks" placeholder="e.g., 100">
					    </div>
					
					    <!-- Subject Teacher ID -->
					    <div class="form-group col-md-6 col-lg-6 mb-3">
					        <label for="subjectTeacherId" class="topic-font fw-bold">Teacher ID:</label>
					        <input type="number" class="form-control shadow-sm rounded" id="subjectTeacherId" name="subject_teacher_id" placeholder="e.g., 5" required>
					    </div>
					
					    <!-- Submit Button -->
					    <div class="d-flex flex-row justify-content-end">
					        <button type="submit" class="btn text-white px-3" style="background-color: #292648;">Add Subject</button>
					    </div>
					</form>

		        </div> 
			</div>	       
			
			<!-- Subject list -->
			<div class="container mt-5  mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
	            <h2 class="heading-font">Subject List</h2>
	            <hr class="border border-secondary border-1 mb-4 w-100 break">
	            
	            <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-3 w-100">
	            
	           	<%
		            Object obj2 = request.getAttribute("subjectList");
		            List<Subject> subjectList = null;
		            if (obj2 instanceof List<?>) {
		                subjectList = (List<Subject>) obj2;
		            }
		            if (subjectList != null) {
		                for (Subject subject : subjectList) {
				%>	
				   
				<div class="col-12 col-lg-6">
				    <div class=" shadow-sm border-0 rounded bg-primary bg-opacity-10 px-3 py-3">
				        <div class="row align-items-center">
				            <!-- Left Circle (Class) -->
				            <div class="col-12 col-sm-4 pt-3 pl-3 d-flex justify-content-center justify-content-md-start mb-3 mb-md-0">
				                <div class=" d-flex flex-column align-items-center justify-content-center" style="width: 70px; height: 70px;">
				                    <h6 class="fw-bold mb-2 shadow-sm bg-light bg-opacity-75 rounded-circle px-3 py-4"><%= subject.getSubjectCode() %></h6>
				                    <p class="mb-1  fw-bold"><%= subject.getSubjectName() %></p>
				                    
				                </div>
				            </div>
				
				            <!-- Right Info -->
				          <div class="col-10 col-sm-6 text-center d-flex flex-row flex-sm-column justify-content-around text-sm-start">
							    <div class="mb-md-1">
							        <label class="fw-bold">Class:</label>
							        <p><%= subject.getClassName() %></p>
							    </div>
		
							    <div class="mb-0 d-sm-none d-md-block">
							        <label class="fw-bold">Teacher:</label>
							        <p><%= subject.getSubjectTeacherId()  %></p>
							    </div>
							    
							</div>
							<div class="col-2 col-sm-2 text-center d-flex flex-row flex-sm-column justify-content-around text-sm-start">
							    <div class=" px-3 d-flex flex-column justify-content-between mb-3">
					                    <form action="AddSubjectServlet" method="get" style="display:inline;" class="mb-2">
	                   	                	<input type="hidden" name="action" value="edit">
											<input type="hidden" name="subject_id" value="<%= subject.getSubjectId() %>">
	                   	                	
											<button type="submit" class="btn  btn-sm">
										        <i class="bi bi-pencil"></i>
										    </button>
										</form>
										
										<form action="AddSubjectServlet" method="get" style="display:inline;">
										    <input type="hidden" name="subject_id" value="<%= subject.getSubjectId() %>" />
										    <input type="hidden" name="action" id="action" value="delete">
										    <button type="submit" class="btn  btn-sm">
										        <i class="bi bi-trash"></i>
										    </button>
										</form>
									</div>
							    
							</div>
				        </div>
				    </div>
				</div>
			<% } } %>
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
