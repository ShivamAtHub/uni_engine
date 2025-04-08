package com.universitysearch.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.universitysearch.util.DBConnection;

public class AdminDAO {

    public boolean validate(String username, String password) {
        boolean status = false;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = true;
            }

        } catch (Exception e) {
            System.out.println("❌ [AdminDAO ERROR] " + e.getMessage());
        }
        return status;
    }
}
