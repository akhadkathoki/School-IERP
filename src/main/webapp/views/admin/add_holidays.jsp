<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add Holiday</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</head>

<style>
    .body {
        background-color: #CDD5DB;
    }
    .name {
        color: #292648;
    }
    .subName {
        color: #8E8C8C;
    }
    .mainBtnBg {
        background-color: #292648;
    }
    .heading-font {
        color: #292648;
        font-weight: bold;
        font-size: 24px;
    }
    .p-prc {
        height: 170px;
        width: 170px;
    }
    .announce-card {
        background-color: #EBF4FF;
    }
    .break {
        margin-top: -1px;
    }
</style>

<body class="body">


<%@ include file='staticAdminComponent.jsp' %>

<div class="container main p-3 d-flex flex-column justify-content-center align-items-start">
	<br> <br> <br>
    <h1 class="heading-font text-right fs-2">Add Holidays</h1>
    <hr class="border border-secondary border-1 mb-4 w-100 break">

   <!-- Tab Content -->
    <div class="container tab-content main mt-3 p-3 shadow-sm rounded bg-white">
    
        <!-- Holiday Information -->
        <div class="">
            <h1 class="heading-font">Holiday Details</h1>
            <hr class="border border-secondary border-1 mb-4 w-100 break">
            
            <form  method="post" action="HolidayServlet" class="row" >
            	<input type="hidden" name="action" id="action" value="Add Holiday">
                <div class="col-md-6 mb-3">
                    <label class="role">Holiday Name:</label>
                    <input type="text" name="name"  class="form-control rounded subName" id="name" placeholder="Enter the Holiday Name">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">From (Date):</label>
                    <input type="date" name="fromDate" class="form-control rounded subName" id="fromDate">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">To (Date):</label>
                    <input type="date" name="toDate" class="form-control rounded subName " id="toDate">
                </div>
  
                <div class="col-md-6 mb-3">
                    <label class="name">Description:</label>
                    <textarea name="description" class="form-control rounded subName" id="description" placeholder="Enter about holiday"></textarea>
                </div>
   
                
   				 <hr class="border border-secondary border-1 w-100 break">
                <div class="col-12 d-flex flex-row justify-content-end">
                    <button class="btn px-5 text-white mt-3" style="background-color: #292648;">Add</button>
                </div>
            </form>
        </div>		
		
    </div> 
</div>
</body>
</html>