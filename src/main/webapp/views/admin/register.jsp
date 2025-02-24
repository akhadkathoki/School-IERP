<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>School ERP Registration</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" 
          integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" 
          crossorigin="anonymous">
    <link rel="stylesheet" href="main.css">
    <script src="https://kit.fontawesome.com/5f59ca6ad3.js" crossorigin="anonymous"></script>

    <style>
        body {
            background-image: 
                linear-gradient(
                    rgba(0, 0, 0, 0.7), /* Dark gradient */
                    rgba(0, 0, 0, 0.7)
                ), url('https://scontent-pnq1-1.xx.fbcdn.net/v/t39.30808-6/462324470_2865707696915867_3339677260262583709_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=833d8c&_nc_ohc=nWg8zqvxWpwQ7kNvgGYICMG&_nc_zt=23&_nc_ht=scontent-pnq1-1.xx&_nc_gid=AzlkF_z1mwya5Az-7rkT3fX&oh=00_AYDrXsPVhvW_vgK2eP8O721rqEe9O_tkNX0Rc2m662w2Eg&oe=67A788E8');
            background-position: center;
            background-size: cover;
            height: 100vh;
            background-repeat: no-repeat;
        }

        /* Splash Screen */
        #splashScreen {
            background-color: #292648;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            color: white;
            z-index: 9999;
            transition: opacity 1s ease-in-out;
        }
        #splashScreen.hide {
            opacity: 0;
            pointer-events: none;
        }

        /* Registration Page */
        .registration-container {
            min-height: 80vh;
            display: none; /* Initially hidden */
        }
        .registration-box {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            padding: 30px;
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.1);
        }
        .role-select {
            cursor: pointer;
        }
        .roleForm{
        	height: 15rem;
        	padding: 1px;
        	
        }
    </style>
</head>

<body class="d-flex align-items-center justify-content-center vh-100 bg-light">


    <!-- Main Content: Registration Form -->
    <main id="registrationContainer" class="container d-flex align-items-center justify-content-center registration-container h-75">
        <div class="row w-100">
            <!-- Right Side: Registration Form -->
            <div class="col-lg-6 col-md-8 mx-auto">
                <div class="registration-box p-5">
                    <h3 class="focus-color text-center fw-bold">School ERP Registration</h3>
                    <p class="text-center mb-4 text-muted">Enter your details to register</p>

                    <form action="register.jsp" method="post">
                        <!-- Role Selection -->
                        <div class="mb-3">
                            <label for="role" class="form-label fw-bold focus-color">Select Role</label>
                            <select class="form-select role-select form-control" id="role" name="role" required onchange="showRoleForm()">
                                <option value="student" selected>Student</option>
                                <option value="teacher">Teacher</option>
                                <option value="parent">Parent</option>
                            </select>
                        </div>

                        <!-- Student Form -->
                   <div id="studentForm" class="overflow-auto roleForm mt-4">
					    <!-- Personal Information -->
					    <div class="mb-3">
					        <label for="studentName" class="form-label fw-bold focus-color">Full Name</label>
					        <input type="text" class="form-control" id="studentName" name="studentName" required placeholder="Enter your full name">
					    </div>
					    <div class="mb-3">
					        <label for="dateOfBirthBS" class="form-label fw-bold focus-color">Date of Birth (BS)</label>
					        <input type="date" class="form-control" id="dateOfBirthBS" name="dateOfBirthBS" required>
					    </div>
					    <div class="mb-3">
					        <label for="dateOfBirthAD" class="form-label fw-bold focus-color">Date of Birth (AD)</label>
					        <input type="date" class="form-control" id="dateOfBirthAD" name="dateOfBirthAD" required>
					    </div>
					    <div class="mb-3">
					        <label for="gender" class="form-label fw-bold focus-color">Gender</label>
					        <select class="form-select form-control" id="gender" name="gender" required>
					            <option value="" disabled selected>Select gender</option>
					            <option value="Male">Male</option>
					            <option value="Female">Female</option>
					            <option value="Other">Other</option>
					        </select>
					    </div>
					    <div class="mb-3">
					        <label for="nationality" class="form-label fw-bold focus-color">Nationality</label>
					        <input type="text" class="form-control" id="nationality" name="nationality" required placeholder="Enter your nationality">
					    </div>
					    <div class="mb-3">
					        <label for="casteEthnicity" class="form-label fw-bold focus-color">Caste/Ethnicity</label>
					        <input type="text" class="form-control" id="casteEthnicity" name="casteEthnicity" placeholder="Enter your caste/ethnicity">
					    </div>
					    <div class="mb-3">
					        <label for="religion" class="form-label fw-bold focus-color">Religion</label>
					        <input type="text" class="form-control" id="religion" name="religion" placeholder="Enter your religion">
					    </div>
					    <div class="mb-3">
					        <label for="birthRegistrationNo" class="form-label fw-bold focus-color">Birth Registration No.</label>
					        <input type="text" class="form-control" id="birthRegistrationNo" name="birthRegistrationNo" placeholder="Enter birth registration number">
					    </div>
					    <div class="mb-3">
					        <label for="photo" class="form-label fw-bold focus-color">Photo</label>
					        <input type="file" class="form-control" id="photo" name="photo" accept="image/*">
					    </div>
					
					    <!-- Permanent Address -->
					    <h5 class="mt-4 fw-bold focus-color">Permanent Address</h5>
					    <div class="mb-3">
					        <label for="permanentProvince" class="form-label fw-bold focus-color">Province</label>
					        <input type="text" class="form-control" id="permanentProvince" name="permanentProvince" required placeholder="Enter province">
					    </div>
					    <div class="mb-3">
					        <label for="permanentDistrict" class="form-label fw-bold focus-color">District</label>
					        <input type="text" class="form-control" id="permanentDistrict" name="permanentDistrict" required placeholder="Enter district">
					    </div>
					    <div class="mb-3">
					        <label for="permanentMunicipality" class="form-label fw-bold focus-color">Municipality</label>
					        <input type="text" class="form-control" id="permanentMunicipality" name="permanentMunicipality" required placeholder="Enter municipality">
					    </div>
					    <div class="mb-3">
					        <label for="permanentWard" class="form-label fw-bold focus-color">Ward</label>
					        <input type="number" class="form-control" id="permanentWard" name="permanentWard" required placeholder="Enter ward number">
					    </div>
					    <div class="mb-3">
					        <label for="permanentStreet" class="form-label fw-bold focus-color">Street</label>
					        <input type="text" class="form-control" id="permanentStreet" name="permanentStreet" placeholder="Enter street name">
					    </div>
					
					    <!-- Temporary Address -->
					    <h5 class="mt-4 fw-bold focus-color">Temporary Address</h5>
					    <div class="mb-3">
					        <label for="temporaryProvince" class="form-label fw-bold focus-color">Province</label>
					        <input type="text" class="form-control" id="temporaryProvince" name="temporaryProvince" placeholder="Enter province">
					    </div>
					    <div class="mb-3">
					        <label for="temporaryDistrict" class="form-label fw-bold focus-color">District</label>
					        <input type="text" class="form-control" id="temporaryDistrict" name="temporaryDistrict" placeholder="Enter district">
					    </div>
					    <div class="mb-3">
					        <label for="temporaryMunicipality" class="form-label fw-bold focus-color">Municipality</label>
					        <input type="text" class="form-control" id="temporaryMunicipality" name="temporaryMunicipality" placeholder="Enter municipality">
					    </div>
					    <div class="mb-3">
					        <label for="temporaryWard" class="form-label fw-bold focus-color">Ward</label>
					        <input type="number" class="form-control" id="temporaryWard" name="temporaryWard" placeholder="Enter ward number">
					    </div>
					    <div class="mb-3">
					        <label for="temporaryStreet" class="form-label fw-bold focus-color">Street</label>
					        <input type="text" class="form-control" id="temporaryStreet" name="temporaryStreet" placeholder="Enter street name">
					    </div>
					
					    <!-- Family Information -->
					    <h5 class="mt-4 fw-bold focus-color">Family Information</h5>
					    <div class="mb-3">
					        <label for="fatherName" class="form-label fw-bold focus-color">Father’s Name</label>
					        <input type="text" class="form-control" id="fatherName" name="fatherName" required placeholder="Enter father's name">
					    </div>
					    <div class="mb-3">
					        <label for="motherName" class="form-label fw-bold focus-color">Mother’s Name</label>
					        <input type="text" class="form-control" id="motherName" name="motherName" required placeholder="Enter mother's name">
					    </div>
					    <div class="mb-3">
					        <label for="guardianName" class="form-label fw-bold focus-color">Guardian’s Name</label>
					        <input type="text" class="form-control" id="guardianName" name="guardianName" placeholder="Enter guardian's name">
					    </div>
					    <div class="mb-3">
					        <label for="guardianRelationship" class="form-label fw-bold focus-color">Guardian’s Relationship</label>
					        <input type="text" class="form-control" id="guardianRelationship" name="guardianRelationship" placeholder="Enter relationship">
					    </div>
					    <div class="mb-3">
					        <label for="contactNumber" class="form-label fw-bold focus-color">Contact Number</label>
					        <input type="text" class="form-control" id="contactNumber" name="contactNumber" required placeholder="Enter contact number">
					    </div>
					    <div class="mb-3">
					        <label for="guardianOccupation" class="form-label fw-bold focus-color">Guardian’s Occupation</label>
					        <input type="text" class="form-control" id="guardianOccupation" name="guardianOccupation" placeholder="Enter occupation">
					    </div>
					    <div class="mb-3">
					        <label for="guardianNationalID" class="form-label fw-bold focus-color">Guardian’s National ID</label>
					        <input type="text" class="form-control" id="guardianNationalID" name="guardianNationalID" placeholder="Enter national ID">
					    </div>
					    <div class="mb-3">
					        <label for="familyIncome" class="form-label fw-bold focus-color">Family Income</label>
					        <input type="number" class="form-control" id="familyIncome" name="familyIncome" placeholder="Enter annual family income">
					    </div>
					
					    <!-- Academic Information -->
					    <h5 class="mt-4 fw-bold focus-color">Academic Information</h5>
					    <div class="mb-3">
					        <label for="admissionGrade" class="form-label fw-bold focus-color">Admission Grade</label>
					        <input type="number" class="form-control" id="admissionGrade" name="admissionGrade" required placeholder="Enter admission grade">
					    </div>
					    <div class="mb-3">
					        <label for="previousSchoolName" class="form-label fw-bold focus-color">Previous School Name</label>
					        <input type="text" class="form-control" id="previousSchoolName" name="previousSchoolName" placeholder="Enter previous school name">
					    </div>
					    <div class="mb-3">
					        <label for="previousSchoolAddress" class="form-label fw-bold focus-color">Previous School Address</label>
					        <input type="text" class="form-control" id="previousSchoolAddress" name="previousSchoolAddress" placeholder="Enter previous school address">
					    </div>
					    <div class="mb-3">
					        <label for="academicRecord" class="form-label fw-bold focus-color">Academic Record</label>
					        <textarea class="form-control" id="academicRecord" name="academicRecord" placeholder="Enter academic record"></textarea>
					    </div>
					    <div class="mb-3">
					        <label for="characterCertificate" class="form-label fw-bold focus-color">Character Certificate</label>
					        <input type="file" class="form-control" id="characterCertificate" name="characterCertificate" accept="image/*">
					    </div>
					    <div class="mb-3">
					        <label for="languageProficiency" class="form-label fw-bold focus-color">Language Proficiency</label>
					        <input type="text" class="form-control" id="languageProficiency" name="languageProficiency" placeholder="Enter languages known">
					    </div>
					
					    <!-- Health and Medical Information -->
					    <h5 class="mt-4 fw-bold focus-color">Health and Medical Information</h5>
					    <div class="mb-3">
					        <label for="healthInfo" class="form-label fw-bold focus-color">Health and Medical Information</label>
					        <textarea class="form-control" id="healthInfo" name="healthInfo" placeholder="Enter health details"></textarea>
					    </div>
					
					    <!-- Additional Information -->
					    <h5 class="mt-4 fw-bold focus-color">Additional Information</h5>
					    <div class="mb-3">
					        <label for="documentsSubmitted" class="form-label fw-bold focus-color">Documents Submitted</label>
					        <input type="text" class="form-control" id="documentsSubmitted" name="documentsSubmitted" required placeholder="List of documents submitted">
					    </div>
					    <div class="mb-3">
					        <label for="transportationDetails" class="form-label fw-bold focus-color">Transportation Details</label>
					        <input type="text" class="form-control" id="transportationDetails" name="transportationDetails" placeholder="Enter transportation details">
					    </div>
					    <div class="mb-3">
					        <label for="scholarshipEligibility" class="form-label fw-bold focus-color">Scholarship Eligibility</label>
					        <select class="form-select form-control" id="scholarshipEligibility" name="scholarshipEligibility">
					            <option value="" disabled selected>Select eligibility</option>
					            <option value="Yes">Yes</option>
					            <option value="No">No</option>
					        </select>
					    </div>
					    <div class="mb-3">
					        <label for="scholarshipAmount" class="form-label fw-bold focus-color">Scholarship Amount</label>
					        <input type="number" class="form-control" id="scholarshipAmount" name="scholarshipAmount" placeholder="Enter scholarship amount">
					    </div>
					</div>



                     <div id="teacherForm" style="display: none;" class="overflow-auto roleForm mt-4">
    <!-- Personal Information -->
    <div class="mb-3">
        <label for="fullName" class="form-label fw-bold focus-color">Full Name</label>
        <input type="text" class="form-control" id="fullName" name="fullName" required placeholder="Enter your full name">
    </div>
    <div class="mb-3">
        <label for="gender" class="form-label fw-bold focus-color">Gender</label>
        <select class="form-select form-control" id="gender" name="gender" required>
            <option value="" disabled selected>Select gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="dateOfBirth" class="form-label fw-bold focus-color">Date of Birth (AD)</label>
        <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
    </div>
    <div class="mb-3">
        <label for="nationality" class="form-label fw-bold focus-color">Nationality</label>
        <input type="text" class="form-control" id="nationality" name="nationality" required placeholder="Enter your nationality">
    </div>
    <div class="mb-3">
        <label for="citizenshipNumber" class="form-label fw-bold focus-color">Citizenship Number</label>
        <input type="text" class="form-control" id="citizenshipNumber" name="citizenshipNumber" required placeholder="Enter citizenship number">
    </div>
    <div class="mb-3">
        <label for="citizenshipIssuePlace" class="form-label fw-bold focus-color">Citizenship Issue Place</label>
        <input type="text" class="form-control" id="citizenshipIssuePlace" name="citizenshipIssuePlace" required placeholder="Enter citizenship issue place">
    </div>
    <div class="mb-3">
        <label for="citizenshipIssueDate" class="form-label fw-bold focus-color">Citizenship Issue Date</label>
        <input type="date" class="form-control" id="citizenshipIssueDate" name="citizenshipIssueDate" required>
    </div>
    <div class="mb-3">
        <label for="contactNumber" class="form-label fw-bold focus-color">Contact Number</label>
        <input type="text" class="form-control" id="contactNumber" name="contactNumber" required placeholder="Enter contact number">
    </div>
    <div class="mb-3">
        <label for="emailAddress" class="form-label fw-bold focus-color">Email Address</label>
        <input type="email" class="form-control" id="emailAddress" name="emailAddress" required placeholder="Enter your email">
    </div>

    <!-- Address Information -->
    <h5 class="mt-4 fw-bold focus-color">Address Information</h5>
    <div class="mb-3">
        <label for="permanentAddress" class="form-label fw-bold focus-color">Permanent Address</label>
        <input type="text" class="form-control" id="permanentAddress" name="permanentAddress" required placeholder="Enter permanent address">
    </div>
    <div class="mb-3">
        <label for="temporaryAddress" class="form-label fw-bold focus-color">Temporary Address</label>
        <input type="text" class="form-control" id="temporaryAddress" name="temporaryAddress" placeholder="Enter temporary address">
    </div>

    <!-- Academic and Professional Information -->
    <h5 class="mt-4 fw-bold focus-color">Academic and Professional Information</h5>
    <div class="mb-3">
        <label for="highestQualification" class="form-label fw-bold focus-color">Highest Qualification</label>
        <input type="text" class="form-control" id="highestQualification" name="highestQualification" required placeholder="Enter highest qualification">
    </div>
    <div class="mb-3">
        <label for="specialization" class="form-label fw-bold focus-color">Specialization</label>
        <input type="text" class="form-control" id="specialization" name="specialization" required placeholder="Enter specialization">
    </div>
    <div class="mb-3">
        <label for="teachingExperienceYears" class="form-label fw-bold focus-color">Teaching Experience (Years)</label>
        <input type="number" class="form-control" id="teachingExperienceYears" name="teachingExperienceYears" required placeholder="Enter years of experience">
    </div>
    <div class="mb-3">
        <label for="previousSchoolName" class="form-label fw-bold focus-color">Previous School Name</label>
        <input type="text" class="form-control" id="previousSchoolName" name="previousSchoolName" placeholder="Enter previous school name">
    </div>
    <div class="mb-3">
        <label for="currentPosition" class="form-label fw-bold focus-color">Current Position</label>
        <input type="text" class="form-control" id="currentPosition" name="currentPosition" required placeholder="Enter current position">
    </div>
    <div class="mb-3">
        <label for="employeeId" class="form-label fw-bold focus-color">Employee ID</label>
        <input type="text" class="form-control" id="employeeId" name="employeeId" required placeholder="Enter employee ID">
    </div>
    <div class="mb-3">
        <label for="joiningDate" class="form-label fw-bold focus-color">Joining Date</label>
        <input type="date" class="form-control" id="joiningDate" name="joiningDate" required>
    </div>

    <!-- Salary and Bank Information -->
    <h5 class="mt-4 fw-bold focus-color">Salary and Bank Information</h5>
    <div class="mb-3">
        <label for="salary" class="form-label fw-bold focus-color">Salary</label>
        <input type="number" class="form-control" id="salary" name="salary" required placeholder="Enter monthly salary">
    </div>
    <div class="mb-3">
        <label for="bankAccountNumber" class="form-label fw-bold focus-color">Bank Account Number</label>
        <input type="text" class="form-control" id="bankAccountNumber" name="bankAccountNumber" required placeholder="Enter bank account number">
    </div>
    <div class="mb-3">
        <label for="bankName" class="form-label fw-bold focus-color">Bank Name</label>
        <input type="text" class="form-control" id="bankName" name="bankName" required placeholder="Enter bank name">
    </div>

    <!-- Emergency Contact Information -->
    <h5 class="mt-4 fw-bold focus-color">Emergency Contact Information</h5>
    <div class="mb-3">
        <label for="emergencyContactName" class="form-label fw-bold focus-color">Emergency Contact Name</label>
        <input type="text" class="form-control" id="emergencyContactName" name="emergencyContactName" required placeholder="Enter emergency contact name">
    </div>
    <div class="mb-3">
        <label for="emergencyContactNumber" class="form-label fw-bold focus-color">Emergency Contact Number</label>
        <input type="text" class="form-control" id="emergencyContactNumber" name="emergencyContactNumber" required placeholder="Enter emergency contact number">
    </div>
    <div class="mb-3">
        <label for="relationshipWithEmergencyContact" class="form-label fw-bold focus-color">Relationship with Emergency Contact</label>
        <select class="form-select form-control" id="relationshipWithEmergencyContact" name="relationshipWithEmergencyContact" required>
            <option value="" disabled selected>Select relationship</option>
            <option value="Father">Father</option>
            <option value="Spouse">Spouse</option>
            <option value="Sibling">Sibling</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="specialNotes" class="form-label fw-bold focus-color">Special Notes</label>
        <textarea class="form-control" id="specialNotes" name="specialNotes" placeholder="Enter special notes"></textarea>
    </div>
    <div class="mb-3">
        <label for="photo" class="form-label fw-bold focus-color">Photo</label>
        <input type="file" class="form-control" id="photo" name="photo" accept="image/*">
    </div>

    <!-- Teaching License Information -->
    <h5 class="mt-4 fw-bold focus-color">Teaching License Information</h5>
    <div class="mb-3">
        <label for="teachingLicenseNumber" class="form-label fw-bold focus-color">Teaching License Number</label>
        <input type="text" class="form-control" id="teachingLicenseNumber" name="teachingLicenseNumber" required placeholder="Enter teaching license number">
    </div>
    <div class="mb-3">
        <label for="licenseIssueDate" class="form-label fw-bold focus-color">License Issue Date</label>
        <input type="date" class="form-control" id="licenseIssueDate" name="licenseIssueDate" required>
    </div>
    <div class="mb-3">
        <label for="licenseExpiryDate" class="form-label fw-bold focus-color">License Expiry Date</label>
        <input type="date" class="form-control" id="licenseExpiryDate" name="licenseExpiryDate" required>
    </div>

    <!-- Personal Details -->
    <h5 class="mt-4 fw-bold focus-color">Personal Details</h5>
    <div class="mb-3">
        <label for="maritalStatus" class="form-label fw-bold focus-color">Marital Status</label>
        <select class="form-select form-control" id="maritalStatus" name="maritalStatus" required>
            <option value="" disabled selected>Select marital status</option>
            <option value="Single">Single</option>
            <option value="Married">Married</option>
            <option value="Divorced">Divorced</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="spouseName" class="form-label fw-bold focus-color">Spouse Name</label>
        <input type="text" class="form-control" id="spouseName" name="spouseName" placeholder="Enter spouse name">
    </div>
    <div class="mb-3">
        <label for="childrenCount" class="form-label fw-bold focus-color">Number of Children</label>
        <input type="number" class="form-control" id="childrenCount" name="childrenCount" placeholder="Enter number of children">
    </div>
</div>

                        <!-- Parent Form -->
                     <div id="parentForm" style="display: none;" class="overflow-auto roleForm mt-4">
    <!-- Personal Information -->
    <div class="mb-3">
        <label for="fullName" class="form-label fw-bold focus-color">Full Name</label>
        <input type="text" class="form-control" id="fullName" name="fullName" required placeholder="Enter your full name">
    </div>
    <div class="mb-3">
        <label for="gender" class="form-label fw-bold focus-color">Gender</label>
        <select class="form-select form-control" id="gender" name="gender" required>
            <option value="" disabled selected>Select gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="dateOfBirth" class="form-label fw-bold focus-color">Date of Birth (AD)</label>
        <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" required>
    </div>
    <div class="mb-3">
        <label for="nationality" class="form-label fw-bold focus-color">Nationality</label>
        <input type="text" class="form-control" id="nationality" name="nationality" required placeholder="Enter your nationality">
    </div>
    <div class="mb-3">
        <label for="relationshipWithStudent" class="form-label fw-bold focus-color">Relationship with Student</label>
        <select class="form-select form-control" id="relationshipWithStudent" name="relationshipWithStudent" required>
            <option value="" disabled selected>Select relationship</option>
            <option value="Father">Father</option>
            <option value="Mother">Mother</option>
            <option value="Guardian">Guardian</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="contactNumber" class="form-label fw-bold focus-color">Contact Number</label>
        <input type="text" class="form-control" id="contactNumber" name="contactNumber" required placeholder="Enter contact number">
    </div>
    <div class="mb-3">
        <label for="emailAddress" class="form-label fw-bold focus-color">Email Address</label>
        <input type="email" class="form-control" id="emailAddress" name="emailAddress" placeholder="Enter your email">
    </div>

    <!-- Address Information -->
    <h5 class="mt-4 fw-bold focus-color">Address Information</h5>
    <div class="mb-3">
        <label for="permanentAddress" class="form-label fw-bold focus-color">Permanent Address</label>
        <input type="text" class="form-control" id="permanentAddress" name="permanentAddress" required placeholder="Enter permanent address">
    </div>
    <div class="mb-3">
        <label for="temporaryAddress" class="form-label fw-bold focus-color">Temporary Address</label>
        <input type="text" class="form-control" id="temporaryAddress" name="temporaryAddress" placeholder="Enter temporary address">
    </div>

    <!-- Citizenship Information -->
    <h5 class="mt-4 fw-bold focus-color">Citizenship Information</h5>
    <div class="mb-3">
        <label for="citizenshipNumber" class="form-label fw-bold focus-color">Citizenship Number</label>
        <input type="text" class="form-control" id="citizenshipNumber" name="citizenshipNumber" required placeholder="Enter citizenship number">
    </div>
    <div class="mb-3">
        <label for="citizenshipIssuePlace" class="form-label fw-bold focus-color">Citizenship Issue Place</label>
        <input type="text" class="form-control" id="citizenshipIssuePlace" name="citizenshipIssuePlace" required placeholder="Enter citizenship issue place">
    </div>
    <div class="mb-3">
        <label for="citizenshipIssueDate" class="form-label fw-bold focus-color">Citizenship Issue Date</label>
        <input type="date" class="form-control" id="citizenshipIssueDate" name="citizenshipIssueDate" required>
    </div>

    <!-- Occupation and Education -->
    <h5 class="mt-4 fw-bold focus-color">Occupation and Education</h5>
    <div class="mb-3">
        <label for="occupation" class="form-label fw-bold focus-color">Occupation</label>
        <input type="text" class="form-control" id="occupation" name="occupation" required placeholder="Enter your occupation">
    </div>
    <div class="mb-3">
        <label for="employerName" class="form-label fw-bold focus-color">Employer Name</label>
        <input type="text" class="form-control" id="employerName" name="employerName" placeholder="Enter employer name">
    </div>
    <div class="mb-3">
        <label for="annualIncome" class="form-label fw-bold focus-color">Annual Income</label>
        <input type="number" class="form-control" id="annualIncome" name="annualIncome" placeholder="Enter annual income">
    </div>
    <div class="mb-3">
        <label for="highestQualification" class="form-label fw-bold focus-color">Highest Qualification</label>
        <input type="text" class="form-control" id="highestQualification" name="highestQualification" placeholder="Enter highest qualification">
    </div>
    <div class="mb-3">
        <label for="schoolName" class="form-label fw-bold focus-color">School Name</label>
        <input type="text" class="form-control" id="schoolName" name="schoolName" placeholder="Enter school name">
    </div>

    <!-- Emergency Contact Information -->
    <h5 class="mt-4 fw-bold focus-color">Emergency Contact Information</h5>
    <div class="mb-3">
        <label for="emergencyContactName" class="form-label fw-bold focus-color">Emergency Contact Name</label>
        <input type="text" class="form-control" id="emergencyContactName" name="emergencyContactName" placeholder="Enter emergency contact name">
    </div>
    <div class="mb-3">
        <label for="emergencyContactNumber" class="form-label fw-bold focus-color">Emergency Contact Number</label>
        <input type="text" class="form-control" id="emergencyContactNumber" name="emergencyContactNumber" placeholder="Enter emergency contact number">
    </div>
    <div class="mb-3">
        <label for="relationshipWithEmergencyContact" class="form-label fw-bold focus-color">Relationship with Emergency Contact</label>
        <select class="form-select form-control" id="relationshipWithEmergencyContact" name="relationshipWithEmergencyContact">
            <option value="" disabled selected>Select relationship</option>
            <option value="Brother">Brother</option>
            <option value="Sister">Sister</option>
            <option value="Friend">Friend</option>
        </select>
    </div>
    <div class="mb-3">
        <label for="specialNotes" class="form-label fw-bold focus-color">Special Notes</label>
        <textarea class="form-control" id="specialNotes" name="specialNotes" placeholder="Enter special notes"></textarea>
    </div>

    <!-- Photo Upload -->
    <div class="mb-3">
        <label for="photo" class="form-label fw-bold focus-color">Photo</label>
        <input type="file" class="form-control" id="photo" name="photo" accept="image/*">
    </div>
</div>

                      <br>
                        <!-- Register Button -->
                        <div class="d-grid">
                            <button type="submit" class="default-btn btn text-white h-25 w-100 btn-lg">Register</button>
                        </div>
                    </form>

                    <!-- Additional Options -->
                    <div class="text-center mt-3">
                        <a href="index.jsp" class="text-decoration-none focus-color">Already have an account? Login</a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <!-- JavaScript: Smooth Splash Screen Transition -->
    <script>

        // Function to show the appropriate form based on the selected role
        function showRoleForm() {
            const role = document.getElementById("role").value;
            document.getElementById("studentForm").style.display = role === "student" ? "block" : "none";
            document.getElementById("teacherForm").style.display = role === "teacher" ? "block" : "none";
            document.getElementById("parentForm").style.display = role === "parent" ? "block" : "none";
            document.getElementById("adminForm").style.display = role === "admin" ? "block" : "none";
        }

        // Initialize the form display based on the default selected role
        document.addEventListener("DOMContentLoaded", showRoleForm);
    </script>

    <!-- Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js" 
            integrity="sha384-ZvpUoO/+PpL/5AptnQvJ1stFfHBV8JO/N5GA5c5V5l5IE5L1P4/6B0H5L5n5Fh5F" 
            crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" 
            integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" 
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" 
            integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" 
            crossorigin="anonymous"></script>
</body>
</html>