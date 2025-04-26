<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
		height: 500px ;
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

<div class="container   p-3 d-flex flex-column justify-content-center align-items-start">
	<br><br>
	
	<% for(int classs = 1; classs <= 10; classs++) { %>
	
		<!-- Subject wise Attendance -->
	    <div class="container main mt-4 p-3 shadow-sm mb-3 rounded bg-white  d-flex flex-column justify-content-center align-items-start">
		<h1 class="heading-font  text-right fs-2">Class <%= classs %></h1>
	    <hr class="border  border-dark border-1 mb-4 w-100 break">	 
		<div class="w-100 table-responsive">
	        <table class="table table-bordered ">
	            <thead class="">
	                <tr class="" >
	                    <th class="text-center" style="color: white; background-color: #292648">S No.</th>
	                    <th class="text-center" style="color: white; background-color: #292648">ID</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Roll No.</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Photo</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Name</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Gender</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Parents Name</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Class</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Section</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Address</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Mobile</th>
	                    <th class="text-center" style="color: white; background-color: #292648">Action</th>
	
	
	                </tr>
	            </thead>
	            <tbody>
	       			<% for(int student = 1; student <= 50; student++) {
	       				if(student % 2 != 0 ){
	       			%>          
		                <tr class="">
		                    <td style="background-color:#EBF4FF;"><%= student %></td>
		                    <td style="background-color:#EBF4FF;">Nepali</td>
		                    <td style="background-color:#EBF4FF;">16</td>
		                    <td style="background-color:#EBF4FF;">9</td>
		                    <td style="background-color:#EBF4FF;">Abhishek Khadkathoki</td>
		                    <td style="background-color:#EBF4FF;">Male%</td>
		                    <td style="background-color:#EBF4FF;">Nepali</td>
		                    <td style="background-color:#EBF4FF;">10</td>
		                    <td style="background-color:#EBF4FF;">A</td>
		                    <td style="background-color:#EBF4FF;">Gharapjhong-3, Mustang, Nepal</td>
		                    <td style="background-color:#EBF4FF;">9842850403</td>
		                    <td style="background-color:#EBF4FF;">81.82%</td>
	
		                </tr>
		            	<%}else{ %>
		            	<tr class="">
		                    <td style="background-color:#DEEDFF;"><%= student %></td>
		                    <td style="background-color:#DEEDFF;">Nepali</td>
		                    <td style="background-color:#DEEDFF;">16</td>
		                    <td style="background-color:#DEEDFF;">9</td>
		                    <td style="background-color:#DEEDFF;">2</td>
		                    <td style="background-color:#DEEDFF;">81.82%</td>
		                    <td style="background-color:#DEEDFF;">Nepali</td>
		                    <td style="background-color:#DEEDFF;">16</td>
		                    <td style="background-color:#DEEDFF;">9</td>
		                    <td style="background-color:#DEEDFF;">2</td>
		                    <td style="background-color:#DEEDFF;">81.82%</td>
		                    <td style="background-color:#DEEDFF;">81.82%</td>
		                </tr>
		            	<% } 
		            }%>
	            </tbody>
	        </table>
	
	     </div>
	    </div>
	 
	 <% } %>
</div>
	
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>