<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.IERP_FINAL.models.Classroom" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Class</title>    
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
    <br><br><br><br>
    <div class="container main mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
        <h1 class="heading-font text-right fs-4">Edit Class</h1>
        <hr class="border border-secondary border-1 mb-4 w-100 break">
        <div class="row w-100 d-flex flex-row justify-content-start">  

           <%
			    Classroom classInfo = (Classroom) request.getAttribute("classroom");
			%>
            <!-- Classroom creation form -->
			<form class="row g-3" action="AddClassServlet" method="post">
                
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="className" value="<%= classInfo.getClassName() %>">
                
                
                <!-- Class Level -->
                <div class="form-group col-md-6 col-lg-4 mb-3">
                    <label for="class_level" class="topic-font fw-bold">Class :</label>
                    <input type="number" class="form-control shadow-sm rounded" id="classLevel" name="classLevel" value="<%= classInfo.getClassLevel() %>" required>
                </div>

                <!-- Section -->
                <div class="form-group col-md-6 col-lg-4 mb-3">
                    <label for="section" class="topic-font fw-bold">Section:</label>
                    <input type="text" class="form-control shadow-sm rounded" id="section" name="section" value="<%= classInfo.getSection() %>" required>
                </div>

                <!-- Class Teacher ID -->
                <div class="form-group col-md-6 col-lg-4 mb-3">
                    <label for="class_teacher_id" class="topic-font fw-bold">Class Teacher ID:</label>
                    <input type="number" class="form-control shadow-sm rounded" id="class_teacher_id" name="classTeacherId" value="<%= classInfo.getClassTeacherId()%>" required>
                </div>

                <!-- Submit Button -->
                <div class="d-flex flex-row justify-content-end">
                    <button type="submit" class="btn text-white px-3" style="background-color: #292648;">Save</button>
                </div>
            </form>
        </div> 

        
    </div>

    
    <!-- Class Card List (To show the submitted classes) -->
        <div class="container mt-5  mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
            <h2 class="heading-font">Class List</h2>
            <hr class="border border-secondary border-1 mb-4 w-100 break">
            
            <div class="row row-cols-1 row-cols-sm-2 row-cols-lg-3 g-3 w-100">
            
           	<%
			    Object obj = request.getAttribute("classroomList");
			    List<Classroom> classroomList = null;
			    
			    if (obj instanceof List<?>) {
			        classroomList = (List<Classroom>) obj;
			    }
			    
			    if (classroomList != null) {
			        for (Classroom classroom : classroomList) {
			%>	
			   
			<div class="col-12 mb-3">
			    <div class=" shadow-sm border-0 rounded bg-primary bg-opacity-10 px-3 py-3">
			        <div class="row align-items-center">
			            <!-- Left Circle (Class) -->
			            <div class="col-12 col-sm-4 pt-3 pl-3 d-flex justify-content-center justify-content-md-start mb-3 mb-md-0">
			                <div class=" d-flex flex-column align-items-center justify-content-center" style="width: 70px; height: 70px;">
			                    <h6 class="fw-bold mb-2 shadow-sm bg-light bg-opacity-75 rounded-circle px-3 py-4"><%= classroom.getClassName() %></h6>
			                    
			                    <div class=" d-flex flex-row justify-content-between mb-3">
				                    <form action="AddClassServlet" method="POST" style="display:inline;">
									    <input type="hidden" name="className" value="<%= classroom.getClassName() %>" />
									    <input type="hidden" name="action" id="action" value="edit">
									    <button type="submit" class="btn  btn-sm">
									        <i class="bi bi-pencil"></i>
									    </button>
									</form>
									
									<form action="AddClassServlet" method="get" style="display:inline;">
									    <input type="hidden" name="className" value="<%= classroom.getClassName() %>" />
									    <input type="hidden" name="action" id="action" value="delete">
									    <button type="submit" class="btn  btn-sm">
									        <i class="bi bi-trash"></i>
									    </button>
									</form>
								</div>
			                </div>
			            </div>
			
			            <!-- Right Info -->
			          <div class="col-12 col-sm-8 text-center d-flex flex-row flex-sm-column justify-content-around text-sm-start">
						    <div class="mb-md-1">
						        <label class="fw-bold">Class Teacher:</label>
						        <p><%= classroom.getClassTeacherId() %></p>
						    </div>
						    <div class="mb-0 d-sm-none d-md-block">
						        <label class="fw-bold">Created At:</label>
						        <p><%= classroom.getCreatedAt()  %></p>
						    </div>
						</div>
			        </div>
			    </div>
			</div>
		<% } } %>
		</div>		
		
	</div>		
			
	
</div>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
