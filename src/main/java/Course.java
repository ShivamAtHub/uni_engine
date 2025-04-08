// ❌ REMOVE THIS LINE
// package com.universitysearch.model;

public class Course {
    private int id;
    private int universityId;
    private String courseName;
    private String duration;
    private String eligibility;

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getUniversityId() {
        return universityId;
    }
    public void setUniversityId(int universityId) {
        this.universityId = universityId;
    }

    public String getCourseName() {
        return courseName;
    }
    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDuration() {
        return duration;
    }
    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getEligibility() {
        return eligibility;
    }
    public void setEligibility(String eligibility) {
        this.eligibility = eligibility;
    }
}
