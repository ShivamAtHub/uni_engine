<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="University" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<html>
<head>
    <title>University Results</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">🎓 University Search Results</h2>

    <%
        List<University> universities = (List<University>) request.getAttribute("universities");
        if (universities == null || universities.isEmpty()) {
    %>
        <div class="alert alert-warning text-center">
            No universities found matching your criteria.
        </div>
    <%
        } else {
            for (University u : universities) {
    %>
        <div class="card mb-4 shadow">
            <div class="card-body">
                <h4 class="card-title text-primary"><%= u.getName() %></h4>
                <p class="card-text">
                    <strong>State:</strong> <%= u.getState() %><br>
                    <strong>Description:</strong> <%= u.getDescription() != null ? u.getDescription() : "No description available." %>
                </p>
                <% if (u.getWebsite() != null && !u.getWebsite().isEmpty()) { %>
                    <a href="<%= u.getWebsite() %>" class="btn btn-outline-primary btn-sm" target="_blank">Visit Website</a>
                <% } %>
            </div>
        </div>
    <%
            }
        }
    %>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
