<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="Faculty" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Faculty Details</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">Faculty Details</h2>
    <div class="row">
        <%
            List<Faculty> facultyList = (List<Faculty>) request.getAttribute("facultyList");
            if (facultyList != null && !facultyList.isEmpty()) {
                for (Faculty f : facultyList) {
        %>
        <div class="col-md-4 mb-4">
            <div class="card h-100 shadow">
                <div class="card-body">
                    <h5 class="card-title"><%= f.getName() %></h5>
                    <p class="card-text">
                        <strong>Email:</strong> <%= f.getEmail() %><br>
                        <strong>Department:</strong> <%= f.getDepartment() %><br>
                        <strong>Experience:</strong> <%= f.getExperience() %> years
                    </p>
                </div>
            </div>
        </div>
        <%      }
            } else { %>
        <div class="col-12 text-center">
            <p>No faculty data found for this university.</p>
        </div>
        <% } %>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
