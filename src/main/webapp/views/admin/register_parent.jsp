<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% String selectedTab = "personalInfo";  %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Parent Registration</title>
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
    <h1 class="heading-font text-right fs-2">Register Parent</h1>
    <hr class="border border-secondary border-1 mb-4 w-100 break">

  

    <!-- Tab Content -->
    <div class="container tab-content main mt-3 p-3 shadow-sm rounded bg-white">
    
        <!-- Student Personal Information -->
        <div class="tab-pane fade  <%= selectedTab.equals("personalInfo") ? "show active" : "" %>"  id="personalInfo">
            <h1 class="heading-font">Parent Information</h1>
            <hr class="border border-secondary border-1 mb-4 w-100 break">
            
            <form id="studentPersonalInfo" method="post" action="RegStuPerInfo" class="row">
           							
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="role" class="name">Role:</label>
				    <input type="text" id="role" disabled name="role" class="form-control subName rounded" value="parent">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="student_id" class="name">Student ID:</label>
				    <input type="number" id="student_id" name="student_id" class="form-control subName rounded" placeholder="Enter student ID">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="full_name" class="name">Full Name:</label>
				    <input type="text" id="full_name" name="full_name" class="form-control subName rounded" placeholder="Enter full name">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="gender" class="name">Gender:</label>
				    <select id="gender" name="gender" class="form-control subName rounded">
				        <option value="">Select gender</option>
				        <option value="Male">Male</option>
				        <option value="Female">Female</option>
				        <option value="Other">Other</option>
				    </select>
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="date_of_birth" class="name">Date of Birth:</label>
				    <input type="date" id="date_of_birth" name="date_of_birth" class="form-control subName rounded">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="nationality" class="name">Nationality:</label>
				    <input type="text" id="nationality" name="nationality" class="form-control subName rounded" placeholder="Enter nationality">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="relationship_with_student" class="name">Relationship with Student:</label>
				    <select id="relationship_with_student" name="relationship_with_student" class="form-control subName rounded">
				        <option value="">Select relationship</option>
				        <option value="Father">Father</option>
				        <option value="Mother">Mother</option>
				        <option value="Guardian">Guardian</option>
				    </select>
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="contact_number" class="name">Contact Number:</label>
				    <input type="text" id="contact_number" name="contact_number" class="form-control subName rounded" placeholder="Enter contact number">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="email_address" class="name">Email Address:</label>
				    <input type="email" id="email_address" name="email_address" class="form-control subName rounded" placeholder="Enter email">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="username" class="name">Username:</label>
				    <input type="number" id="username" name="username" class="form-control subName rounded" placeholder="Enter username">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="password" class="name">Password:</label>
				    <input type="password" id="password" name="password" class="form-control subName rounded" placeholder="Enter password">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="permanent_address" class="name">Permanent Address:</label>
				    <input type="text" id="permanent_address" name="permanent_address" class="form-control subName rounded" placeholder="Enter permanent address">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="temporary_address" class="name">Temporary Address:</label>
				    <input type="text" id="temporary_address" name="temporary_address" class="form-control subName rounded" placeholder="Enter temporary address">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="citizenship_number" class="name">Citizenship Number:</label>
				    <input type="text" id="citizenship_number" name="citizenship_number" class="form-control subName rounded" placeholder="Enter citizenship number">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="citizenship_issue_place" class="name">Citizenship Issue Place:</label>
				    <input type="text" id="citizenship_issue_place" name="citizenship_issue_place" class="form-control subName rounded" placeholder="Enter issue place">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="citizenship_issue_date" class="name">Citizenship Issue Date:</label>
				    <input type="date" id="citizenship_issue_date" name="citizenship_issue_date" class="form-control subName rounded">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="occupation" class="name">Occupation:</label>
				    <input type="text" id="occupation" name="occupation" class="form-control subName rounded" placeholder="Enter occupation">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="annual_income" class="name">Annual Income:</label>
				    <input type="number" step="0.01" id="annual_income" name="annual_income" class="form-control subName rounded" placeholder="Enter annual income">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="highest_qualification" class="name">Highest Qualification:</label>
				    <input type="text" id="highest_qualification" name="highest_qualification" class="form-control subName rounded" placeholder="Enter qualification">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="emergency_contact_name" class="name">Emergency Contact Name:</label>
				    <input type="text" id="emergency_contact_name" name="emergency_contact_name" class="form-control subName rounded" placeholder="Enter emergency contact name">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="emergency_contact_number" class="name">Emergency Contact Number:</label>
				    <input type="text" id="emergency_contact_number" name="emergency_contact_number" class="form-control subName rounded" placeholder="Enter emergency contact number">
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="relationship_with_emergency_contact" class="name">Relationship with Emergency Contact:</label>
				    <select id="relationship_with_emergency_contact" name="relationship_with_emergency_contact" class="form-control subName rounded">
				        <option value="">Select relationship</option>
				        <option value="Brother">Brother</option>
				        <option value="Sister">Sister</option>
				        <option value="Friend">Friend</option>
				        <option value="Other">Other</option>
				    </select>
				</div>
				
				<div class="col-md-6 col-lg-3 mb-3">
				    <label for="photo" class="name">Photo:</label>
				    <input type="file" id="photo" name="photo" class="form-control subName rounded">
				</div>
              	
              	 <hr class="border border-secondary border-1 mt-3 mb-1 w-100 break">

		        <!-- Save Button -->
		        <div class="col-12 d-flex flex-row justify-content-end">
                    <button class="btn px-5 text-white mt-3" style="background-color: #292648;">Register</button>
		        </div>
		
		    </form>
		    
		</div>		
	
		
		
		
    </div> 
</div>
</body>
</html>