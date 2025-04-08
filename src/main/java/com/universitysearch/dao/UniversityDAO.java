package com.universitysearch.dao;


import com.universitysearch.model.University;
import com.universitysearch.util.DBConnection;


import java.sql.*;
import java.util.ArrayList;
import java.util.List;


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


    // 🔍 Search universities by keyword (in name or location)
    public List<University> searchUniversities(String keyword) {
        List<University> list = new ArrayList<>();
        String sql = "SELECT * FROM universities WHERE name LIKE ? OR location LIKE ?";


        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {


            String searchPattern = "%" + keyword + "%";
            ps.setString(1, searchPattern);
            ps.setString(2, searchPattern);


            ResultSet rs = ps.executeQuery();


            while (rs.next()) {
                University uni = new University();
                uni.setId(rs.getInt("id"));
                uni.setName(rs.getString("name"));
                uni.setLocation(rs.getString("location"));
                uni.setWebsite(rs.getString("website"));
                uni.setDescription(rs.getString("description"));
                list.add(uni);
            }


        } catch (Exception e) {
            System.out.println("❌ [searchUniversities ERROR] " + e.getMessage());
        }


        return list;
    }
}
