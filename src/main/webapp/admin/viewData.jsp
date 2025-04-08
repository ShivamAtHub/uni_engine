<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.University, model.Course, model.Faculty, dao.UniversityDAO, dao.CourseDAO, dao.FacultyDAO" %>
<%@ page session="true" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
    if (adminUsername == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<University> universities = UniversityDAO.getAllUniversities();
    List<Course> courses = CourseDAO.getAllCourses();
    List<Faculty> faculties = FacultyDAO.getAllFaculties();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Data | University Search Engine</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

<!-- Navbar -->
<nav class="bg-white shadow-md p-4 flex justify-between items-center">
    <h1 class="text-xl font-bold text-gray-800">All Data Overview</h1>
    <div>
        <span class="text-gray-600 mr-4">Welcome, <strong><%= adminUsername %></strong></span>
        <a href="login.jsp" class="text-blue-600 hover:underline">Logout</a>
    </div>
</nav>

<!-- Back Button -->
<div class="absolute top-24 left-6">
    <a href="dashboard.jsp"
       class="inline-flex items-center text-blue-600 hover:text-blue-800 transition text-sm font-medium">
        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24"
             stroke="currentColor" stroke-width="2">
            <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
        </svg>
        Back to Dashboard
    </a>
</div>

<!-- Content -->
<main class="max-w-6xl mx-auto mt-28 px-4 space-y-12 pb-12">

    <!-- Universities -->
    <section>
        <h2 class="text-2xl font-semibold text-gray-800 mb-4">Universities</h2>
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
            <%
                for (University uni : universities) {
            %>
            <div class="bg-white rounded-lg shadow p-4">
                <h3 class="font-bold text-lg text-gray-800"><%= uni.getName() %></h3>
                <p class="text-sm text-gray-600">Location: <%= uni.getLocation() %></p>
                <p class="text-sm text-gray-600">Website: <a href="<%= uni.getWebsite() %>" class="text-blue-600 hover:underline" target="_blank"><%= uni.getWebsite() %></a></p>
                <p class="text-sm text-gray-700 mt-2"><%= uni.getDescription() %></p>
            </div>
            <%
                }
            %>
        </div>
    </section>

    <!-- Courses -->
    <section>
        <h2 class="text-2xl font-semibold text-gray-800 mb-4">Courses</h2>
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
            <%
                for (Course course : courses) {
            %>
            <div class="bg-white rounded-lg shadow p-4">
                <h3 class="font-semibold text-lg text-gray-800"><%= course.getName() %></h3>
                <p class="text-sm text-gray-600">University ID: <%= course.getUniversityId() %></p>
                <p class="text-sm text-gray-600">Duration: <%= course.getDuration() %></p>
            </div>
            <%
                }
            %>
        </div>
    </section>

    <!-- Faculties -->
    <section>
        <h2 class="text-2xl font-semibold text-gray-800 mb-4">Faculties</h2>
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-4">
            <%
                for (Faculty faculty : faculties) {
            %>
            <div class="bg-white rounded-lg shadow p-4">
                <h3 class="font-semibold text-lg text-gray-800"><%= faculty.getName() %></h3>
                <p class="text-sm text-gray-600">Email: <%= faculty.getEmail() %></p>
                <p class="text-sm text-gray-600">Phone: <%= faculty.getPhone() %></p>
                <p class="text-sm text-gray-600">University ID: <%= faculty.getUniversityId() %></p>
            </div>
            <%
                }
            %>
        </div>
    </section>

</main>

</body>
</html>
