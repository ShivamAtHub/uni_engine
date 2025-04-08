import java.sql.Connection;
import java.sql.PreparedStatement;

public class UserDAO {

    public boolean registerUser(User user) {
        boolean isRegistered = false;

        try (Connection conn = DBConnection.getConnection()) {
            String sql = "INSERT INTO users (name, email, password, roll_no, university_id) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.setString(4, user.getRollNo());

            if (user.getUniversityId() != null) {
                stmt.setInt(5, user.getUniversityId());
            } else {
                stmt.setNull(5, java.sql.Types.INTEGER);
            }

            int rows = stmt.executeUpdate();
            if (rows > 0) {
                isRegistered = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return isRegistered;
    }
}
