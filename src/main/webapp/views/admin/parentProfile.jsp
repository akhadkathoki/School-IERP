<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.IERP_FINAL.models.ParentGuardian" %>
<%@ page import="java.util.Base64" %>

<%
ParentGuardian parent = (ParentGuardian) request.getAttribute("guardian");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guardian Profile</title>
    
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
    <%@ include file='staticAdminComponent.jsp' %>
    <br><br>
    <% if (parent != null) { %>
        <div class="container py-5">
            <div class="w-100 mb-2 d-flex flex-row justify-content-between">
            <h1 class="heading-font text-right fs-2"><%= parent.getFullName() %>'s Profile</h1>

            <form action="GuardianServlet" method="post" enctype="multipart/form-data" style="display:inline;">
                <input type="hidden" name="action" value="getForEdit">
                <input type="hidden" name="guardianId" value="<%= parent.getGuardianId() %>" />
                <button type="submit" class="btn text-white" style="background-color: #292648;">
                    <i class="bi bi-pencil"></i> Edit
                </button>
            </form>
        </div>
            <hr class="border-dark border-2 mb-5">
            
            <div class="row g-4">
                <!-- Profile Sidebar -->
                <div class="col-lg-4">
                    <div class="profile-card p-4 text-center">
                        <% if (parent.getPhoto() != null) { %>
                            <img class="profile-image rounded-circle border border-4 border-info shadow mb-3 " 
                                 src="data:image/jpeg;base64,<%= Base64.getEncoder().encodeToString(parent.getPhoto()) %>" 
                                 alt="Guardian Photo" > 
                        <% } else { %>
                            <img class="profile-image rounded-circle border border-4 border-info shadow mb-3" src="" alt="No Image">
                        <% } %>

                        <h3 class="name fw-bold"><%= parent.getFullName() %></h3>
                        <p class="text-muted fw-semibold mb-3"><%= parent.getRole() %></p>

                        <button class="btn px-3 w-100 text-white mb-3" style="background-color: #292648;">Download PDF</button>
                    </div>
                </div>

                <div class="col-lg-8">
                    <form action="GuardianServlet" method="post" class="bg-transparent" enctype="">
                        <!-- Personal Info -->
                        <div class="profile-card p-4 mb-3">
                            <h4 class="heading-font">Personal Details</h4>
                            <hr class="border-dark border-2 mb-3">
                    
                            <div class="row g-3">
                                <!-- Guardian ID -->
                                <div class="col-md-6 mb-3">
                                    <label class="info-label w-50">ID:</label>
                                    <input type="text" id="guardian_id" name="guardian_id" class="form-control rounded" value="<%= parent.getGuardianId() %>" readonly>
                                </div>

                                <input type="hidden" name="form" value="personalInfo">
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Full Name:</label>
                                    <input type="text" name="fullName" class="form-control rounded subName" value="<%= parent.getFullName() %>" readonly>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Date of Birth:</label>
                                    <input type="date" name="dateOfBirth" class="form-control rounded subName" value="<%= parent.getDateOfBirth() != null ? parent.getDateOfBirth().toString() : "" %>" readonly>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Gender:</label>
                                    <select name="gender" class="form-control rounded subName" readonly>
                                        <option value="">Select Gender</option>
                                        <option value="Male" <%= "Male".equals(parent.getGender()) ? "selected" : "" %>>Male</option>
                                        <option value="Female" <%= "Female".equals(parent.getGender()) ? "selected" : "" %>>Female</option>
                                        <option value="Other" <%= "Other".equals(parent.getGender()) ? "selected" : "" %>>Other</option>
                                    </select>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Nationality:</label>
                                    <input type="text" name="nationality" class="form-control rounded subName" value="<%= parent.getNationality() %>" readonly>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Citizenship Number:</label>
                                    <input type="text" name="citizenshipNumber" class="form-control rounded subName" value="<%= parent.getCitizenshipNumber() %>" readonly>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Citizenship Issue Place:</label>
                                    <input type="text" name="citizenshipIssuePlace" class="form-control rounded subName" value="<%= parent.getCitizenshipIssuePlace() %>" readonly>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Citizenship Issue Date:</label>
                                    <input type="date" name="citizenshipIssueDate" class="form-control rounded subName" value="<%= parent.getCitizenshipIssueDate() != null ? parent.getCitizenshipIssueDate().toString() : "" %>" readonly>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Contact Number:</label>
                                    <input type="text" name="contactNumber" class="form-control rounded subName" value="<%= parent.getContactNumber() %>" readonly>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Email Address:</label>
                                    <input type="email" name="emailAddress" class="form-control rounded subName" value="<%= parent.getEmailAddress() %>" readonly>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Permanent Address:</label>
                                    <textarea name="permanentAddress" class="form-control rounded subName" rows="2" readonly><%= parent.getPermanentAddress() %></textarea>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Temporary Address:</label>
                                    <textarea name="temporaryAddress" class="form-control rounded subName" rows="2" readonly><%= parent.getTemporaryAddress() %></textarea>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Username:</label>
                                    <input type="text" name="username" class="form-control subName rounded" value="<%= parent.getUsername() %>" readonly>
                                </div>
                    
                                <div class="col-md-6 mb-3">
                                    <label class="name">Password:</label>
                                    <input type="password" name="password" class="form-control subName rounded" value="<%= parent.getPassword() %>" readonly>
                                </div>

                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    <% } %>

    <!-- Bootstrap JS (Optional) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
