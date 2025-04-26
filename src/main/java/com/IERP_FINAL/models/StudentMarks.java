package com.IERP_FINAL.models;

public class StudentMarks {
    private int id;
    private Integer studentId;
    private String rollNo;
    private String fullName;
    private String className;
    private String studentName;
    private Integer subjectId;
    private String subjectName;
    private Double fullMarks;
    private Double marks;
    private Double percentage;
    private String grade;
    private Integer createdByTeacherId;
    private String term;
    private Integer academicYear;

    // Getters and Setters

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public String getRollNo() {
        return rollNo;
    }
    public void SetRollNo(String rollNo) {
        this.rollNo = rollNo;
    }
    public String getFullName() {
        return fullName;
    }
    public void setFullName(String fullName) {
        this.fullName = fullName;
    }
    public Integer getStudentId() {
        return studentId;
    }
    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public Integer getSubjectId() {
        return subjectId;
    }
    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubjectName() {
        return subjectName;
    }
    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }
    public String getClassName() {
        return className;
    }
    public void setClassName(String className) {
        this.className = className;
    }
    
    public String getStudentName() {
        return studentName;
    }
    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Double getFullMarks() {
        return fullMarks;
    }
    public void setFullMarks(Double fullMarks) {
        this.fullMarks = fullMarks;
    }

    public Double getMarks() {
        return marks;
    }
    public void setMarks(Double marks) {
        this.marks = marks;
    }

    public Double getPercentage() {
        return percentage;
    }
    public void setPercentage(Double percentage) {
        this.percentage = percentage;
    }

    public String getGrade() {
        return grade;
    }
    public void setGrade(String grade) {
        this.grade = grade;
    }

    public Integer getCreatedByTeacherId() {
        return createdByTeacherId;
    }
    public void setCreatedByTeacherId(Integer createdByTeacherId) {
        this.createdByTeacherId = createdByTeacherId;
    }

    public String getTerm() {
        return term;
    }
    public void setTerm(String term) {
        this.term = term;
    }

    public Integer getAcademicYear() {
        return academicYear;
    }
    public void setAcademicYear(Integer academicYear) {
        this.academicYear = academicYear;
    }
}
