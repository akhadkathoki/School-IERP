package com.IERP_FINAL.models;

import java.sql.Date;

public class Classroom {
    private String className;
    private int classLevel;
    private String section;
    private int classTeacherId;
    private Date createdAt;

    public Classroom() {}

    public Classroom(String className, int classLevel, String section, int classTeacherId, Date createdAt) {
        this.className = className;
        this.classLevel = classLevel;
        this.section = section;
        this.classTeacherId = classTeacherId;
        this.createdAt = createdAt;
    }

    // Getters and Setters
    public String getClassName() { return className; }
    public void setClassName(String className) { this.className = className; }

    public int getClassLevel() { return classLevel; }
    public void setClassLevel(int classLevel) { this.classLevel = classLevel; }

    public String getSection() { return section; }
    public void setSection(String section) { this.section = section; }

    public int getClassTeacherId() { return classTeacherId; }
    public void setClassTeacherId(int classTeacherId) { this.classTeacherId = classTeacherId; }

    public Date getCreatedAt() { return (Date) createdAt; }
    public void setCreatedAt(Date createDate) { this.createdAt = createDate; }


}