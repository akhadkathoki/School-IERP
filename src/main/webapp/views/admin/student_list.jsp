
<%@page import="com.IERP_FINAL.models.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Students</title>
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
			<h1 class="heading-font  text-right fs-2">Students</h1>
			<a href="register_student.jsp" class="pt-2 btn px-lg-5 px-3 text-white" type="button" style="background-color: #292648;" >
	        	Add
	        </a>
	   	</div>
  	    <hr class="border  border-dark border-1 mb-4 w-100 break">	 
		<div class="w-100 table-responsive">
	        <table class="table  table-hover ">
	            <thead class="">
	                <tr class="" >
	                    <th class="text-center" style="color: white; background-color: #292648">Action</th>
               	        <th class="text-center" style="color: white; background-color: #292648">ID</th>
	               	    <th class="text-center" style="color: white; background-color: #292648">Role</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Photo</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Full Name</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Gender</th>
	                    <th class="text-center" style="color: white; background-color: #292648">DOB</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Father Name</th>
  	                    <th class="text-center" style="color: white; background-color: #292648">Mother Name</th>	                    
	                    <th class="text-center" style="color: white; background-color: #292648">Temperary Address</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Permanent Address</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Admission Date</th>
	                </tr>
	            </thead>
	            <tbody>
		       			<%
						    Object obj = request.getAttribute("studentList");
						    List<Student> studentList = null;
						    
						    if (obj instanceof List<?>) {
						        studentList = (List<Student>) obj;
						    }
						    
						    if (studentList != null) {
						        for (Student student : studentList) {
						%>	
						<tr class="text-center " onclick="window.location.href='GetStudentDetails?id=<%= student.getStudentId() %>'">
							<td class="text-center align-middle" style="background-color:#EBF4FF;">
		                        <button class="btn bg-warning mb-2"><i class="bi bi-pencil" onclick="l"></i></button>
		                        <form action="DeleteStudentServlet" method="POST" style="display:inline;">
								    <input type="hidden" name="studentId" value="<%= student.getStudentId() %>" />
								    <input type="hidden" name="control" id="control" value="edit">
								    <button type="submit" class="btn btn-danger">
								        <i class="bi bi-trash"></i>
								    </button>
								</form>
		                    </td>
							<td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getStudentId() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getRole() %></td>
							<td class="text-center align-middle" style="background-color:#EBF4FF;">
		                    	<% if (student.getProfilePicture() != null) { %>
				                    <img class="rounded-circle image-fluid shadow-sm"
				                     src="data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(student.getProfilePicture())) %>" width="50" height="50" alt="Avatar"/>
				                <% } else { %>
				                    No Image
				                <% } %>
		                 	</td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getFullName() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getGender()%></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getDateOfBirthAd() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getFatherName() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getMotherName() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getTempMunicipality() + "-"+ student.getTempWard() + " " + student.getTempDistrict() + ", " + student.getTempProvince() + ", " + student.getNationality() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getPermMunicipality() + "-"+ student.getPermWard() + " " + student.getPermDistrict() + ", " + student.getPermProvince() + ", " + student.getNationality() %></td>
		                    <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= student.getCreatedAt() %></td>

		                    
		                		                	
		                </tr>
		            	           
		            	<% } 
		            }%>
	            </tbody>
	        </table>
	
	     </div>
    </div>   	
   </div>

	<script>
		  function viewStudentProfile(studentId) {
		    window.location.href = 'GetStudentData?student_id=' + studentId;
	  }
	</script>
   	
   	
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>