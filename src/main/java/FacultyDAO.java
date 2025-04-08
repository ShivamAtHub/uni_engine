import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FacultyDAO {

    public boolean addFaculty(Faculty faculty) {
        String sql = "INSERT INTO faculties (university_id, name, designation, email, publications) VALUES (?, ?, ?, ?, ?)";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, faculty.getUniversityId());
            ps.setString(2, faculty.getName());
            ps.setString(3, faculty.getDesignation());
            ps.setString(4, faculty.getEmail());
            ps.setString(5, faculty.getPublications());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<Faculty> getFacultyByUniversityId(int universityId) {
        List<Faculty> list = new ArrayList<>();
        String sql = "SELECT * FROM faculties WHERE university_id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, universityId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Faculty f = new Faculty();
                f.setId(rs.getInt("id"));
                f.setUniversityId(rs.getInt("university_id"));
                f.setName(rs.getString("name"));
                f.setDesignation(rs.getString("designation"));
                f.setEmail(rs.getString("email"));
                f.setPublications(rs.getString("publications"));
                list.add(f);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Faculty getFacultyById(int id) {
        String sql = "SELECT * FROM faculties WHERE id = ?";
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Faculty f = new Faculty();
                f.setId(rs.getInt("id"));
                f.setUniversityId(rs.getInt("university_id"));
                f.setName(rs.getString("name"));
                f.setDesignation(rs.getString("designation"));
                f.setEmail(rs.getString("email"));
                f.setPublications(rs.getString("publications"));
                return f;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean deleteFaculty(int id) {
        String sql = "DELETE FROM faculties WHERE id = ?";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setInt(1, id);
            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
