<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%
    String adminUsername = (String) session.getAttribute("adminUsername");
    if (adminUsername == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<%@ include file="/common/navbar.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard | University Search Engine</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background: linear-gradient(to bottom right, #f0f4f8, #ffffff);
        }
    </style>
</head>
<body class="min-h-screen font-sans">

    <!-- Main Content -->
    <main class="max-w-7xl mx-auto py-12 px-4 grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-8">

        <!-- Dashboard Card Component -->
        <%
            String[][] cards = {
                {"Add University", "Insert a new university into the system.", "addUniversity.jsp"},
                {"Add Course", "Link and manage university courses.", "addCourse.jsp"},
                {"Add Faculty", "Manage faculty details under universities.", "addFaculty.jsp"},
                {"View Messages", "See user messages and inquiries.", "viewMessages.jsp"},
                {"View All Data", "Access complete data overview.", "viewData.jsp"}
            };
            for (String[] card : cards) {
        %>
        <a href="<%= card[2] %>" class="group block p-6 rounded-2xl bg-white/70 backdrop-blur-md border border-gray-200 shadow-md hover:shadow-xl hover:scale-[1.02] transition-all duration-300 ease-in-out">
            <h2 class="text-xl font-semibold text-gray-800 group-hover:text-blue-600 transition mb-2">
                <%= card[0] %>
            </h2>
            <p class="text-sm text-gray-600"><%= card[1] %></p>
        </a>
        <% } %>

    </main>

</body>
</html>
