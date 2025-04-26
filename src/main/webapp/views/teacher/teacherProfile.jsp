<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.IERP_FINAL.models.Teacher" %>
<%@ page import="java.util.Base64" %>

<%
    Teacher teacher = (Teacher) request.getAttribute("teacher");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teacher Profile</title>
    
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

<body style="background-color: #CDD5DB;">
    <%@ include file='staticTeacherComponent.jsp' %>
		<br><br>
    <% if (teacher != null) { %>
        <div class="container py-5">
            <div class="w-100 mb-2 d-flex flex-row justify-content-between">
            <h1 class="heading-font text-right fs-2"><%= teacher.getFullName() %>'s Profile</h1>

            <form action="TeacherServlet"  method="post" enctype="multipart/form-data" style="display:inline;">
            	<input type="hidden" name="action" value="getForEdit">
                <input type="hidden" name="teacherId" value="<%= teacher.getTeacherId() %>" />
                <button type="submit" class="btn text-white " style="background-color: #292648;" >
                    <i class="bi bi-pencil"></i> Edit
                </button>
            </form>
        </div>
            <hr class="border-dark border-2 mb-5">
			
            <div class="row g-4">
                <!-- Profile Sidebar -->
                <div class="col-lg-4">
                    <div class="profile-card p-4 text-center">
                        <% if (teacher.getPhoto() != null) { %>
                            <img class="profile-image rounded-circle border border-4 border-info shadow mb-3 " 
                                 src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(teacher.getPhoto()) %>" 
                                 alt="Student Photo" > 
                        <% } else { %>
                            <img class="profile-image rounded-circle border border-4 border-info shadow mb-3" src="" alt="No Image">
                        <% } %>

                        <h3 class="name fw-bold"><%= teacher.getFullName()%></h3>
                        <p class="text-muted fw-semibold mb-3"><%= teacher.getRole() %></p>

						<button class="btn px-3 w-100 text-white mb-3" style="background-color: #292648;">Download PDF</button>
                    </div>
                </div>

                <div class="col-lg-8">
          	   		<form action="TeacherServlet" method="post" class="bg-transparent" enctype="">

					    <!-- Personal Info -->
					    <div class="profile-card p-4 mb-3">
					        <h4 class="heading-font">Personal Details</h4>
					        <hr class="border-dark border-2 mb-3">
					
					        <div class="row g-3">
					            <!-- Hidden Student ID -->
					            <div class="col-md-6 mb-3">
					                <label class="info-label w-50">ID:</label>
					                <input type="text" id="student_id" name="student_id" class="form-control rounded" value="<%= teacher.getTeacherId() %>" readonly>
					            </div>
					
					            <input type="hidden" name="form" value="personalInfo">
					
					            <div class="col-md-6 mb-3">
					                <label class="role">Role</label>
					                <input type="text" name="role" readonly class="form-control rounded subName" id="role" value="<%= teacher.getRole() %>">
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Full Name:</label>
					                <input type="text" name="fullName" class="form-control rounded subName" value="<%= teacher.getFullName() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Date of Birth:</label>
					                <input type="date" name="dateOfBirth" class="form-control rounded subName" value="<%= teacher.getDateOfBirth() != null ? teacher.getDateOfBirth().toString() : "" %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Gender:</label>
					                <select name="gender" class="form-control rounded subName" readonly>
					                    <option value="">Select Gender</option>
					                    <option value="Male" <%= "Male".equals(teacher.getGender()) ? "selected" : "" %>>Male</option>
					                    <option value="Female" <%= "Female".equals(teacher.getGender()) ? "selected" : "" %>>Female</option>
					                    <option value="Other" <%= "Other".equals(teacher.getGender()) ? "selected" : "" %>>Other</option>
					                </select>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Nationality:</label>
					                <input type="text" name="nationality" class="form-control rounded subName" value="<%= teacher.getNationality() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Citizenship Number:</label>
					                <input type="text" name="citizenshipNumber" class="form-control rounded subName" value="<%= teacher.getCitizenshipNumber() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Citizenship Issue Place:</label>
					                <input type="text" name="citizenshipIssuePlace" class="form-control rounded subName" value="<%= teacher.getCitizenshipIssuePlace() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Citizenship Issue Date:</label>
					                <input type="date" name="citizenshipIssueDate" class="form-control rounded subName" value="<%= teacher.getCitizenshipIssueDate() != null ? teacher.getCitizenshipIssueDate().toString() : "" %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Contact Number:</label>
					                <input type="text" name="contactNumber" class="form-control rounded subName" value="<%= teacher.getContactNumber() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Email Address:</label>
					                <input type="email" name="emailAddress" class="form-control rounded subName" value="<%= teacher.getEmailAddress() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Permanent Address:</label>
					                <textarea name="permanentAddress" class="form-control rounded subName" rows="2" readonly><%= teacher.getPermanentAddress() %></textarea>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Temporary Address:</label>
					                <textarea name="temporaryAddress" class="form-control rounded subName" rows="2" readonly><%= teacher.getTemporaryAddress() %></textarea>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Username:</label>
					                <input type="text" name="username" class="form-control subName rounded" value="<%= teacher.getUsername() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Password:</label>
					                <input type="password" name="password" class="form-control subName rounded" value="<%= teacher.getPassword() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Photo:</label>
					                <input type="file" name="photo" class="form-control subName rounded" accept="image/*" disabled>
					                <% if (teacher.getPhoto() != null) { %>
					                    <p class="text-success mt-2">Photo already uploaded.</p>
					                <% } %>
					            </div>
					        </div>
					    </div>
					
					    <!-- Teacher Qualification -->
					    <div class="profile-card p-4 mb-3">
					        <h4 class="heading-font">Teacher Qualification</h4>
					        <hr class="border-dark border-2 mb-3">
					        <div class="row g-3">
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Highest Qualification:</label>
					                <input type="text" name="highestQualification" class="form-control rounded subName" placeholder="e.g., M.Ed, B.Ed, PhD" value="<%= teacher.getHighestQualification() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Specialization:</label>
					                <input type="text" name="specialization" class="form-control rounded subName" placeholder="e.g., Mathematics, English, Science" value="<%= teacher.getSpecialization() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Qualification Score (%):</label>
					                <input type="number" name="qualificationScore" step="0.01" class="form-control rounded subName" placeholder="e.g., 85.50" value="<%= teacher.getQualificationScore() %>" readonly>
					            </div>
					
					            <div class="col-md-6 mb-3">
					                <label class="name">Upload Certification Image:</label>
					                <input type="file" name="certificationImage" class="form-control rounded subName" accept="image/*,application/pdf" disabled>
					                <% if (teacher.getCertificationImage() != null) { %>
					                    <p class="text-success mt-2">Certification already uploaded.</p>
					                <% } %>
					            </div>
					
					        </div>
					    </div>
					
					    <!-- License Information -->
					    <div class="profile-card p-4 mb-3">
					        <h4 class="heading-font">License Information</h4>
					        <hr class="border-dark border-2 mb-3">
					
					        <div class="row g-3">
					
					            <!-- Teaching License Number -->
					            <div class="col-md-6 mb-3">
					                <label class="name">Teaching License Number:</label>
					                <input type="text" name="teachingLicenseNumber" class="form-control rounded subName" placeholder="Enter license number" value="<%= teacher.getTeachingLicenseNumber() %>" readonly>
					            </div>
					
					            <!-- License Issue Date -->
					            <div class="col-md-6 mb-3">
					                <label class="name">License Issue Date:</label>
					                <input type="date" name="licenseIssueDate" class="form-control rounded subName" value="<%= teacher.getLicenseIssueDate() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(teacher.getLicenseIssueDate()) : "" %>" readonly>
					            </div>
					
					            <!-- License Expiry Date -->
					            <div class="col-md-6 mb-3">
					                <label class="name">License Expiry Date:</label>
					                <input type="date" name="licenseExpiryDate" class="form-control rounded subName" value="<%= teacher.getLicenseExpiryDate() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(teacher.getLicenseExpiryDate()) : "" %>" readonly>
					            </div>
					
					            <!-- License Image Upload -->
					            <div class="col-md-6 mb-3">
					                <label class="name">Upload License Image:</label>
					                <input type="file" name="licenseImage" class="form-control rounded subName" disabled>
					                <% if (teacher.getLicenseImage() != null) { %>
					                    <p class="text-success mt-2">License image already uploaded.</p>
					                <% } %>
					            </div>
					
					        </div>
					
					    </div>
					    
					       <!-- Emergency Contact Information -->
                    <div class="profile-card p-4 mb-3">
                        <h4 class="heading-font">Emergency Contact Information</h4>
                        <hr class="border-dark border-2 mb-3">
                        <div class="row g-3">
                            <!-- Emergency Contact Name -->
                            <div class="col-md-6 mb-3">
                                <label class="name">Emergency Contact Name:</label>
                                <input type="text" name="emergencyContactName" class="form-control rounded subName"
                                       placeholder="Enter contact name"
                                       value="<%= teacher.getEmergencyContactName() %>" readonly>
                            </div>

                            <!-- Emergency Contact Number -->
                            <div class="col-md-6 mb-3">
                                <label class="name">Emergency Contact Number:</label>
                                <input type="text" name="emergencyContactNumber" class="form-control rounded subName"
                                       placeholder="Enter contact number"
                                       value="<%= teacher.getEmergencyContactNumber() %>" readonly>
                            </div>

                            <!-- Emergency Email -->
                            <div class="col-md-6 mb-3">
                                <label class="name">Emergency Email:</label>
                                <input type="email" name="emergencyEmail" class="form-control rounded subName"
                                       placeholder="Enter email"
                                       value="<%= teacher.getEmergencyEmail() %>" readonly>
                            </div>

                            <!-- Relationship with Emergency Contact -->
                            <div class="col-md-6 mb-3">
                                <label class="name">Relationship with Contact:</label>
                                <input type="text" name="relationshipWithEmergencyContact" class="form-control rounded subName"
                                       placeholder="e.g., Parent, Spouse, Friend"
                                       value="<%= teacher.getRelationshipWithEmergencyContact() %>" readonly>
                            </div>
                        
                        </div>
                    </div>
                </form>
              </div>
           </div>
\        </div>
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