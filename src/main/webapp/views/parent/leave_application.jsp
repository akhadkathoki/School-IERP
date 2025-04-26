<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave Applications</title>    
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
	.name{
		color: #292648;
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
	  .card-hover:hover {
       
    transform: scale(1.05); /* Slightly enlarge the card */
    transition: all 0.3s ease-in-out;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2); /* Add a shadow effect */
}
   .truncate-text {
           display: -webkit-box;
           -webkit-line-clamp: 3; /* Limit to 3 lines */
           -webkit-box-orient: vertical;
           overflow: hidden;
           text-overflow: ellipsis;
       }
</style>
<body class="body ">

<%@ include file='staticParentComponent.jsp' %>



<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br><br><br>
	<div class="container main  p-3 shadow-sm rounded bg-white d-flex flex-column justify-content-center align-items-start">

	<h1 class="heading-font  text-right">Your Child's Leave Applications</h1>

    <hr class="border  border-secondary border-1 mb-4 w-100 break">	 
	<div class="row w-100">	
	
	<% for (int leave = 0; leave <= 10; leave++ ){%>

		<div class="col-12 col-md-6  pl-2 mb-3 text-white  rounded ">
			<button  class="btn  text-decoration-none text-white" data-bs-toggle="modal" data-bs-target="#Modal_<%= leave %>">
				<div class="mainBtnBg card-hover rounded shadow-sm border-none d-flex flex-column justify-content-around " > 
					<div  class="d-flex flex-row justify-content-start align-items-start ">
						<h5 class="mt-2 mx-3">Attendance</h5>
					</div>		
					<div class="announce-card py-2 px-3 body d-flex flex-column justify-content-center  text-start">
					<strong class="text-dark">10/02/2025 to 10/02/2025</strong>
						<p class="truncate-text text-secondary  fs-6">Dear Students, From 10-02-2025 to 15-02-2025 your first terminal exam is starting so study well while raising the bar high. Give your best and work for it. I am writing to inform you that I am unwell and unable to come to work today. I am experiencing fever and body aches, and my doctor has advised rest for the day. I will keep you updated on my health status and plan to return... Best of luck !
						</p>
					</div>
				</div>	
			</button>
		</div>	
		
			    <!-- Achievement View More Modal -->
	    <div class="modal fade container bd-example-modal-lg" id="Modal_<%= leave %>" tabindex="-1" aria-labelledby="ModalLabel" aria-hidden="true">
	        <div class="modal-dialog modal-lg">
	            <div class="modal-content">
	                <div class="modal-header pb-2">
	                	<h3 class="fw-bold topic-font">Sick Leave</h3>
	                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	                </div>
	                <div class="modal-body row">
	                	
	                	<div class="col-12  ">
 							<div class="w-100 p-3 d-flex flex-column justify-content-start text-start">
		  						<h4 class="fw-bold name">Application With Doctor</h4>
		  						<h5 class="fs-6 mb-3">From 26/02/2025 To 26/02/2025</h5>
		  						<p class="text-secondary"> 
		  						I am writing to inform you that I am unwell and unable to come to work today. I am experiencing fever and body aches, and my doctor has advised rest for the day.   I am writing to inform you that I am unwell and unable to come to work today. I am experiencing fever and body aches, and my doctor has advised rest for the day. 

I am writing to inform you that I am unwell and unable to come to work today. I am experiencing fever and body aches, and my doctor has advised rest for the day. 

I will keep you updated on my health status and plan to return...
		  						</p>
							</div>                	
                   		</div>
                	
	                   
	                </div>
	              
	            </div>
	        </div>
	    </div>
	  	
	<% } %>
	</div>		
</div>

</div>

	
  

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
