<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
%>

<!-- Tailwind-based modern navbar -->
<nav class="bg-white shadow-md px-6 py-4">
    <div class="max-w-7xl mx-auto flex items-center justify-between">
        <div class="text-xl font-bold text-gray-800">
            University Search
        </div>

        <ul class="flex space-x-6 items-center text-sm font-medium">
            <% if ("admin".equals(role)) { %>
                <li>
                    <a href="/admin/dashboard.jsp"
                       class="text-gray-700 hover:text-blue-600 transition hover:scale-105 duration-200 ease-in-out">
                        Dashboard
                    </a>
                </li>
                <li>
                    <a href="/admin/addUniversity.jsp"
                       class="text-gray-700 hover:text-blue-600 transition hover:scale-105 duration-200 ease-in-out">
                        Add University
                    </a>
                </li>
                <li>
                    <a href="/admin/addCourse.jsp"
                       class="text-gray-700 hover:text-blue-600 transition hover:scale-105 duration-200 ease-in-out">
                        Add Course
                    </a>
                </li>
                <li>
                    <a href="/admin/addFaculty.jsp"
                       class="text-gray-700 hover:text-blue-600 transition hover:scale-105 duration-200 ease-in-out">
                        Add Faculty
                    </a>
                </li>
                <li>
                    <a href="/admin/viewMessages.jsp"
                       class="text-gray-700 hover:text-blue-600 transition hover:scale-105 duration-200 ease-in-out">
                        View Messages
                    </a>
                </li>
                <li>
                    <a href="/admin/login.jsp"
                       class="text-red-500 hover:text-red-700 transition hover:scale-105 duration-200 ease-in-out">
                        Logout
                    </a>
                </li>
            <% } else { %>
                <li>
                    <a href="/user/home.jsp"
                       class="text-gray-700 hover:text-blue-600 transition hover:scale-105 duration-200 ease-in-out">
                        Home
                    </a>
                </li>
                <li>
                    <a href="/user/search.jsp"
                       class="text-gray-700 hover:text-blue-600 transition hover:scale-105 duration-200 ease-in-out">
                        Search Universities
                    </a>
                </li>
                <li>
                    <a href="/user/messageForm.jsp"
                       class="text-gray-700 hover:text-blue-600 transition hover:scale-105 duration-200 ease-in-out">
                        Contact Admin
                    </a>
                </li>
                <li>
                    <a href="/user/login.jsp"
                       class="text-red-500 hover:text-red-700 transition hover:scale-105 duration-200 ease-in-out">
                        Logout
                    </a>
                </li>
            <% } %>
        </ul>
    </div>
</nav>
