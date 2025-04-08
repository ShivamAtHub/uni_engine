<%@ page import="javax.servlet.http.*, javax.servlet.*" %>

<%
    String role = (session != null) ? (String) session.getAttribute("role") : null;
%>

<nav>
    <ul>
        <% if ("admin".equals(role)) { %>
            <!-- Admin navbar -->
            <li><a href="/admin/dashboard.jsp">Dashboard</a></li>
            <li><a href="/admin/addUniversity.jsp">Add University</a></li>
            <li><a href="/admin/addCourse.jsp">Add Course</a></li>
            <li><a href="/admin/addFaculty.jsp">Add Faculty</a></li>
            <li><a href="/admin/viewMessages.jsp">View Messages</a></li>
            <li><a href="/admin/login.jsp">Logout</a></li>
        <% } else { %>
            <!-- User navbar -->
            <li><a href="/user/home.jsp">Home</a></li>
            <li><a href="/user/search.jsp">Search Universities</a></li>
            <li><a href="/user/messageForm.jsp">Contact Admin</a></li>
            <li><a href="/user/login.jsp">Logout</a></li>
        <% } %>
    </ul>
</nav>
