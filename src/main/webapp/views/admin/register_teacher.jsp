<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Teacher Registration</title>
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

<div class="container main p-3 d-flex flex-column justify-content-center align-items-start"></div>
	<br> <br> <br>
    <h1 class="heading-font text-right fs-2">Register Parent</h1>
    <hr class="border border-secondary border-1 mb-4 w-100 break">



    <!-- Tab Content -->
    <div class="container tab-content main mt-3 p-3 shadow-sm rounded bg-white">
    
        <!-- Teacher Personal Information -->
        <div class="  "  >
            <h1 class="heading-font">Personal Information</h1>
            <hr class="border border-secondary border-1 mb-4 w-100 break">
            
           <form  method="post" action="RegisterParentInfo" class="row" enctype="multipart/form-data">
				<input type="hidden" name="action" value="insert">
				<div class="col-md-6 mb-3">
                    <label class="role">Role</label>
                    <input type="text" name="role" readonly class="form-control rounded subName" id="role" value="parent">
                </div>
                <div class="col-md-6 mb-3">
                    <label class="role">Student Id</label>
                    <input type="number" name="studentId" class="form-control rounded subName" id="role" placeholder="Enter Student Id">
                </div>
			    <div class="col-md-6 mb-3">
			        <label class="name">Full Name:</label>
			        <input type="text" name="fullName" class="form-control rounded subName" placeholder="Enter full name" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Date of Birth:</label>
			        <input type="date" name="dateOfBirth" class="form-control rounded subName" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Gender:</label>
			        <select name="gender" class="form-control rounded subName" required>
			            <option value="">Select Gender</option>
			            <option>Male</option>
			            <option>Female</option>
			            <option>Other</option>
			        </select>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Nationality:</label>
			        <input type="text" name="nationality" class="form-control rounded subName" placeholder="Enter nationality" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Citizenship Number:</label>
			        <input type="text" name="citizenshipNumber" class="form-control rounded subName" placeholder="Enter citizenship number" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Citizenship Issue Place:</label>
			        <input type="text" name="citizenshipIssuePlace" class="form-control rounded subName" placeholder="Enter issue place" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Citizenship Issue Date:</label>
			        <input type="date" name="citizenshipIssueDate" class="form-control rounded subName" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Contact Number:</label>
			        <input type="text" name="contactNumber" class="form-control rounded subName" placeholder="Enter contact number" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Email Address:</label>
			        <input type="email" name="emailAddress" class="form-control rounded subName" placeholder="Enter email" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Permanent Address:</label>
			        <textarea name="permanentAddress" class="form-control rounded subName" rows="2" placeholder="Enter permanent address" required></textarea>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Temporary Address:</label>
			        <textarea name="temporaryAddress" class="form-control rounded subName" rows="2" placeholder="Enter temporary address"></textarea>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Username:</label>
			        <input type="text" name="username" class="form-control subName rounded" placeholder="Enter username" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Password:</label>
			        <input type="password" name="password" class="form-control subName rounded" placeholder="Enter password" required>
			    </div>
			
			    <div class="col-md-6 mb-3">
			        <label class="name">Photo:</label>
			        <input type="file" name="photo" class="form-control subName rounded" accept="image/*" required>
			    </div>
			
			    <hr class="border border-secondary border-1 w-100 break">
			    <div class="col-12 d-flex flex-row justify-content-end">
			        <button class="btn px-5 text-white mt-3" style="background-color: #292648;">Register</button>
			    </div>
			</form>

        </div>

    

</div>
</body>
</html>