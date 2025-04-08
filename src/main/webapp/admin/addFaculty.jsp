<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
    if (adminUsername == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    String status = request.getParameter("status");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Faculty | University Search Engine</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

<!-- Navbar -->
<nav class="bg-white shadow-md p-4 flex justify-between items-center">
    <h1 class="text-xl font-bold text-gray-800">Add Faculty</h1>
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

<!-- Alert Messages -->
<% if ("success".equals(status)) { %>
    <div class="max-w-xl mx-auto mt-6">
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded relative" role="alert">
            <strong class="font-bold">Success!</strong>
            <span class="block sm:inline">Faculty added successfully.</span>
        </div>
    </div>
<% } else if ("error".equals(status)) { %>
    <div class="max-w-xl mx-auto mt-6">
        <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded relative" role="alert">
            <strong class="font-bold">Error!</strong>
            <span class="block sm:inline">Something went wrong. Please try again.</span>
        </div>
    </div>
<% } %>

<!-- Form -->
<main class="flex justify-center items-center mt-6">
    <div class="bg-white shadow-lg rounded-xl p-8 w-full max-w-xl">
        <h2 class="text-2xl font-semibold text-center text-gray-800 mb-6">Add New Faculty</h2>

        <form action="../AddFacultyServlet" method="post" class="space-y-4">
            <div>
                <label for="universityId" class="block text-gray-700">University ID</label>
                <input type="number" name="universityId" id="universityId" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="facultyName" class="block text-gray-700">Faculty Name</label>
                <input type="text" name="facultyName" id="facultyName" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="designation" class="block text-gray-700">Designation</label>
                <input type="text" name="designation" id="designation"
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="email" class="block text-gray-700">Email</label>
                <input type="email" name="email" id="email" required
                       class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500">
            </div>

            <div>
                <label for="publications" class="block text-gray-700">Publications</label>
                <textarea name="publications" id="publications" rows="4"
                          class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
            </div>

            <button type="submit"
                    class="w-full bg-blue-600 text-white py-2 px-4 rounded-lg hover:bg-blue-700 transition duration-300">
                Submit Faculty
            </button>
        </form>

    </div>
</main>

</body>
</html>
