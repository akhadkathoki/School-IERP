<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.IERP_FINAL.models.Holiday, java.text.SimpleDateFormat" %>

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

<%@ include file='staticTeacherComponent.jsp' %>

<div class="container main  p-3 d-flex flex-column justify-content-center align-items-start">
	<br>
<div class="container main  mt-4 p-3 bg-transparent d-flex flex-column justify-content-center align-items-start">
	<div class="d-flex flex-row justify-content-between w-100">
		<h1 class="heading-font  text-right fs-2">Holidays</h1>

	</div>
    <hr class="border  border-dark border-2 mt-3 mb-4 w-100 break">	 
	<div class="row w-100">	
		
		<div class="col-12  col-lg-5 pl-2 mb-3 text-white  rounded ">
			<div class=" d-flex flex-column justify-content-start align-items-center" > 
			
				<div class="light-bg w-100 p-4 mb-3 d-flex flex-column justify-content-center align-items-center text-center rounded shadow border-none ">
				<%
				Holiday holiday = (Holiday) request.getAttribute("holiday");
			    java.text.SimpleDateFormat dateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd");

			    if (holiday != null) {
			        java.util.Date date = holiday.getFromDate();
			        java.text.SimpleDateFormat dayFormat = new java.text.SimpleDateFormat("EEEE");
			        java.text.SimpleDateFormat monthYearFormat = new java.text.SimpleDateFormat("MMM yyyy");
				%>
					<h4 id="monthYear" class="name mt-3 fs-2 fw-bold text-center"> <%= monthYearFormat.format(date) %></h4>
					<h1 id="date" class="  fw-bold text-center text-danger " style="font-size: 90px;"> <%= new java.text.SimpleDateFormat("dd").format(date) %></h1>
					<h4 id="day" class="name fs-3  text-center"><%= dayFormat.format(date) %></h4>
					
				    <hr class="border  border-dark border-1 mt-3 mb-3 w-100 break">	 
				
					<h4 id="hName" class=" fs-3 mb-3 fw-bold text-center text-danger"><%= holiday.getName() %></h4>
					<p id="hDesctiption" class="text-secondary text-center "><%= holiday.getDescription() %> </p>
					
				<% }  %>
				</div>		
			</div>	
		</div>		

		<div class="col-12 col-lg-7 pl-2 mb-3 text-white  rounded ">
			<!-- Information as per category  -->

				<div class="p-3 pl-4 shadow-sm mb-3 rounded bg-white d-flex flex-column justify-content-center align-items-start" > 
					<h1 class="heading-font  text-right">All Holidays</h1>
				    <hr class="border  border-dark border-1 mb-4 w-100 break">	 
					<div class="w-100 table-responsive">
						 <table class="table table-bordered table-hover">
				            <thead class="">
				                <tr class="" >
				                    <th class="text-center" style="color: white; background-color: #292648">Name</th>
				                    <th class="text-center" style="color: white; background-color: #292648">From (Date)</th>
				                    <th class="text-center" style="color: white; background-color: #292648">To Date</th>
				                </tr>
				            </thead> 
				            <tbody>
				            <%
							    List<Holiday> holidayList = (List<Holiday>) request.getAttribute("holidayList");
							    if (holidayList != null && !holidayList.isEmpty()) {
							        java.text.SimpleDateFormat dateFormats = new java.text.SimpleDateFormat("yyyy-MM-dd");
							        java.text.SimpleDateFormat dayFormats = new java.text.SimpleDateFormat("EEEE");
							        java.text.SimpleDateFormat monthYearFormats = new java.text.SimpleDateFormat("MMM yyyy");
							
							        for (Holiday holidayrow : holidayList) {
							            java.util.Date fromDate = holidayrow.getFromDate();
							            java.util.Date toDate = holidayrow.getToDate();
							%>
								<tr class="text-center" onclick="window.location.href='THolidayServlet?id=<%= 
								    (holidayrow != null) 
								        ? holidayrow.getId() 
								        : (holidayList != null && !holidayList.isEmpty() 
								            ? holidayList.get(0).getId() 
								            : 1) 
								    %>&action=singleView'">
							        <td style="background-color:#EBF4FF;"><%= holidayrow.getName() %></td>
							        <td style="background-color:#EBF4FF;">
							            <%= dateFormats.format(fromDate) %> <br> (<%= dayFormats.format(fromDate) %>)
							        </td>
							        <td style="background-color:#EBF4FF;">
							            <%= dateFormats.format(toDate) %> <br> (<%= dayFormats.format(toDate) %>)
							        </td>
							       
							    </tr>
							<%
							        }
							    }
							%>


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
