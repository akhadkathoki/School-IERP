package com.IERP_FINAL.models;


public class ClassSubjectStudent {
    private String rollNo;

    private String className;
    private int studentId;

    public ClassSubjectStudent(String rollNo, String className,  int studentId) {
    	this.rollNo = rollNo;
        this.className = className;
        this.studentId = studentId;
    }

    // Getters and Setters
    public String getRollNo() { return rollNo; }
    public void setRollNo(String rollNo) { this.rollNo = rollNo; }
    
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }


    public int getStudentId() { return studentId; }
    public void setStudentId(int studentId) { this.studentId = studentId; }
}
