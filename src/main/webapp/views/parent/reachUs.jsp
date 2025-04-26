<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacts</title> 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
       
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

<%@ include file='staticParentComponent.jsp' %>

<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br>
<div class="container main  mt-4 p-3 bg-transparent d-flex flex-column justify-content-center align-items-start">
	<h1 class="heading-font  text-right fs-2">Reach Us Here</h1>

    <hr class="border  border-dark border-2 mb-4 w-100 break">	 
	<div class="row w-100">	
	
				<div class="col-12 pl-2 mb-3 text-white  rounded ">
			<!-- Information as per category  -->

				<div class="p-3 pl-4 shadow-sm mb-3 rounded bg-white d-flex flex-column justify-content-center align-items-start" > 
					<h1 class="heading-font  text-right">Contact Info</h1>
				    <hr class="border  border-dark border-1 mb-4 w-100 break">	 
					<div class="w-100 table-responsive">
						 <table class="table table-bordered w-100 overflow-auto">
				            <thead class="">
				                <tr class="" >
				                    <th class="text-center" style="color: white; background-color: #292648">Name</th>
				                    <th class="text-center" style="color: white; background-color: #292648">Role</th>
				                    <th class="text-center" style="color: white; background-color: #292648">Phone No.</th>
		                            <th class="text-center" style="color: white; background-color: #292648">Email</th>
				                </tr>
				            </thead> 
				            <tbody>
				       			<% for(int subData = 1; subData <= 15; subData++) {
				       				if(subData % 2 != 0 ){
				       			%>          
					                <tr class="text-center ">
					                    <td style="background-color:#EBF4FF;">Jeena Subedi</td>
					                    <td style="background-color:#EBF4FF;">Teacher</td>
					                    <td style="background-color:#EBF4FF;">9888383383</td>
					                    <td style="background-color:#EBF4FF;">jsubedi@gmail.com</td>
	
					                </tr>
					            	<%}else{ %>
					            	<tr class="text-center ">
					                    <td style="background-color:#DEEDFF;">Ram Sahi</td>
					                    <td style="background-color:#DEEDFF;">Teacher</td>
					                    <td style="background-color:#DEEDFF;">8838833883</td>
					                    <td style="background-color:#DEEDFF;">rsahi@gmail.com</td>
	
					                </tr>
					            	<% } 
					            }%>
				            </tbody>
				        </table>
					</div>
				</div>
		</div>

		
		
	
		<div class="col-12   pl-2 mb-3 text-white  rounded ">
			<div class=" d-flex flex-column justify-content-start " > 
			
				<div class="light-bg w-100 p-3 mb-3 d-flex flex-column justify-content-center align-items-center text-center rounded shadow border-none ">
					<h2 class="heading-font  text-right">Additional School Info</h2>
				    <hr class="border  border-dark border-1 mb-4 w-100 break">	 

					<p id="hDesctiption" class="text-secondary text-center ">For Latest News And Updates, Get In Touch Via   </p>
					
					<div class="w-50 mb-3 d-flex flex-row justify-content-around align-items-center">
					    <a href="#"><i class="fs-1 name fab fa-facebook"></i></a>
					    <a href="#"><i class="fs-1 name fab fa-linkedin"></i></a>
					    <a href="#"><i class="fs-1 name fab fa-whatsapp"></i></a>
					</div>
				</div>		
			</div>	
		</div>		


	</div>		
</div>

</div>

<footer class="bg-dark text-white text-center py-3">
  <div class="container">
    <p>&copy; 2025 Your Company Name. All Rights Reserved.</p>
    <p>
      <a href="#" class="text-white text-decoration-none mx-2">Privacy Policy</a> | 
      <a href="#" class="text-white text-decoration-none mx-2">Terms of Service</a> | 
      <a href="#" class="text-white text-decoration-none mx-2">Contact Us</a>
    </p>
  </div>
  
	 <div class=" d-flex flex-column justify-content-start " > 
			
		<div class="light-bg w-100 p-3 d-flex flex-column justify-content-center align-items-center text-center ">
			<h2 class="heading-font  text-right">Additional School Info</h2>
		    <hr class="border  border-dark border-1 mb-4 w-100 break">	 
	
			<p id="hDesctiption" class="text-secondary text-center ">For Latest News And Updates, Get In Touch Via   </p>
			
			<div class="w-50 mb-3 d-flex flex-row justify-content-around align-items-center">
			    <a href="#"><i class="fs-1 name fab fa-facebook"></i></a>
			    <a href="#"><i class="fs-1 name fab fa-linkedin"></i></a>
			    <a href="#"><i class="fs-1 name fab fa-whatsapp"></i></a>
			</div>
		</div>		
	</div>	
</footer>
<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
