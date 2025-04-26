package com.IERP_FINAL.models;

public class Subject {
    private int subjectId;
    private String subjectName;
    private String subjectCode;
    private String subjectType;
    private String className;
    private Integer fullMarks; // Nullable field
    private int subjectTeacherId;

    // Constructors
    public Subject() {}

    public Subject(int subjectId, String subjectName, String subjectCode, String subjectType, String className, Integer fullMarks, int subjectTeacherId) {
        this.subjectId = subjectId;
        this.subjectName = subjectName;
        this.subjectCode = subjectCode;
        this.subjectType = subjectType;
        this.className = className;
        this.fullMarks = fullMarks;
        this.subjectTeacherId = subjectTeacherId;
    }

    // Getters and Setters
    public int getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(int subjectId) {
        this.subjectId = subjectId;
    }

    public String getSubjectName() {
        return subjectName;
    }

    public void setSubjectName(String subjectName) {
        this.subjectName = subjectName;
    }

    public String getSubjectCode() {
        return subjectCode;
    }

    public void setSubjectCode(String subjectCode) {
        this.subjectCode = subjectCode;
    }

    public String getSubjectType() {
        return subjectType;
    }

    public void setSubjectType(String subjectType) {
        this.subjectType = subjectType;
    }

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public Integer getFullMarks() {
        return fullMarks;
    }

    public void setFullMarks(Integer fullMarks) {
        this.fullMarks = fullMarks;
    }

    public int getSubjectTeacherId() {
        return subjectTeacherId;
    }

    public void setSubjectTeacherId(int subjectTeacherId) {
        this.subjectTeacherId = subjectTeacherId;
    }
}
