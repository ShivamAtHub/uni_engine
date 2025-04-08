package com.universitysearch.controller;

import com.universitysearch.dao.CourseDAO;
import com.universitysearch.model.Course;
import com.universitysearch.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;

@WebServlet("/AddCourseServlet")
public class AddCourseServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int universityId = Integer.parseInt(request.getParameter("universityId"));
            String courseName = request.getParameter("courseName");
            String duration = request.getParameter("duration");
            String eligibility = request.getParameter("eligibility");

            Course course = new Course();
            course.setUniversityId(universityId);
            course.setCourseName(courseName);
            course.setDuration(duration);
            course.setEligibility(eligibility);

            Connection conn = DBConnection.getConnection();
            CourseDAO courseDAO = new CourseDAO(conn);

            boolean success = courseDAO.insertCourse(course);

            if (success) {
                response.setContentType("text/html");
                response.getWriter().println("<script>alert('Course added successfully!'); window.location='admin/dashboard.jsp';</script>");
            } else {
                response.setContentType("text/html");
                response.getWriter().println("<script>alert('Failed to add course. Please try again.'); window.location='admin/addCourse.jsp';</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<script>alert('Error occurred while adding course.'); window.location='admin/addCourse.jsp';</script>");
        }
    }
}
