//package com.universitysearch.dao;
//
//import com.universitysearch.model.Admin;
//import com.universitysearch.util.DBConnection;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//
//public class AdminDAO {
//
//    public Admin login(String username, String password) {
//        String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
//
//        try (Connection con = DBConnection.getConnection();
//             PreparedStatement ps = con.prepareStatement(sql)) {
//
//            ps.setString(1, username);
//            ps.setString(2, password);
//
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                Admin admin = new Admin();
//                admin.setId(rs.getInt("id"));
//                admin.setUsername(rs.getString("username"));
//                admin.setPassword(rs.getString("password"));
//                return admin;
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return null;
//    }
//}
