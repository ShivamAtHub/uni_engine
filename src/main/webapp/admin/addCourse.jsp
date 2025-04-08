<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
    if (adminUsername == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String success = request.getParameter("success");
    String error = request.getParameter("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Course | University Search Engine</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

<!-- Navbar -->
<nav class="bg-white shadow-md p-4 flex justify-between items-center">
    <h1 class="text-xl font-bold text-gray-800">Add Course</h1>
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

<!-- Form -->
<main class="flex justify-center items-center mt-20">
    <div class="bg-white shadow-lg rounded-xl p-8 w-full max-w-xl">
        <h2 class="text-2xl font-semibold text-center text-gray-800 mb-6">Add New Course</h2>

        <form action="../AddCourseServlet" method="post" class="space-y-4">
            <div>
                <label for="universityId" class="block text-gray-700">University ID</label>
                <input type="number" name="universityId" id="universityId" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="courseName" class="block text-gray-700">Course Name</label>
                <input type="text" name="courseName" id="courseName" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="duration" class="block text-gray-700">Duration</label>
                <input type="text" name="duration" id="duration" placeholder="e.g., 4 years" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="eligibility" class="block text-gray-700">Eligibility</label>
                <textarea name="eligibility" id="eligibility" rows="3" required
                          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"
                          placeholder="e.g., 12th pass with minimum 50%"></textarea>
            </div>

            <button type="submit"
                    class="w-full bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700 transition duration-300">
                Submit Course
            </button>
        </form>
    </div>
</main>
<% if ("true".equals(success)) { %>
<script>
    alert("✅ Course added successfully!");
    window.location.href = "dashboard.jsp";
</script>
<% } else if ("true".equals(error)) { %>
<script>
    alert("❌ Failed to add course. Please try again.");
</script>
<% } %>
</body>
</html>
