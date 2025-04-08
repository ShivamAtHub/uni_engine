import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UniversityDAO {

    public List<University> searchUniversities(String name, String location, String course) {
        List<University> list = new ArrayList<>();

        String query = "SELECT DISTINCT u.* FROM universities u " +
                "LEFT JOIN courses c ON u.id = c.university_id " +
                "WHERE (? IS NULL OR u.name LIKE ?) " +
                "AND (? IS NULL OR u.location LIKE ?) " +
                "AND (? IS NULL OR c.course_name LIKE ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(query)) {

            stmt.setString(1, isEmpty(name) ? null : name);
            stmt.setString(2, isEmpty(name) ? null : "%" + name + "%");

            stmt.setString(3, isEmpty(location) ? null : location);
            stmt.setString(4, isEmpty(location) ? null : "%" + location + "%");

            stmt.setString(5, isEmpty(course) ? null : course);
            stmt.setString(6, isEmpty(course) ? null : "%" + course + "%");

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                University u = new University();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                u.setLocation(rs.getString("location"));
                u.setWebsite(rs.getString("website"));
                u.setDescription(rs.getString("description"));
                list.add(u);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    private boolean isEmpty(String str) {
        return str == null || str.trim().isEmpty();
    }
}
