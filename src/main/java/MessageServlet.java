import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/MessageServlet")
public class MessageServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve message details
        String toFacultyIdStr = request.getParameter("facultyId");
        String subject = request.getParameter("subject");
        String message = request.getParameter("message");

        // Get user session
        HttpSession session = request.getSession(false);
        Integer fromUserId = (session != null) ? (Integer) session.getAttribute("userId") : null;

        // Safety check
        if (fromUserId == null || toFacultyIdStr == null || toFacultyIdStr.trim().isEmpty()) {
            response.sendRedirect("user/messageForm.jsp?error=Missing+data");
            return;
        }

        int toFacultyId = Integer.parseInt(toFacultyIdStr);

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            conn = DBConnection.getConnection();

            String sql = "INSERT INTO messages (from_user_id, to_faculty_id, subject, message) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, fromUserId);
            stmt.setInt(2, toFacultyId);
            stmt.setString(3, subject);
            stmt.setString(4, message);

            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("user/home.jsp?msg=Message+sent+successfully");
            } else {
                request.setAttribute("error", "Failed to send message.");
                request.getRequestDispatcher("user/messageForm.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error while sending message.");
            request.getRequestDispatcher("user/messageForm.jsp").forward(request, response);
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
