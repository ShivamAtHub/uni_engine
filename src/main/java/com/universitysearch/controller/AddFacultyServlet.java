package com.universitysearch.controller;

import com.universitysearch.dao.FacultyDAO;
import com.universitysearch.model.Faculty;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

@WebServlet("/AddFacultyServlet")
public class AddFacultyServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int universityId = Integer.parseInt(request.getParameter("universityId"));
            String name = request.getParameter("facultyName");
            String designation = request.getParameter("designation");
            String email = request.getParameter("email");
            String publications = request.getParameter("publications");

            Faculty faculty = new Faculty(universityId, name, designation, email, publications);
            FacultyDAO dao = new FacultyDAO();

            boolean success = dao.addFaculty(faculty);

            if (success) {
                response.sendRedirect("admin/addFaculty.jsp?status=success");
            } else {
                response.sendRedirect("admin/addFaculty.jsp?status=error");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("admin/addFaculty.jsp?status=error");
        }
    }
}
