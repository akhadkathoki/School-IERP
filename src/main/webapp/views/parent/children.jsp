<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Children</title>    
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
	.topic-font{
		color: #292648;
		font-weight: bold;
	}
	.heading-font{
		color: #292648;
		font-weight: bold;
		font-size: 24px;
	}
	.achieveCard{
		text-align: left;
		background-color: #EBF4FF;

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

   .truncate-text {
           display: -webkit-box;
           -webkit-line-clamp: 3; /* Limit to 3 lines */
           -webkit-box-orient: vertical;
           overflow: hidden;
           text-overflow: ellipsis;
       }
       .card-hover:hover {
       
    transform: scale(1.05); /* Slightly enlarge the card */
    transition: all 0.3s ease-in-out;
    box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2); /* Add a shadow effect */
}
</style>
<body class="body container  d-flex flex-column justify-content-center align-items-center vh-100" >

	<div class="row pl-3 w-100 d-flex flex-row justify-content-center ">	
	
	<% for(int achievement = 0; achievement < 3; achievement++) { %>
            <a href="parentDashboard.jsp" class=" pb-1 col-12 text-decoration-none col-md-6 col-lg-3 p-2">
               
                    <div  class="text-decoration-none card-hover  achieveCard rounded shadow-sm " style="background-image: url('https://cdn.pixabay.com/photo/2015/06/22/08/40/child-817373_640.jpg'); background-repeat: no-repeat; background-size: cover; background-position: center; text-align: left;">
                     <div class="  bg-white bg-opacity-75 ">
                        <table class="table  table-borderless">
                            <tbody class="">
                                <tr><th class="bg-primary bg-opacity-25" scope="row">Name:</th><td class="bg-primary bg-opacity-10">Ruchi Pathak</td></tr>
                                <tr><th class="bg-primary bg-opacity-25" scope="row">Class:</th><td class="bg-primary bg-opacity-10">7</td></tr>
                                <tr><th class="bg-primary bg-opacity-25" scope="row">Section:</th><td class="bg-primary bg-opacity-10">A</td></tr>
                                <tr><th class="bg-primary bg-opacity-25" scope="row">Roll No:</th><td class="bg-primary bg-opacity-10">49</td></tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </a>
        <% } %>


</div>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
