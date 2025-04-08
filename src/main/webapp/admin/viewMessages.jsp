<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, model.Message" %>
<%@ page session="true" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
    if (adminUsername == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    List<Message> messages = (List<Message>) request.getAttribute("messages");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View Messages | University Search Engine</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 min-h-screen">

<!-- Navbar -->
<nav class="bg-white shadow-md p-4 flex justify-between items-center">
    <h1 class="text-xl font-bold text-gray-800">User Messages</h1>
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

<!-- Messages Section -->
<main class="max-w-5xl mx-auto mt-28 px-4">
    <h2 class="text-2xl font-semibold text-gray-800 mb-6 text-center">Inbox</h2>

    <div class="space-y-4">
        <%
            if (messages == null || messages.isEmpty()) {
        %>
            <div class="text-center text-gray-500">No messages found.</div>
        <%
            } else {
                for (Message msg : messages) {
        %>
            <div class="bg-white rounded-lg shadow p-6 hover:shadow-lg transition">

                <p class="text-sm text-gray-600 mb-2">To Faculty ID: <%= msg.getToFacultyId() %></p>

                <p class="text-right text-xs text-gray-400 mt-2"><%= msg.getSentAt() %></p>
            </div>
        <%
                }
            }
        %>
    </div>
</main>

</body>
</html>
