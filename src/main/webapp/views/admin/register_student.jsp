<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String selectedTab = (String) request.getAttribute("tab");
	String student_id = String.valueOf(request.getAttribute("studentId"));
    if (selectedTab == null) {
        selectedTab = "personalInfo"; // only default if nothing is set
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Registration</title>
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
    <h1 class="heading-font text-right fs-2">Register Student</h1>
    <hr class="border border-secondary border-1 mb-4 w-100 break">

    <!-- Navigation Tabs -->
    <ul class="nav nav-tabs bg-dark d-flex flex-row justify-content-around align-items-center rounded w-100 border-none" id="registrationTabs" style="color: #292648;">
        <li class="nav-item"><a class="nav-link text-center <%= selectedTab.equals("personalInfo") ? "active text-dark fw-bold " : "text-white disabled" %>" href="?tab=personalInfo" data-bs-toggle="tab" >Personal Info</a></li>
        <li class="nav-item"><a class="nav-link text-center <%= selectedTab.equals("tempAddress") ? "active text-dark fw-bold " : "text-white disabled" %>" href="?tab=tempAddress" data-bs-toggle="tab" >Temporary Address</a></li>
        <li class="nav-item"><a class="nav-link text-center <%= selectedTab.equals("permAddress") ? "active text-dark fw-bold " : "text-white disabled" %>" href="?tab=permAddress" data-bs-toggle="tab" >Permanent Address</a></li>
        <li class="nav-item"><a class="nav-link text-center <%= selectedTab.equals("academicInfo") ? "active text-dark fw-bold " : "text-white disabled" %>" href="?tab=academicInfo" data-bs-toggle="tab" >Academic Info</a></li>
        <li class="nav-item"><a class="nav-link text-center <%= selectedTab.equals("healthInfo") ? "active text-dark fw-bold " : "text-white disabled" %>" href="?tab=healthInfo" data-bs-toggle="tab" >Health Info</a></li>
        <li class="nav-item"><a class="nav-link text-center <%= selectedTab.equals("scholarshipInfo") ? "active text-dark fw-bold " : "text-white disabled" %>" href="?tab=scholarshipInfo" data-bs-toggle="tab" >Scholarship Info</a></li>
    </ul>

    <!-- Tab Content -->
    <div class="container tab-content main mt-3 p-3 shadow-sm rounded bg-white">
    
        <!-- Student Personal Information -->
        <div class="tab-pane fade  <%= selectedTab.equals("personalInfo") ? "show active" : "" %>"  id="personalInfo">
            <h1 class="heading-font">Personal Information</h1>
            <hr class="border border-secondary border-1 mb-4 w-100 break">
            
            <form id="studentPersonalInfo" method="post" action="RegStuPerInfo" class="row" enctype="multipart/form-data">
                <div class="col-md-6 mb-3">
                    <label class="role">Role</label>
                    <input type="text" name="role" disabled class="form-control rounded subName" id="role" value="student">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Full Name:</label>
                    <input type="text" name="full_name" class="form-control rounded subName" placeholder="Enter full name">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Date of Birth:</label>
                    <input type="date" name="date_of_birth" class="form-control rounded subName">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Gender:</label>
                    <select name="gender" class="form-control rounded subName">
                        <option value="">Select Gender</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Nationality:</label>
                    <input type="text" name="nationality" class="form-control rounded subName" placeholder="Enter nationality">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Birth Registration No:</label>
                    <input type="text" name="birth_registration_no" class="form-control rounded subName" placeholder="Enter birth registration number">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Profile Picture:</label>
                    <input type="file" name="profile_picture" class="form-control subName rounded" >
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Father's Name:</label>
                    <input type="text" name="father_name" class="form-control subName rounded" placeholder="Enter father's name">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Mother's Name:</label>
                    <input type="text" name="mother_name" class="form-control subName rounded" placeholder="Enter mother's name">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Grandfather's Name:</label>
                    <input type="text" name="grandfather_name" class="form-control subName rounded" placeholder="Enter grandfather's name">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Username:</label>
                    <input type="text" name="username" class="form-control subName rounded" placeholder="Enter username">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="name">Password:</label>
                    <input type="password" name="password" class="form-control subName rounded" placeholder="Enter password">
                </div>
                
   				 <hr class="border border-secondary border-1 w-100 break">
                <div class="col-12 d-flex flex-row justify-content-end">
                    <button class="btn px-5 text-white mt-3" style="background-color: #292648;">Next</button>
                </div>
            </form>
        </div>

    
		    <!-- Temporary Address -->
		<div class="tab-pane fade <%= selectedTab.equals("tempAddress") ? "show active" : "" %>" id="tempAddress">
		    <h1 class="heading-font text-right">Temporary Address</h1>
		    <hr class="border border-secondary border-1 mb-4 w-100 break">
		    
		    <form id="tempAddressForm" method="post" action="RegTempAddress" class="row">

		          <!-- Student Id -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="student_id" class="col-4 name">Student Id:</label>
		            <input type="text" name="student_id" id="student_id"  class="form-control rounded col-8 subName" readonly value="<%= student_id%>">
		        </div>
						        
		          <!-- Province -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="province" class="col-4 name">Province:</label>
		            <input type="text" name="province" id="province" class="form-control rounded col-8 subName" placeholder="Enter province">
		        </div>
				
		        <!-- District -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="district" class="col-4 name">District:</label>
		            <input type="text" name="district" id="district" class="form-control rounded col-8 subName" placeholder="Enter district">
		        </div>
		
		        <!-- Municipality -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="municipality" class="col-4 name">Municipality:</label>
		            <input type="text" name="municipality" id="municipality" class="form-control rounded col-8 subName" placeholder="Enter municipality">
		        </div>
		
		        <!-- Ward -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="ward" class="col-4 name">Ward:</label>
		            <input type="number" name="ward" id="ward" class="form-control rounded col-8 subName" placeholder="Enter ward number">
		        </div>
		
		        <!-- Street -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="street" class="col-4 name">Street:</label>
		            <input type="text" name="street" id="street" class="form-control rounded col-8 subName" placeholder="Enter street name">
		        </div>
   				
   				 <hr class="border border-secondary border-1  w-100 break">
		        <!-- Save Button -->
		        <div class="col-12 d-flex flex-row justify-content-end">
                    <button class="btn px-5 text-white mt-3" style="background-color: #292648;">Next</button>
		        </div>
		
		    </form>
		    
		</div>
		
				<!-- Permanent Address -->
		<div class="tab-pane fade <%= selectedTab.equals("permAddress") ? "show active" : "" %>"  id="permAddress">
		    <h1 class="heading-font text-right">Permanent Address</h1>
		    <hr class="border border-secondary border-1 mb-4 w-100 break">
			<% 
				String student_id_1 = String.valueOf(request.getAttribute("studentId1"));

			%>
		    <form id="permAddressForm" method="post" action="RegPermAddress" class="row">
				 <!-- Student Id -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="student_id" class="col-4 name">Student Id:</label>
		            <input type="text" name="student_id" id="student_id" readonly class="form-control rounded col-8 subName" value="<%= student_id_1 %>">
		        </div>	
		        <!-- Province -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="permProvince" class="col-4 name">Province:</label>
		            <input type="text" name="permProvince" id="permProvince" class="form-control rounded col-8 subName" placeholder="Enter province">
		        </div>
		
		        <!-- District -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="permDistrict" class="col-4 name">District:</label>
		            <input type="text" name="permDistrict" id="permDistrict" class="form-control rounded col-8 subName" placeholder="Enter district">
		        </div>
		
		        <!-- Municipality -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="permMunicipality" class="col-4 name">Municipality:</label>
		            <input type="text" name="permMunicipality" id="permMunicipality" class="form-control rounded col-8 subName" placeholder="Enter municipality">
		        </div>
		
		        <!-- Ward -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="permWard" class="col-4 name">Ward:</label>
		            <input type="number" name="permWard" id="permWard" class="form-control rounded col-8 subName" placeholder="Enter ward number">
		        </div>
		
		        <!-- Street -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="permStreet" class="col-4 name">Street:</label>
		            <input type="text" name="permStreet" id="permStreet" class="form-control rounded col-8 subName" placeholder="Enter street name">
		        </div>
   				 <hr class="border border-secondary border-1  w-100 break">
		        <!-- Save Button -->
		        <div class="col-12 d-flex flex-row justify-content-end">
                    <button class="btn px-5 text-white mt-3" style="background-color: #292648;">Next</button>
		        </div>
		
		    </form>
		</div>
		
				<!-- Academic Information -->
		<div class="tab-pane fade <%= selectedTab.equals("academicInfo") ? "show active" : "" %>" id="academicInfo">
		    <h1 class="heading-font text-right">Academic Information</h1>
		    <hr class="border border-secondary border-1 mb-4 w-100 break">
			<% 
				String student_id_2 = String.valueOf(request.getAttribute("studentId2"));

			%>
		    <form id="academicInfoForm" method="post" action="RegAcademicInfo" class="row" enctype="multipart/form-data">
				
				<!-- Student Id -->
				<div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="student_id" class="col-4 name">Student Id:</label>
		            <input type="text" name="student_id" id="student_id" readonly class="form-control rounded col-8 subName" value="<%= student_id_2 %>">
		        </div>	
		        
		        <!-- Previous School Name -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="prevSchoolName" class="col-4 name">Previous School Name:</label>
		            <input type="text" name="prevSchoolName" id="prevSchoolName" class="form-control rounded col-8 subName" placeholder="Enter previous school name">
		        </div>
		
		        <!-- Previous School Address -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="prevSchoolAddress" class="col-4 name">Previous School Address:</label>
		            <input type="text" name="prevSchoolAddress" id="prevSchoolAddress" class="form-control rounded col-8 subName" placeholder="Enter previous school address">
		        </div>
		
		        <!-- Previous Academic Grade -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="prevAcademicGrade" class="col-4 name">Previous Academic Grade:</label>
		            <input type="text" name="prevAcademicGrade" id="prevAcademicGrade" class="form-control rounded col-8 subName" placeholder="Enter previous academic grade">
		        </div>
		
		        <!-- Academic Record -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="academicRecord" class="col-4 name">Academic Record:</label>
		            <textarea name="academicRecord" id="academicRecord" class="form-control rounded col-8 subName" placeholder="Enter academic record"></textarea>
		        </div>
		
		        <!-- Character Certificate (File Upload) -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="characterCertificate" class="col-4 name">Character Certificate:</label>
		            <input type="file" name="characterCertificate" id="characterCertificate" class="form-control rounded col-8 subName">
		        </div>
		
		        <!-- Mark Sheet (File Upload) -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="markSheet" class="col-4 name">Mark Sheet:</label>
		            <input type="file" name="markSheet" id="markSheet" class="form-control rounded col-8 subName">
		        </div>
		
		        <!-- Language Proficiency -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="languageProficiency" class="col-4 name">Language Proficiency:</label>
		            <input type="text" name="languageProficiency" id="languageProficiency" class="form-control rounded col-8 subName" placeholder="Enter language proficiency">
		        </div>
   				 <hr class="border border-secondary border-1 w-100 break">
		        <!-- Save Button -->
		        <div class="col-12 d-flex flex-row justify-content-end">
                    <button class="btn px-5 text-white mt-3" style="background-color: #292648;">Next</button>
		        </div>
		
		    </form>
		</div>
		
				<!-- Health Information -->
		<div class="tab-pane fade <%= selectedTab.equals("healthInfo") ? "show active" : "" %>"  id="healthInfo">
		    <h1 class="heading-font text-right">Health Information</h1>
		    <hr class="border border-secondary border-1 mb-4 w-100 break">
		
		    <form id="healthInfoForm" method="post" action="RegHealthInfo" class="row">
				
				<% 
				String student_id_3 = String.valueOf(request.getAttribute("studentId3"));

				%>
				
				  <!-- Student Id -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="student_id" class="col-4 name">Student Id:</label>
		            <input type="text" name="student_id" id="student_id"  class="form-control rounded col-8 subName" readonly value="<%= student_id_3 %>">
		        </div>
		        
		        <!-- Blood Group -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="bloodGroup" class="col-4 name">Blood Group:</label>
		            <input type="text" name="bloodGroup" id="bloodGroup" class="form-control rounded col-8 subName" placeholder="Enter blood group">
		        </div>
		
		        <!-- Medical Details -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="medicalDetails" class="col-4 name">Medical Details:</label>
		            <textarea name="medicalDetails" id="medicalDetails" class="form-control rounded col-8 subName" placeholder="Enter medical details"></textarea>
		        </div>
   				 <hr class="border border-secondary border-1 w-100 break">
		        <!-- Save Button -->
		        <div class="col-12 d-flex flex-row justify-content-end">
                    <button class="btn px-5 text-white mt-3" style="background-color: #292648;">Next</button>
		        </div>
		
		    </form>
		</div>
		
		<!-- Scholarship Information -->
		<div class="tab-pane fade <%= selectedTab.equals("scholarshipInfo") ? "show active" : "" %>" id="scholarshipInfo">
		    <h1 class="heading-font text-right">Scholarship Information</h1>
		    <hr class="border border-secondary border-1 mb-4 w-100 break">
		
		    <form id="scholarshipInfoForm" method="post" action="RegScholarshipInfo" class="row mb-3">
				
				<% 
					String student_id_4 = String.valueOf(request.getAttribute("studentId4"));
				%>
				
				  <!-- Student Id -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="student_id" class="col-4 name">Student Id:</label>
		            <input type="text" name="student_id" id="student_id"  class="form-control rounded col-8 subName" readonly value="<%= student_id_4 %>">
		        </div>
				
		        <!-- Eligibility Status -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="eligibilityStatus" class="col-4 name">Eligibility Status:</label>
		            <input type="text" name="eligibilityStatus" id="eligibilityStatus" class="form-control rounded col-8 subName" placeholder="Enter eligibility status">
		        </div>
		        
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="eligibilityName" class="col-4 name">Eligibility Name:</label>
		            <input type="text" name="eligibilityName" id="eligibilityName" class="form-control rounded col-8 subName" placeholder="Enter eligibility Name or NA">
		        </div>
		
		        <!-- Scholarship Amount -->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <label for="scholarshipAmount" class="col-4 name">Scholarship Amount:</label>
		            <input type="number" step="0.01" name="scholarshipAmount" id="scholarshipAmount" class="form-control rounded col-8 subName" placeholder="Enter scholarship amount">
		        </div><br><br>
		         <!-- LIst Type-->
		        <div class="col-12 mb-3 col-md-6 d-flex flex-column">
		            <input type="hidden" name="listType" id="listType" class="form-control rounded col-8 subName" value="all">
		        </div><br><br>
		        
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