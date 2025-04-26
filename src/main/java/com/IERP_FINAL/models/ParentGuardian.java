package com.IERP_FINAL.models;


import java.util.Date;

public class ParentGuardian {
    private int guardianId;
    private Integer studentId;
    private String role;
    private String fullName;
    private String gender;
    private Date dateOfBirth;
    private String nationality;
    private String contactNumber;
    private String emailAddress;
    private String username;
    private String password;
    private String permanentAddress;
    private String temporaryAddress;
    private String citizenshipNumber;
    private String citizenshipIssuePlace;
    private Date citizenshipIssueDate;
 
    private byte[] photo;

    // Getters and Setters

    public int getGuardianId() {
        return guardianId;
    }

    public void setGuardianId(int guardianId) {
        this.guardianId = guardianId;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
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

    

    public byte[] getPhoto() {
        return photo;
    }

    public void setPhoto(byte[] photo) {
        this.photo = photo;
    }
}
