package com.universitysearch.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.universitysearch.dao.UniversityDAO;
import com.universitysearch.model.University;

@WebServlet("/addUniversity")
public class AddUniversityServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String location = request.getParameter("location");
        String website = request.getParameter("website");
        String description = request.getParameter("description");

        University university = new University(name, location, website, description);
        UniversityDAO dao = new UniversityDAO();

        boolean success = dao.addUniversity(university);

        if (success) {
            response.sendRedirect("admin/addUniversity.jsp?success=true");
        } else {
            request.setAttribute("error", "Failed to add university.");
            request.getRequestDispatcher("admin/addUniversity.jsp").forward(request, response);
        }
    }
}
