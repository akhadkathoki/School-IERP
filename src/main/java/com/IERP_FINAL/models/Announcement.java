package com.IERP_FINAL.models;


public class Announcement {
    private int id;
    private String heading;
    private String date;
    private String time;
    private String description;

    // Constructors
    public Announcement() {}

    public Announcement(int id, String heading, String date, String time, String description) {
        this.id = id;
        this.heading = heading;
        this.date = date;
        this.time = time;
        this.description = description;
    }

    // Getters & Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getHeading() { return heading; }
    public void setHeading(String heading) { this.heading = heading; }

    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }

    public String getTime() { return time; }
    public void setTime(String time) { this.time = time; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
