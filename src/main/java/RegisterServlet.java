import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        User user = new User(name, email, phone, password);
        UserDAO dao = new UserDAO();
        boolean success = dao.registerUser(user);

        if (success) {
            response.sendRedirect("user/login.jsp");
        } else {
            request.setAttribute("error", "Registration failed. Try again.");
            request.getRequestDispatcher("user/register.jsp").forward(request, response);
        }
    }
}
