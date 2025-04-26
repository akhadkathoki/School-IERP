<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Holidays</title>    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    
</head>
<style>
	.light-bg{
		background-color: #EBF4FF;
	}
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
		background-color: #EBF4FF ;
	}
	.main{
		
	}
	.break{
		margin-top: -1px;
	}
</style>
<body class="body ">

<%@ include file='staticStudentComponent.jsp' %>

<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br>
<div class="container main  mt-4 p-3 bg-transparent d-flex flex-column justify-content-center align-items-start">
	<h1 class="heading-font  text-right fs-2">Holidays</h1>

    <hr class="border  border-dark border-2 mb-4 w-100 break">	 
	<div class="row w-100">	
	
		<div class="col-12  col-lg-5 pl-2 mb-3 text-white  rounded ">
			<div class=" d-flex flex-column justify-content-start align-items-center" > 
			
				<div class="light-bg w-100 p-4 mb-3 d-flex flex-column justify-content-center align-items-center text-center rounded shadow border-none ">
					<h4 id="monthYear" class="name mt-3 fs-2 fw-bold text-center">Feb 2025</h4>
					<h1 id="date" class="  fw-bold text-center text-danger " style="font-size: 90px;">26</h1>
					<h4 id="day" class="name fs-3  text-center">Wednesday</h4>
					
				    <hr class="border  border-dark border-1 mt-3 mb-3 w-100 break">	 
				
					<h4 id="hName" class=" fs-3 mb-3 fw-bold text-center text-danger">Maha Shivratri</h4>
					<p id="hDesctiption" class="text-secondary text-center ">Maha Shivratri is a Hindu festival that honors the god Shiva and celebrates his marriage to Parvati. It's also a time to remember Shiva's cosmic dance, the Tandava, and to overcome ignorance and darkness. </p>
				</div>		
			</div>	
		</div>		

		<div class="col-12 col-lg-7 pl-2 mb-3 text-white  rounded ">
			<!-- Information as per category  -->

				<div class="p-3 pl-4 shadow-sm mb-3 rounded bg-white d-flex flex-column justify-content-center align-items-start" > 
					<h1 class="heading-font  text-right">All Holidays</h1>
				    <hr class="border  border-dark border-1 mb-4 w-100 break">	 
					<div class="w-100 table-responsive">
						 <table class="table table-bordered ">
				            <thead class="">
				                <tr class="" >
				                    <th class="text-center" style="color: white; background-color: #292648">Name</th>
				                    <th class="text-center" style="color: white; background-color: #292648">From (Date)</th>
				                    <th class="text-center" style="color: white; background-color: #292648">To Date</th>
				                </tr>
				            </thead> 
				            <tbody>
				       			<% for(int subData = 1; subData <= 20; subData++) {
				       				if(subData % 2 != 0 ){
				       			%>          
					                <tr class="text-center ">
					                    <td style="background-color:#EBF4FF;">Maha Shivaratri</td>
					                    <td style="background-color:#EBF4FF;">25/02/2025</td>
					                    <td style="background-color:#EBF4FF;">25/02/2025</td>
					                </tr>
					            	<%}else{ %>
					            	<tr class="text-center ">
					                    <td style="background-color:#DEEDFF;">Maha Shivaratri</td>
					                    <td style="background-color:#DEEDFF;">25/02/2025</td>
					                    <td style="background-color:#DEEDFF;">25/02/2025</td>
					                </tr>
					            	<% } 
					            }%>
				            </tbody>
				        </table>
					</div>
				</div>
		</div>
	</div>		
</div>
</div>


<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
