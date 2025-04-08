<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
    if (adminUsername == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | University Search Engine</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

    <!-- Navbar -->
    <nav class="bg-white shadow-md p-4 flex justify-between items-center">
        <h1 class="text-xl font-bold text-gray-800">Admin Dashboard</h1>
        <div>
            <span class="text-gray-600 mr-4">Welcome, <strong><%= adminUsername %></strong></span>
            <a href="login.jsp" class="text-blue-600 hover:underline">Logout</a>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="max-w-6xl mx-auto py-10 px-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">

        <!-- Card: Add University -->
        <a href="addUniversity.jsp" class="block bg-white rounded-xl shadow-md p-6 hover:shadow-xl transition">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">Add University</h2>
            <p class="text-sm text-gray-500">Insert a new university into the system.</p>
        </a>

        <!-- Card: Add Course -->
        <a href="addCourse.jsp" class="block bg-white rounded-xl shadow-md p-6 hover:shadow-xl transition">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">Add Course</h2>
            <p class="text-sm text-gray-500">Link and manage university courses.</p>
        </a>

        <!-- Card: Add Faculty -->
        <a href="addFaculty.jsp" class="block bg-white rounded-xl shadow-md p-6 hover:shadow-xl transition">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">Add Faculty</h2>
            <p class="text-sm text-gray-500">Manage faculty details under universities.</p>
        </a>

        <!-- Card: View Messages -->
        <a href="viewMessages.jsp" class="block bg-white rounded-xl shadow-md p-6 hover:shadow-xl transition">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">View Messages</h2>
            <p class="text-sm text-gray-500">See user messages and inquiries.</p>
        </a>

        <!-- Card: View All Data -->
        <a href="viewData.jsp" class="block bg-white rounded-xl shadow-md p-6 hover:shadow-xl transition">
            <h2 class="text-lg font-semibold text-gray-800 mb-2">View All Data</h2>
            <p class="text-sm text-gray-500">Access complete data overview.</p>
        </a>

    </div>

</body>
</html>
