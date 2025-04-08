import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String rollNo = request.getParameter("rollNo");
        String universityIdParam = request.getParameter("universityId");

        Integer universityId = null;
        if (universityIdParam != null && !universityIdParam.isEmpty()) {
            universityId = Integer.parseInt(universityIdParam);
        }

        User user = new User(name, email, password, rollNo, universityId);
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
