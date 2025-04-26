<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.IERP_FINAL.models.Student" %>
<%@ page import="java.util.Base64" %>

<%
    Student student = (Student) request.getAttribute("student");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Profile</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">
    
    <style>
        body {
            background-color: #f4f6f8;
        }

        .profile-card {
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        .profile-image {
            width: 160px;
            height: 160px;
            object-fit: cover;
        }

        .name {
            color: #292648;
        }

        .subName {
            color: #8E8C8C;
        }

        .heading-font {
            color: #292648;
            font-weight: 700;
            font-size: 28px;
        }

        .form-control[disabled] {
            background-color: #f8f9fa;
            font-weight: 500;
        }

        .info-label {
            font-weight: 600;
            color: #292648;
        }

        .download-btn {
            background-color: #292648;
        }

        .break {
            margin-top: -1px;
        }
    </style>
</head>

<body style="background-color: CDD5DB;">
    <%@ include file='staticStudentComponent.jsp' %>
		<br><br>
    <% if (student != null) { %>
        <div class="container py-5">
            <h1 class="heading-font fs-2  mb-2">Hi <strong class="fs-1"> <%= student.getFullName()  %> </strong></h1>
            <hr class="border-dark border-2 mb-5">

            <div class="row g-4">
                <!-- Profile Sidebar -->
                <div class="col-lg-4">
                    <div class="profile-card p-4 text-center">
                        <% if (student.getProfilePicture() != null) { %>
                            <img class="profile-image rounded-circle border border-4 border-info shadow mb-3 p-5 px-3" 
				                     src="data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(student.getProfilePicture())) %>"
                                 alt="Student Photo" height="100" width="100"> 
                        <% } else { %>
                            <img class="profile-image rounded-circle border border-4 border-info shadow mb-3" src="" alt="No Image">
                        <% } %>

                        <h3 class="name fw-bold"><%= student.getFullName()%></h3>
                        <p class="text-muted fw-semibold mb-3"><%= student.getRole() %></p>

						<button class="btn px-3 w-100 text-white mb-3" style="background-color: #292648;">Download PDF</button>
                    </div>
                </div>

                <div class="col-lg-8">
                    <!-- Personal Info -->
                    <div class="profile-card p-4 mb-3">
                        <h4 class="heading-font ">Personal Details</h4>
    		            <hr class="border-dark border-2 mb-3">
                        
                        <form class="row g-3" action="" >
                        	     <!-- Hidden Student ID -->
					        <input type="hidden" id="studentId" name="studentId" value="<%= student.getStudentId() %>">
			
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">ID:</label>
                                <input type="text" id="student_id" name="student_id" class="form-control rounded" value="<%= student.getStudentId() %>" disabled>
                            </div>
                            
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Role:</label>
                                <input type="text" id="role" name="role" class="form-control rounded" value="<%= student.getRole() %>" disabled>
                            </div>
                            
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Full Name:</label>
                                <input type="text" id="full_name" name="full_name" class="form-control rounded" value="<%= student.getFullName() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Username:</label>
                                <input type="text" id="username" name="username" class="form-control rounded" value="<%= student.getUsername() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">DOB:</label>
                                <input type="text" id="dob" name="dob" class="form-control rounded" value="<%= student.getDateOfBirthAd() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Gender:</label>
                                <input type="text" id="role" name="role" class="form-control rounded" value="<%= student.getGender() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Nationality:</label>
                                <input type="text" id="nationality" name="nationality" class="form-control rounded" value="<%= student.getNationality() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">DOB Reg No:</label>
                                <input type="text" id="dob_reg_no" name="dob_reg_no" class="form-control rounded" value="<%= student.getBirthRegistrationNo() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Profile Picture:</label>
                                <input type="file" id="photo" name="photo" class="form-control rounded" value="<%= student.getProfilePicture() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Father Name:</label>
                                <input type="text" id="father_name" name="father_name" class="form-control rounded" value="<%= student.getFatherName() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Mother Name:</label>
                                <input type="text" id="mother_name" name="mother_name" class="form-control rounded" value="<%= student.getMotherName() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Grandfather Name:</label>
                                <input type="text" id="gf_name" name="gf_name" class="form-control rounded" value="<%= student.getGrandfatherName() %>" disabled>
                            </div>
                            <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Created At:</label>
                                <input type="text" id="createdAt" name="createdAt" class="form-control rounded" value="<%= student.getCreatedAt() %>" disabled>
                            </div>                                                       
                        </form>
                    </div>
                  
                    <!-- Temporary Address -->
                    <div class="profile-card p-4 mb-3">
                        <h4 class="heading-font ">Temperary Address</h4>
    		            <hr class="border-dark border-2 mb-3">
                        <form class="row g-3">
                        	     <!-- Hidden Student ID -->
					        <input type="hidden" id="studentId" name="studentId" value="<%= student.getStudentId() %>">
			
                           <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Province:</label>
                                <input type="text" id="tempProvince" name="tempProvince" class="form-control rounded" value="<%= student.getTempProvince() %>" disabled>
                            </div>
                             <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">District:</label>
                                <input type="text" id="tempDistrict" name="tempDistrict" class="form-control rounded" value="<%= student.getTempDistrict() %>" disabled>
                            </div>
                             <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Municipality:</label>
                                <input type="text" id="tempMunicipality" name="tempMunicipality" class="form-control rounded" value="<%= student.getTempMunicipality() %>" disabled>
                            </div>
                             <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Ward:</label>
                                <input type="text" id="tempWard" name="tempWard" class="form-control rounded" value="<%= student.getTempWard() %>" disabled>
                            </div>
                             <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
                                <label class="info-label w-50">Street:</label>
                                <input type="text" id="tempStreet" name="tempStreet" class="form-control rounded" value="<%= student.getTempStreet() %>" disabled>
                            </div>
                        </form>
                    </div>
                    
                    <!-- Permanent Address -->
					<div class="profile-card p-4 mb-3">
					    <h4 class="heading-font">Permanent Address</h4>
					    <hr class="border-dark border-2 mb-3">
					    <form class="row g-3">
					    	     <!-- Hidden Student ID -->
					        <input type="hidden" id="studentId" name="studentId" value="<%= student.getStudentId() %>">
			
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label class="info-label w-50">Province:</label>
					            <input type="text" id="permProvince" name="permProvince" class="form-control rounded" value="<%= student.getPermProvince() %>" disabled>
					        </div>
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label class="info-label w-50">District:</label>
					            <input type="text" id="permDistrict" name="permDistrict" class="form-control rounded" value="<%= student.getPermDistrict() %>" disabled>
					        </div>
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label class="info-label w-50">Municipality:</label>
					            <input type="text" id="permMunicipality" name="permMunicipality" class="form-control rounded" value="<%= student.getPermMunicipality() %>" disabled>
					        </div>
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label class="info-label w-50">Ward:</label>
					            <input type="text" id="permWard" name="permWard" class="form-control rounded" value="<%= student.getPermWard() %>" disabled>
					        </div>
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label class="info-label w-50">Street:</label>
					            <input type="text" id="permStreet" name="permStreet" class="form-control rounded" value="<%= student.getPermStreet() %>" disabled>
					        </div>
					    </form>
					</div>
                    
                    <!-- Academic Information -->
					<div class="profile-card p-4 mb-3">
					    <h4 class="heading-font">Academic Information</h4>
					    <hr class="border-dark border-2 mb-3">
					    <form class="row g-3">
					    	     <!-- Hidden Student ID -->
					        <input type="hidden" id="studentId" name="studentId" value="<%= student.getStudentId() %>">
			
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="previousSchoolName" class="info-label w-50">Previous School Name:</label>
					            <input type="text" id="previousSchoolName" name="previousSchoolName" class="form-control rounded" value="<%= student.getPreviousSchoolName() %>" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="previousSchoolAddress" class="info-label w-50">Previous School Address:</label>
					            <input type="text" id="previousSchoolAddress" name="previousSchoolAddress" class="form-control rounded" value="<%= student.getPreviousSchoolAddress() %>" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="previousAcademicGrade" class="info-label w-50">Academic Grade:</label>
					            <input type="text" id="previousAcademicGrade" name="previousAcademicGrade" class="form-control rounded" value="<%= student.getPreviousAcademicGrade() %>" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="academicRecord" class="info-label w-50">Academic Record:</label>
					            <input type="text" id="academicRecord" name="academicRecord" class="form-control rounded" value="<%= student.getAcademicRecord() %>" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="characterCertificate" class="info-label w-50">Character Certificate:</label>
					            <input type="file" id="characterCertificate" name="characterCertificate" class="form-control rounded" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="markSheet" class="info-label w-50">Mark Sheet:</label>
					            <input type="file" id="markSheet" name="markSheet" class="form-control rounded" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="languageProficiency" class="info-label w-50">Language Proficiency:</label>
					            <input type="text" id="languageProficiency" name="languageProficiency" class="form-control rounded" value="<%= student.getLanguageProficiency() %>" disabled>
					        </div>
					    </form>
					</div>
                    
                    <!-- Health Information -->
					<div class="profile-card p-4 mb-3">
					    <h4 class="heading-font">Health Information</h4>
					    <hr class="border-dark border-2 mb-3">
					    <form class="row g-3">
					    	     <!-- Hidden Student ID -->
					        <input type="hidden" id="studentId" name="studentId" value="<%= student.getStudentId() %>">
			
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="bloodGroup" class="info-label w-50">Blood Group:</label>
					            <input type="text" id="bloodGroup" name="bloodGroup" class="form-control rounded" value="<%= student.getBloodGroup() %>" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="medicalDetails" class="info-label w-50">Medical Details:</label>
					            <input type="text" id="medicalDetails" name="medicalDetails" class="form-control rounded" value="<%= student.getMedicalDetails() %>" disabled>
					        </div>
					    </form>
					</div>
					
					<!-- Scholarship Information -->
					<div class="profile-card p-4">
					    <h4 class="heading-font">Scholarship Information</h4>
					    <hr class="border-dark border-2 mb-3">
					    <form class="row g-3">
					        <!-- Hidden Student ID -->
					        <input type="hidden" id="studentId" name="studentId" value="<%= student.getStudentId() %>">
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="scholarshipId" class="info-label w-50">Scholarship ID:</label>
					            <input type="text" id="scholarshipId" name="scholarshipId" class="form-control rounded" value="<%= student.getScholarshipId() %>" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="scholarshipName" class="info-label w-50">Scholarship Name:</label>
					            <input type="text" id="scholarshipName" name="scholarshipName" class="form-control rounded" value="<%= student.getScholarshipName() %>" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="eligibilityStatus" class="info-label w-50">Eligibility Status:</label>
					            <input type="text" id="eligibilityStatus" name="eligibilityStatus" class="form-control rounded" value="<%= student.getEligibilityStatus() %>" disabled>
					        </div>
					
					        <div class="col-md-6 d-flex flex-row justify-content-between align-items-center">
					            <label for="scholarshipAmount" class="info-label w-50">Scholarship Amount:</label>
					            <input type="text" id="scholarshipAmount" name="scholarshipAmount" class="form-control rounded" value="<%= student.getScholarshipAmount() %>" disabled>
					        </div>
					    </form>
					</div>
										                    
                    
                    
                    
                </div>
            </div>
        </div>
    <% } else { %>
        <div class="container d-flex flex-column justify-content-center align-items-center min-vh-100 text-center">
            <h2 class="text-white heading-font">Data not Available</h2>
        </div>
    <% } %>

    <!-- JS Scripts -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="dashboard.js"></script>
</body>
</html>