package com.IERP_FINAL.models;

import java.security.Timestamp;
import java.sql.Date;

public class LeaveApplicationModel {
	private int id;
    private int studentId;
    private String leaveType;
    private String subject;
    private Date fromDate;
    private Date toDate;
    private String description;
    private java.sql.Timestamp submittedAt;

    // Constructors
    public LeaveApplicationModel() {}

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    // Getters and Setters
    public String getLeaveType() {
        return leaveType;
    }

    public void setLeaveType(String leaveType) {
        this.leaveType = leaveType;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public Date getFromDate() {
        return fromDate;
    }

    public void setFromDate(Date fromDate) {
        this.fromDate = fromDate;
    }

    public Date getToDate() {
        return toDate;
    }

    public void setToDate(Date toDate) {
        this.toDate = toDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
    
    public java.sql.Timestamp getSubmittedTime() {
        return submittedAt;
    }

    public void setSubmittedTime(java.sql.Timestamp submittedAt) {
        this.submittedAt = submittedAt;
    }
    





}
