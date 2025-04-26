<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>    
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
	    
</style>
<body class="body ">

<%@ include file='staticParentComponent.jsp' %>



<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br><br><br>
	<div class="container main  p-3 shadow-sm rounded bg-white d-flex flex-column justify-content-center align-items-start">

	<h1 class="heading-font  text-right">Statistics</h1>

    <hr class="border  border-secondary border-1 mb-4 w-100 break">	 
	<div class="row w-100">	
		<div class="col-12 col-sm-6 col-lg-3 pl-2 mb-3 text-white  rounded ">
			<a href="attendance.jsp" class="text-decoration-none text-white">
				<div class="bg-primary bg-opacity-75 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div  class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-calendar-check fs-1"></i>
						<h4>Attendance</h4>
					</div>		
					<div class="vr border border-light border-2 d-sm-none "></div>
					<div class="d-flex flex-column justify-content-center  align-items-center text-center">
						<h1>10</h1>
					</div>
				</div>	
			</a>
		</div>		

		<div class="col-12 col-sm-6 col-lg-3 pl-2 mb-3 text-white  rounded ">
			<a href="result.jsp" class="text-decoration-none text-white">
				<div class="bg-success bg-opacity-75 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-clipboard-check fs-1"></i>
						<h4>Result</h4>
					</div>		
					<div class="vr border border-light border-2 d-sm-none"></div>
					<div class="d-flex flex-column justify-content-center  align-items-center text-center">
						<h1>10</h1>
					</div>
				</div>		
			</a>		
		</div>
		
		
		<div class="col-12 col-sm-6 col-lg-3 pl-2 mb-3 text-white  rounded ">
			<a href="holidays.jsp" class="text-decoration-none text-white">		
				<div class="bg-secondary bg-opacity-75 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-calendar-heart fs-1"></i>
						<h4>Holidays</h4>
					</div>		
					<div class="vr border border-light border-2 d-sm-none"></div>
					<div class="d-flex flex-column justify-content-center  align-items-center text-center">
						<h1>150</h1>
					</div>
				</div>				
			</a>
		</div>
		
		
		<div class="col-12 col-sm-6 col-lg-3 pl-2 mb-3 text-white  rounded ">
			<a href="achievements.jsp" class="text-decoration-none text-white">

				<div class="bg-danger bg-opacity-75 p-4 rounded shadow-sm border-none d-flex flex-row justify-content-around align-items-center" > 
					<div class="d-flex flex-column justify-content-center align-items-center text-center">
						<i class="bi bi-trophy fs-1"></i>
						<h4>Achievements</h4>
					</div>		
					<div class="vr border border-light border-2 d-sm-none"></div>
					<div class="d-flex flex-column justify-content-center  align-items-center text-center">
						<h1>15</h1>
					</div>
				</div>	
			</a>			
		</div>
		
		
	</div>		
</div>

<div class="container p-0">
	<div class="row p-0" >
		<div class="col-12 col-md-6  p-3">
			<div class="  shadow-sm p-2 rounded bg-white w-100 h-100">
				<h1 class="heading-font  text-right">Child 1 Details</h1>
  				<hr class="border  border-secondary border-1 mb-3 w-100 break">	 
  				<div class="row">
	  				<div class="col-12 col-lg-4   d-flex flex-column justify-content-start align-items-center">  	
	  					<div class="w-100 p-3 d-flex flex-column justify-content-start align-items-center">
		  					<img class="p-prc mb-3 rounded-circle border border-4 border-primary" alt=""  src="https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_640.jpg">
		  					<div class="d-flex flex-row  w-100 justify-content-around">
			  					<button class="btn  px-5 text-white" style="background-color: #292648;">Print</button>
							</div>
						</div>
	  				</div>
	  				
	  				<div class="col-12 col-lg-8   d-flex flex-column justify-content-start align-items-center">  	
	  					<div class="w-100 p-3 d-flex flex-row justify-content-start align-items-center">
		  					<table class="table table-borderless">
							 <tbody>
							    <tr>
							      <th scope="row">Student No.:</th>
							      <td>22SOECE11630</td>
							    </tr>
							    <tr>
							      <th scope="row">Name:</th>
							      <td>Ruchi Pathak</td>
							    </tr>
							    <tr>
							      <th scope="row">Date of Birth</th>
							      <td colspan="2">2002-04-06</td>
							    </tr>
							    <tr>
							      <th scope="row">Gender</th>
							      <td colspan="2">Female</td>
							    </tr>
							    <tr>
							      <th scope="row">Father's Name:</th>
							      <td colspan="2">Kiran Pathak</td>
							    </tr>
							    <tr>
							      <th scope="row">Birth Certificate No: </th>
							      <td colspan="2">Sarina Pathak</td>
							    </tr>
							    <tr>
							      <th scope="row">Class:</th>
							      <td colspan="2">7</td>
							    </tr>
							    <tr>
							      <th scope="row">Section:</th>
							      <td colspan="2">A</td>
							    </tr>
							    <tr>
							      <th scope="row">Roll No:</th>
							      <td colspan="2">49</td>
							    </tr>
							    <tr>
							      <th scope="row">House:</th>
							      <td colspan="2">Green</td>
							    </tr>
							    <tr>
							      <th scope="row">Current Address:</th>
							      <td colspan="2">Gharapjhong-3, Mustang, Nepal</td>
							    </tr>
							    <tr>
							      <th scope="row">Permanent Address:</th>
							      <td colspan="2">Gharapjhong-3, Mustang, Nepal</td>
							    </tr>
							    
							  </tbody>
							</table>
						</div>
	  				</div>
	  			</div>
			</div>
		</div>
		
		<div class="col-12 col-md-6 p-3 ">
			<div class="d-flex  flex-column justify-content-center ">
				<div class=" w-100 h-100  p-2 shadow-sm rounded bg-white">
					<h1 class="heading-font  text-right">Announcements</h1>
	  				<hr class="border  border-secondary border-1 mb-3 w-100 break">	 
	  				
	  				<div class="d-flex shadow-sm flex-column justfy-content-start overflow-auto" style="height: 600px;">
 						
 						<% for (int announcement = 0; announcement <= 10; announcement++ ){%>
 							<!-- Announcement Card -->
		  					<div class="p-3 mb-3 announce-card shadow-sm rounded d-flex flex-column justify-content-start "> 
		  						<p class="mb-1" style="font-size: 16px; color: #626161;">24th Feb 2025</p>
			  					<div class="mb-1 d-flex flex-row justify-content-between p-0 "> 
			  						<h2 class="fw-bold" style="font-size: 20px; color: #292648;">📢 Exam Announcement! 📢</h2>
			  						<p class="" style="font-size: 16px; color: #626161;">02:30 PM</p>
			  					</div>
		  						<p class="mb-0 " style="font-size: 18px; color: #626161;">We are exited to announce you that your Second Terminal Exam about to start form 21rd of Ashwin to 5th of Kartik so do check the.........</p>
		  					</div>
	  					
						<% } %>
	  					  			
	  				</div>
				</div>
				
	
			</div>
		</div>
	
	</div>
</div>
	
	
</div>

  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
