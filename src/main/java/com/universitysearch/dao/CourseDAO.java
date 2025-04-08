package com.universitysearch.dao;

import com.universitysearch.model.Course;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class CourseDAO {
    private final Connection conn;

    public CourseDAO(Connection conn) {
        this.conn = conn;
    }

    public boolean insertCourse(Course course) {
        String sql = "INSERT INTO courses (university_id, course_name, duration, eligibility) VALUES (?, ?, ?, ?)";

        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, course.getUniversityId());
            stmt.setString(2, course.getCourseName());
            stmt.setString(3, course.getDuration());
            stmt.setString(4, course.getEligibility());

            return stmt.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
