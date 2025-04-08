package com.universitysearch.model;

public class Faculty {
    private int id;
    private int universityId;
    private String name;
    private String designation;
    private String email;
    private String publications;

    // Constructors
    public Faculty() {}

    public Faculty(int universityId, String name, String designation, String email, String publications) {
        this.universityId = universityId;
        this.name = name;
        this.designation = designation;
        this.email = email;
        this.publications = publications;
    }

    // Getters and setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public int getUniversityId() { return universityId; }
    public void setUniversityId(int universityId) { this.universityId = universityId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDesignation() { return designation; }
    public void setDesignation(String designation) { this.designation = designation; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPublications() { return publications; }
    public void setPublications(String publications) { this.publications = publications; }
}
