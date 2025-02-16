<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile</title>    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    
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
		
	}
	.break{
		margin-top: -1px;
	}
</style>
<body class="body ">

<%@ include file='staticStudentComponent.jsp' %>

<div class="container main  mt-4 p-3 bg-transparent d-flex flex-column justify-content-center align-items-start">
	<h1 class="heading-font  text-right fs-2">Profile</h1>

    <hr class="border  border-dark border-2 mb-4 w-100 break">	 
	<div class="row w-100">	
	
		<div class="col-12  col-lg-3 pl-2 mb-3 text-white  rounded ">
			<div class=" d-flex flex-column justify-content-start align-items-center" > 
				<div class="bg-white w-100 pt-4 mb-3 d-flex flex-column justify-content-center align-items-center text-center rounded shadow-sm border-none ">
		  					<img class="p-prc mb-3 rounded-circle border border-4 border-info shadow"  alt=""  src="https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_640.jpg">
					<h4 class="name fs-2 fw-bold text-center">Rushi Pathak</h4>
					<p class="name text-center fw-bold">Student</p>
				</div>		
				<button class="btn px-3 w-100 text-white mb-3" style="background-color: #292648;">Download PDF</button>
			
			</div>	
		</div>		

		<div class="col-12 col-lg-9 pl-2 mb-3 text-white  rounded ">
			<!-- Information as per category  -->
			<% for(int infoType = 0; infoType <= 3; infoType++) {%>
				<div class="p-3 pl-4 shadow-sm mb-3 rounded bg-white d-flex flex-column justify-content-center align-items-start" > 
					<h1 class="heading-font  text-right">Perosnal Details</h1>
				    <hr class="border  border-dark border-1 mb-4 w-100 break">	 
				
					<div class="row w-100 d-flex  p-2 flex-row justify-content-start align-items-center ">
						<% for(int info = 0; info <= 10; info++) {%>
							<div class="col-12 col-md-6 d-flex flex-row">
								<strong class="col-4 name">Name:</strong>
								<p class="col-8 subName">Abhishek Khadkathoki</p>
							</div>
						<%} %>
					</div>	
				</div>		
			<%} %>		
		</div>
		
	</div>		
</div>


<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
