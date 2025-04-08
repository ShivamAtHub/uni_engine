package com.universitysearch.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.universitysearch.dao.AdminDAO;

import java.io.IOException;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    private final AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        System.out.println("🛠️ Login attempt - Username: " + username + ", Password: " + password);

        boolean isValid = adminDAO.validate(username, password);
        System.out.println("✅ Admin Valid: " + isValid);

        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("adminUsername", username);
            session.setAttribute("role", "admin");

            // IMPORTANT: This should redirect (change the URL)
            response.sendRedirect(request.getContextPath() + "/admin/dashboard.jsp");
        } else {
            request.setAttribute("error", "Invalid admin credentials");
            request.getRequestDispatcher("/admin/login.jsp").forward(request, response);
        }
    }
}
