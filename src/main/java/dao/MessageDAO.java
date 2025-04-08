package dao;

import model.Message;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MessageDAO {

    public static List<Message> getAllMessages() throws SQLException {
        List<Message> messages = new ArrayList<>();

        String query = "SELECT id, from_user_id, to_faculty_id, subject, message, sent_at FROM messages ORDER BY sent_at DESC";

        try (Connection conn = db.DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Message message = new Message();
                message.setId(rs.getInt("id"));
                message.setFromUserId(rs.getInt("from_user_id"));
                message.setToFacultyId(rs.getInt("to_faculty_id"));
                message.setSubject(rs.getString("subject"));
                message.setMessage(rs.getString("message"));
                message.setSentAt(rs.getTimestamp("sent_at"));

                messages.add(message);
            }
        }

        return messages;
    }
}
