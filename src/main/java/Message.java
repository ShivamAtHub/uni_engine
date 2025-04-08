package com.universitysearch.model;

import java.sql.Timestamp;

public class Message {
    private int id;
    private int fromUserId;
    private int toFacultyId;
    private String subject;
    private String message;
    private Timestamp sentAt;

    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }

    public int getFromUserId() {
        return fromUserId;
    }
    public void setFromUserId(int fromUserId) {
        this.fromUserId = fromUserId;
    }

    public int getToFacultyId() {
        return toFacultyId;
    }
    public void setToFacultyId(int toFacultyId) {
        this.toFacultyId = toFacultyId;
    }

    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }

    public Timestamp getSentAt() {
        return sentAt;
    }
    public void setSentAt(Timestamp sentAt) {
        this.sentAt = sentAt;
    }
}
