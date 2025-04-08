<%@ page import="java.util.List" %>
<%@ page import="University" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<html>
<head>
    <title>Search Results</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">🎓 Search Results</h2>

    <%
        List<University> universities = (List<University>) request.getAttribute("universities");
        if (universities == null || universities.isEmpty()) {
    %>
        <p class="text-center text-muted">No universities found matching your criteria.</p>
    <%
        } else {
            for (University u : universities) {
    %>
        <div class="card mb-3 shadow">
            <div class="card-body">
                <h5 class="card-title"><%= u.getName() %></h5>
                <p class="card-text">State: <%= u.getState() %></p>
                <p class="card-text"><%= u.getDescription() %></p>
                <a href="<%= u.getWebsite() %>" class="btn btn-sm btn-outline-primary" target="_blank">Visit Website</a>
            </div>
        </div>
    <%
            }
        }
    %>
</div>
</body>
</html>
