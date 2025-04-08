package com.universitysearch.dao;

import com.universitysearch.model.Faculty;
import com.universitysearch.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class FacultyDAO {
    public boolean addFaculty(Faculty faculty) {
        boolean success = false;

        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO faculties (university_id, name, designation, email, publications) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, faculty.getUniversityId());
            ps.setString(2, faculty.getName());
            ps.setString(3, faculty.getDesignation());
            ps.setString(4, faculty.getEmail());
            ps.setString(5, faculty.getPublications());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                success = true;
            }

            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return success;
    }
}
