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
    <title>Add University | Admin Panel</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen flex flex-col">

    <!-- Navbar -->
    <nav class="bg-white shadow-md p-4 flex justify-between items-center">
        <h1 class="text-xl font-bold text-gray-800">Add University</h1>
        <div>
            <span class="text-gray-600 mr-4">Admin: <strong><%= adminUsername %></strong></span>
            <a href="dashboard.jsp" class="text-blue-600 hover:underline mr-3">Dashboard</a>
            <a href="login.jsp" class="text-red-600 hover:underline">Logout</a>
        </div>
    </nav>

    <!-- Form Section -->
    <main class="flex-grow flex items-center justify-center p-6">
    <!-- Back Button -->
                <div class="absolute top-24 left-6">
                    <a href="dashboard.jsp"
                       class="inline-flex items-center text-blue-600 hover:text-blue-800 transition text-sm font-medium">
                        <!-- Left Arrow Icon -->
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24"
                             stroke="currentColor" stroke-width="2">
                            <path stroke-linecap="round" stroke-linejoin="round" d="M15 19l-7-7 7-7" />
                        </svg>
                        Back to Dashboard
                    </a>
                </div>
        <div class="bg-white shadow-lg rounded-xl p-8 w-full max-w-xl">
            <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">Insert University Details</h2>

            <form action="<%= request.getContextPath() %>/addUniversity" method="post" class="space-y-5">

                <div>
                    <label for="name" class="block text-gray-700 mb-1">University Name</label>
                    <input type="text" id="name" name="name" required
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
                </div>

                <div>
                    <label for="location" class="block text-gray-700 mb-1">Location</label>
                    <input type="text" id="location" name="location" required
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
                </div>

                <div>
                    <label for="website" class="block text-gray-700 mb-1">Website</label>
                    <input type="url" id="website" name="website"
                           class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500" />
                </div>

                <div>
                    <label for="description" class="block text-gray-700 mb-1">Description</label>
                    <textarea id="description" name="description" rows="4"
                              class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500"></textarea>
                </div>

                <button type="submit"
                        class="w-full bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition duration-300">
                    Add University
                </button>
            </form>

        </div>
    </main>

</body>
</html>
