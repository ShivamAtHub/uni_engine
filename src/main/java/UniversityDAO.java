//import java.sql.*;
//import java.util.ArrayList;
//import java.util.List;
//
//public class UniversityDAO {
//
//    // Search universities based on name, state, and course
//    public List<University> searchUniversities(String name, String state, String course) {
//        List<University> list = new ArrayList<>();
//        try (Connection con = DBConnection.getConnection()) {
//            String sql = "SELECT DISTINCT u.* FROM universities u " +
//                    "LEFT JOIN courses c ON u.id = c.university_id " +
//                    "WHERE (u.name LIKE ? OR ? = '') " +
//                    "AND (u.state LIKE ? OR ? = '') " +
//                    "AND (c.name LIKE ? OR ? = '')";
//
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setString(1, "%" + name + "%");
//            ps.setString(2, name);
//            ps.setString(3, "%" + state + "%");
//            ps.setString(4, state);
//            ps.setString(5, "%" + course + "%");
//            ps.setString(6, course);
//
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                University u = new University();
//                u.setId(rs.getInt("id"));
//                u.setName(rs.getString("name"));
//                u.setState(rs.getString("state"));
//                u.setDescription(rs.getString("description"));
//                u.setWebsite(rs.getString("website"));
//                list.add(u);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//
//    // Get university by ID
//    public University getUniversityById(int id) {
//        University uni = null;
//        try (Connection con = DBConnection.getConnection()) {
//            String sql = "SELECT * FROM universities WHERE id = ?";
//            PreparedStatement ps = con.prepareStatement(sql);
//            ps.setInt(1, id);
//            ResultSet rs = ps.executeQuery();
//
//            if (rs.next()) {
//                uni = new University();
//                uni.setId(rs.getInt("id"));
//                uni.setName(rs.getString("name"));
//                uni.setState(rs.getString("state"));
//                uni.setDescription(rs.getString("description"));
//                uni.setWebsite(rs.getString("website"));
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return uni;
//    }
//
//    // Get all universities (optional for admin view or dropdowns)
//    public List<University> getAllUniversities() {
//        List<University> list = new ArrayList<>();
//        try (Connection con = DBConnection.getConnection()) {
//            String sql = "SELECT * FROM universities ORDER BY name ASC";
//            PreparedStatement ps = con.prepareStatement(sql);
//            ResultSet rs = ps.executeQuery();
//
//            while (rs.next()) {
//                University u = new University();
//                u.setId(rs.getInt("id"));
//                u.setName(rs.getString("name"));
//                u.setState(rs.getString("state"));
//                u.setDescription(rs.getString("description"));
//                u.setWebsite(rs.getString("website"));
//                list.add(u);
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return list;
//    }
//}
