package com.IERP_FINAL.models;

import java.sql.Date;

public class Teacher {

    // Teacher Info
    private int teacherId;
    private String role;
    private String fullName;
    private String gender;
    private Date dateOfBirth;
    private String nationality;
    private String citizenshipNumber;
    private String citizenshipIssuePlace;
    private Date citizenshipIssueDate;
    private String contactNumber;
    private String emailAddress;
    private String permanentAddress;
    private String temporaryAddress;
    private String username;
    private String password;
    private byte[] photo;
    private Date createdAt;

    // Qualification
    private int qualificationId;
    private String highestQualification;
    private String specialization;
    private float qualificationScore;
    private byte[] certificationImage;

    // License
    private int licenseId;
    private String teachingLicenseNumber;
    private Date licenseIssueDate;
    private Date licenseExpiryDate;
    private byte[] licenseImage;

    // Emergency Contact
    private int contactId;
    private String emergencyContactName;
    private String emergencyContactNumber;
    private String emergencyEmail;
    private String relationshipWithEmergencyContact;

    // No-args constructor
    public Teacher() {}

    // Full constructor
    public Teacher(int teacherId, String role, String fullName, String gender, Date dateOfBirth, String nationality,
                   String citizenshipNumber, String citizenshipIssuePlace, Date citizenshipIssueDate,
                   String contactNumber, String emailAddress, String permanentAddress, String temporaryAddress,
                   String username, String password, byte[] photo, Date createdAt,
                   int qualificationId, String highestQualification, String specialization, float qualificationScore,
                   byte[] certificationImage, int licenseId, String teachingLicenseNumber, Date licenseIssueDate,
                   Date licenseExpiryDate, byte[] licenseImage, int contactId, String emergencyContactName,
                   String emergencyContactNumber, String emergencyEmail, String relationshipWithEmergencyContact) {
        this.teacherId = teacherId;
        this.role = role;
        this.fullName = fullName;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.nationality = nationality;
        this.citizenshipNumber = citizenshipNumber;
        this.citizenshipIssuePlace = citizenshipIssuePlace;
        this.citizenshipIssueDate = citizenshipIssueDate;
        this.contactNumber = contactNumber;
        this.emailAddress = emailAddress;
        this.permanentAddress = permanentAddress;
        this.temporaryAddress = temporaryAddress;
        this.username = username;
        this.password = password;
        this.photo = photo;
        this.createdAt = createdAt;
        this.qualificationId = qualificationId;
        this.highestQualification = highestQualification;
        this.specialization = specialization;
        this.qualificationScore = qualificationScore;
        this.certificationImage = certificationImage;
        this.licenseId = licenseId;
        this.teachingLicenseNumber = teachingLicenseNumber;
        this.licenseIssueDate = licenseIssueDate;
        this.licenseExpiryDate = licenseExpiryDate;
        this.licenseImage = licenseImage;
        this.contactId = contactId;
        this.emergencyContactName = emergencyContactName;
        this.emergencyContactNumber = emergencyContactNumber;
        this.emergencyEmail = emergencyEmail;
        this.relationshipWithEmergencyContact = relationshipWithEmergencyContact;
    }

    // Getters and Setters

    // ... (getters and setters for each field below)

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
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

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Date getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(Date dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getCitizenshipNumber() {
        return citizenshipNumber;
    }

    public void setCitizenshipNumber(String citizenshipNumber) {
        this.citizenshipNumber = citizenshipNumber;
    }

    public String getCitizenshipIssuePlace() {
        return citizenshipIssuePlace;
    }

    public void setCitizenshipIssuePlace(String citizenshipIssuePlace) {
        this.citizenshipIssuePlace = citizenshipIssuePlace;
    }

    public Date getCitizenshipIssueDate() {
        return citizenshipIssueDate;
    }

    public void setCitizenshipIssueDate(Date citizenshipIssueDate) {
        this.citizenshipIssueDate = citizenshipIssueDate;
    }

    public String getContactNumber() {
        return contactNumber;
    }

    public void setContactNumber(String contactNumber) {
        this.contactNumber = contactNumber;
    }

    public String getEmailAddress() {
        return emailAddress;
    }

    public void setEmailAddress(String emailAddress) {
        this.emailAddress = emailAddress;
    }

    public String getPermanentAddress() {
        return permanentAddress;
    }

    public void setPermanentAddress(String permanentAddress) {
        this.permanentAddress = permanentAddress;
    }

    public String getTemporaryAddress() {
        return temporaryAddress;
    }

    public void setTemporaryAddress(String temporaryAddress) {
        this.temporaryAddress = temporaryAddress;
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

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public int getQualificationId() {
        return qualificationId;
    }

    public void setQualificationId(int qualificationId) {
        this.qualificationId = qualificationId;
    }

    public String getHighestQualification() {
        return highestQualification;
    }

    public void setHighestQualification(String highestQualification) {
        this.highestQualification = highestQualification;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }

    public float getQualificationScore() {
        return qualificationScore;
    }

    public void setQualificationScore(float qualificationScore) {
        this.qualificationScore = qualificationScore;
    }

    public byte[] getCertificationImage() {
        return certificationImage;
    }

    public void setCertificationImage(byte[] certificationImage) {
        this.certificationImage = certificationImage;
    }

    public int getLicenseId() {
        return licenseId;
    }

    public void setLicenseId(int licenseId) {
        this.licenseId = licenseId;
    }

    public String getTeachingLicenseNumber() {
        return teachingLicenseNumber;
    }

    public void setTeachingLicenseNumber(String teachingLicenseNumber) {
        this.teachingLicenseNumber = teachingLicenseNumber;
    }

    public Date getLicenseIssueDate() {
        return licenseIssueDate;
    }

    public void setLicenseIssueDate(Date licenseIssueDate) {
        this.licenseIssueDate = licenseIssueDate;
    }

    public Date getLicenseExpiryDate() {
        return licenseExpiryDate;
    }

    public void setLicenseExpiryDate(Date licenseExpiryDate) {
        this.licenseExpiryDate = licenseExpiryDate;
    }

    public byte[] getLicenseImage() {
        return licenseImage;
    }

    public void setLicenseImage(byte[] licenseImage) {
        this.licenseImage = licenseImage;
    }

    public int getContactId() {
        return contactId;
    }

    public void setContactId(int contactId) {
        this.contactId = contactId;
    }

    public String getEmergencyContactName() {
        return emergencyContactName;
    }

    public void setEmergencyContactName(String emergencyContactName) {
        this.emergencyContactName = emergencyContactName;
    }

    public String getEmergencyContactNumber() {
        return emergencyContactNumber;
    }

    public void setEmergencyContactNumber(String emergencyContactNumber) {
        this.emergencyContactNumber = emergencyContactNumber;
    }

    public String getEmergencyEmail() {
        return emergencyEmail;
    }

    public void setEmergencyEmail(String emergencyEmail) {
        this.emergencyEmail = emergencyEmail;
    }

    public String getRelationshipWithEmergencyContact() {
        return relationshipWithEmergencyContact;
    }

    public void setRelationshipWithEmergencyContact(String relationshipWithEmergencyContact) {
        this.relationshipWithEmergencyContact = relationshipWithEmergencyContact;
    }
}
