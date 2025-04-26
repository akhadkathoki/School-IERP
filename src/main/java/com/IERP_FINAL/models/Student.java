package com.IERP_FINAL.models;

import java.util.Date;

public class Student {

    // student_info
    private int studentId;
    private String role;
    private String fullName;
    private Date dateOfBirthAd;
    private String gender;
    private String nationality;
    private String birthRegistrationNo;
    private byte[]  profilePicture;
    private String fatherName;
    private String motherName;
    private String grandfatherName;
    private String username;
    private String password;
    private Date createdAt;

    // temporary_address
    private int tempAddressId;
    private String tempProvince;
    private String tempDistrict;
    private String tempMunicipality;
    private int tempWard;
    private String tempStreet;

    // permanent_address
    private int permAddressId;
    private String permProvince;
    private String permDistrict;
    private String permMunicipality;
    private int permWard;
    private String permStreet;

    // academic_info
    private int admissionId;
    private String previousSchoolName;
    private String previousSchoolAddress;
    private String previousAcademicGrade;
    private String academicRecord;
    private byte[] characterCertificate;
    private byte[] markSheet;
    private String languageProficiency;

    // health_info
    private int healthId;
    private String bloodGroup;
    private String medicalDetails;

    // scholarship_info
    private int scholarshipId;
    private String eligibilityStatus;
    private String scholarshipName;
    private double scholarshipAmount;

    // Getters and Setters
    
    // student_info
    public int getStudentId() {
        return studentId;
    }
    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }

    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public Date getDateOfBirthAd() {
        return dateOfBirthAd;
    }
    public void setDateOfBirthAd(Date dateOfBirthAd) {
        this.dateOfBirthAd = dateOfBirthAd;
    }

    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getNationality() {
        return nationality;
    }
    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getBirthRegistrationNo() {
        return birthRegistrationNo;
    }
    public void setBirthRegistrationNo(String birthRegistrationNo) {
        this.birthRegistrationNo = birthRegistrationNo;
    }

    public byte[] getProfilePicture() {
        return profilePicture;
    }
    public void setProfilePicture(byte[] profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getFatherName() {
        return fatherName;
    }
    public void setFatherName(String fatherName) {
        this.fatherName = fatherName;
    }

    public String getMotherName() {
        return motherName;
    }
    public void setMotherName(String motherName) {
        this.motherName = motherName;
    }

    public String getGrandfatherName() {
        return grandfatherName;
    }
    public void setGrandfatherName(String grandfatherName) {
        this.grandfatherName = grandfatherName;
    }

    public String getUsername() {
        return username;
    }
    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public Date getCreatedAt() {
        return createdAt;
    }
    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    // temporary_address
    public int getTempAddressId() {
        return tempAddressId;
    }
    public void setTempAddressId(int tempAddressId) {
        this.tempAddressId = tempAddressId;
    }

    public String getTempProvince() {
        return tempProvince;
    }
    public void setTempProvince(String tempProvince) {
        this.tempProvince = tempProvince;
    }

    public String getTempDistrict() {
        return tempDistrict;
    }
    public void setTempDistrict(String tempDistrict) {
        this.tempDistrict = tempDistrict;
    }

    public String getTempMunicipality() {
        return tempMunicipality;
    }
    public void setTempMunicipality(String tempMunicipality) {
        this.tempMunicipality = tempMunicipality;
    }

    public int getTempWard() {
        return tempWard;
    }
    public void setTempWard(int tempWard) {
        this.tempWard = tempWard;
    }

    public String getTempStreet() {
        return tempStreet;
    }
    public void setTempStreet(String tempStreet) {
        this.tempStreet = tempStreet;
    }

    // permanent_address
    public int getPermAddressId() {
        return permAddressId;
    }
    public void setPermAddressId(int permAddressId) {
        this.permAddressId = permAddressId;
    }

    public String getPermProvince() {
        return permProvince;
    }
    public void setPermProvince(String permProvince) {
        this.permProvince = permProvince;
    }

    public String getPermDistrict() {
        return permDistrict;
    }
    public void setPermDistrict(String permDistrict) {
        this.permDistrict = permDistrict;
    }

    public String getPermMunicipality() {
        return permMunicipality;
    }
    public void setPermMunicipality(String permMunicipality) {
        this.permMunicipality = permMunicipality;
    }

    public int getPermWard() {
        return permWard;
    }
    public void setPermWard(int permWard) {
        this.permWard = permWard;
    }

    public String getPermStreet() {
        return permStreet;
    }
    public void setPermStreet(String permStreet) {
        this.permStreet = permStreet;
    }

    // academic_info
    public int getAdmissionId() {
        return admissionId;
    }
    public void setAdmissionId(int admissionId) {
        this.admissionId = admissionId;
    }

    public String getPreviousSchoolName() {
        return previousSchoolName;
    }
    public void setPreviousSchoolName(String previousSchoolName) {
        this.previousSchoolName = previousSchoolName;
    }

    public String getPreviousSchoolAddress() {
        return previousSchoolAddress;
    }
    public void setPreviousSchoolAddress(String previousSchoolAddress) {
        this.previousSchoolAddress = previousSchoolAddress;
    }

    public String getPreviousAcademicGrade() {
        return previousAcademicGrade;
    }
    public void setPreviousAcademicGrade(String previousAcademicGrade) {
        this.previousAcademicGrade = previousAcademicGrade;
    }

    public String getAcademicRecord() {
        return academicRecord;
    }
    public void setAcademicRecord(String academicRecord) {
        this.academicRecord = academicRecord;
    }

    public byte[] getCharacterCertificate() {
        return characterCertificate;
    }
    public void setCharacterCertificate(byte[] characterCertificate) {
        this.characterCertificate = characterCertificate;
    }

    public byte[] getMarkSheet() {
        return markSheet;
    }
    public void setMarkSheet(byte[] markSheet) {
        this.markSheet = markSheet;
    }

    public String getLanguageProficiency() {
        return languageProficiency;
    }
    public void setLanguageProficiency(String languageProficiency) {
        this.languageProficiency = languageProficiency;
    }

    // health_info
    public int getHealthId() {
        return healthId;
    }
    public void setHealthId(int healthId) {
        this.healthId = healthId;
    }

    public String getBloodGroup() {
        return bloodGroup;
    }
    public void setBloodGroup(String bloodGroup) {
        this.bloodGroup = bloodGroup;
    }

    public String getMedicalDetails() {
        return medicalDetails;
    }
    public void setMedicalDetails(String medicalDetails) {
        this.medicalDetails = medicalDetails;
    }

    // scholarship_info
    public int getScholarshipId() {
        return scholarshipId;
    }
    public void setScholarshipId(int scholarshipId) {
        this.scholarshipId = scholarshipId;
    }

    public String getEligibilityStatus() {
        return eligibilityStatus;
    }
    public void setEligibilityStatus(String eligibilityStatus) {
        this.eligibilityStatus = eligibilityStatus;
    }

    public String getScholarshipName() {
        return scholarshipName;
    }
    public void setScholarshipName(String scholarshipName) {
        this.scholarshipName = scholarshipName;
    }

    public double getScholarshipAmount() {
        return scholarshipAmount;
    }
    public void setScholarshipAmount(double scholarshipAmount) {
        this.scholarshipAmount = scholarshipAmount;
    }
}

