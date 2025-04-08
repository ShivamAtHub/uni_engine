<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="University" %>
<%@ page import="UniversityDAO" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<%
    UniversityDAO universityDAO = new UniversityDAO();
    List<University> universityList = universityDAO.getAllUniversities();
%>

<html>
<head>
    <title>User Registration</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">📝 User Registration</h2>

    <form action="<%= request.getContextPath() %>/RegisterServlet" method="post" class="row g-3 shadow p-4 rounded bg-light">
        <div class="col-md-6">
            <label class="form-label">Full Name</label>
            <input type="text" name="name" class="form-control" required>
        </div>
        <div class="col-md-6">
            <label class="form-label">Email</label>
            <input type="email" name="email" class="form-control" required>
        </div>
        <div class="col-md-6">
            <label class="form-label">Roll Number</label>
            <input type="text" name="rollNo" class="form-control" required>
        </div>
        <div class="col-md-6">
            <label class="form-label">Password</label>
            <input type="password" name="password" class="form-control" required>
        </div>
        <div class="col-md-12">
            <label class="form-label">Select University</label>
            <select name="universityId" class="form-select" required>
                <option value="">-- Select University --</option>
                <% for (University uni : universityList) { %>
                    <option value="<%= uni.getId() %>"><%= uni.getName() %></option>
                <% } %>
            </select>
        </div>
        <div class="col-12 text-center mt-3">
            <button type="submit" class="btn btn-success px-5">Register</button>
        </div>
    </form>
</div>
</body>
</html>
