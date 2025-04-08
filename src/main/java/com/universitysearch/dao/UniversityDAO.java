package com.universitysearch.dao;

import com.universitysearch.model.University;
import com.universitysearch.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class UniversityDAO {

    public boolean addUniversity(University university) {
        boolean status = false;

        String sql = "INSERT INTO universities (name, location, website, description) VALUES (?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, university.getName());
            ps.setString(2, university.getLocation());
            ps.setString(3, university.getWebsite());
            ps.setString(4, university.getDescription());

            int rows = ps.executeUpdate();
            status = rows > 0;

        } catch (Exception e) {
            System.out.println("❌ [UniversityDAO ERROR] " + e.getMessage());
        }

        return status;
    }
}
