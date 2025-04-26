<%@ page import="com.IERP_FINAL.models.Subject, java.util.*, java.sql.*, com.IERP_FINAL.utils.DBConnection,  com.IERP_FINAL.models.StudentMarks" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fetch Your Result</title>    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>

<style>
 body {
      background-color: #f0f2f5;
      font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    }

    .marksheet {
      background-color: #ffffff;
      padding: 40px;
      margin-top: 40px;
      border-radius: 12px;
      box-shadow: 0 0 18px rgba(0, 0, 0, 0.08);
    }

    .marksheet-header img {
      max-height: 70px;
    }

    .marksheet h1 {
      font-weight: bold;
      font-size: 2rem;
    }

    .marksheet h2 {
      font-size: 1.3rem;
      color: #6c757d;
    }

    .table th {
      background-color: #0d6efd;
      color: white;
    }

    .table tbody tr:hover {
      background-color: #f1f1f1;
    }

    .signature-box {
      border-top: 2px solid #000;
      margin-top: 60px;
      padding-top: 8px;
      font-weight: 600;
    }

    @media print {
      .no-print {
        display: none;
      }
    }
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
    .announce-card {
        background-color: #EBF4FF;
    }
    .break {
        margin-top: -1px;
    }
</style>

<body class="body">
<%@ include file='staticStudentComponent.jsp' %>



        

       
        


<div class="container main p-3 d-flex flex-column justify-content-center align-items-start">
    <br><br>
    <div class="row w-100 d-flex flex-row justify-content-center w-100">   
        <div class="col-12 p-3">
            <div class="main mt-4 p-3 shadow-sm rounded bg-white bg-opacity-75 d-flex flex-column justify-content-center align-items-start">
                <h1 class="heading-font text-right fs-4">Fetch Students</h1>
                <hr class="border border-secondary border-1 mb-4 w-100 break">
                <form class="row  w-100" action="FetchMyResultServlet" method="get" id="fetchForm">
                    <input type="hidden" name="studentId" value="<%= studentId %>">
					                    <!-- Action Dropdown -->
	
                  
                    
					<div class="form-group col-12 col-md-6 col-lg-4 mb-3">
                        <label for="year" class="topic-font fw-bold">Year</label>
                        <input type="number" class="form-control shadow-sm rounded" name="year" id="year" placeholder="Enter the Month" >
                    </div>
					<div class="form-group col-12 col-md-6 col-lg-4 mb-3">
					    <label for="term" class="topic-font fw-bold">Term</label>
					    <select class="form-control shadow-sm rounded" name="term" id="term" required>
					        <option value="">---Select Term---</option>
					        <option value="First Term">First Term</option>
					        <option value="Second Term">Second Term</option>
					        <option value="Third Term">Third Term</option>
					    </select>
					</div>

                    <div class="d-flex flex-row justify-content-end">
                        <button type="submit" class="btn btn-sm text-white px-3" style="background-color: #292648;">Fetch</button>
                    </div>
                    
                </form>
            </div>	       
        </div>
    </div>
    
    

    <div class="container main mt-4 p-3 shadow-sm mb-3 rounded bg-white d-flex flex-column justify-content-center align-items-start">
        <div class="w-100 mb-2 d-flex flex-row justify-content-between">
            <h1 class="heading-font text-right fs-2">My Result</h1>
        </div>
        <hr class="border border-dark border-1 mb-4 w-100 break">
        <form class="w-100 table-responsive" action="ResultServlet" method="post">
        
	
				
  <!-- Header -->
    <div class="marksheet-header text-center mb-5">
      <h1 class="fw-bold shadow-sm">SHREE JANAHIT SECONDARY SCHOOL</h1>
      <h2 class="fw-bold">Result</h2>
    </div>

 

    <!-- Result Table -->
    <div class="table-responsive">
      <table class="table table-bordered table-hover text-center align-middle">
        <thead>
          <tr style="background-color: #4F2D19; color: #FAE3C6;">
            <th class="text-center" style="color: white; background-color: #292648">Subject Code</th>
            <th class="text-center" style="color: white; background-color: #292648">Subject Name</th>
            <th class="text-center" style="color: white; background-color: #292648">Internal</th>
            <th class="text-center" style="color: white; background-color: #292648">External</th>
            <th class="text-center" style="color: white; background-color: #292648">Total</th>
            <th class="text-center" style="color: white; background-color: #292648">Grade</th>
          </tr>
        </thead>
        <tbody>
        
        	<%
					    Object obj = request.getAttribute("result");
					    List<StudentMarks> student = null;
					    
					    if (obj instanceof List<?>) {
					        student = (List<StudentMarks>) obj;
					    }
					    
					    if (student != null) {
					        for (StudentMarks st : student) {
					%>	
          <tr>
            <td><%= st.getSubjectId() %></td>
            <td><%= st.getSubjectName() %></td>
            <td><%= st.getFullMarks() %></td>
            <td><%= st.getMarks() %></td>
            <td><strong><%= st.getPercentage() %></strong> %</td>
            <td class=" align-middle bg-info bg-opacity-10"><span ><%= st.getGrade() %></span></td>
          </tr>
        
         
          <!-- Add more rows as needed -->
          <%}} %>
        </tbody>
      </table>
    </div>

<!-- Signature Section -->

        </form>
    </div>
</div>

<script>
	



<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
