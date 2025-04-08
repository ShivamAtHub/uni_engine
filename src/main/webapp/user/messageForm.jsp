<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Faculty" %>
<%@ page import="dao.FacultyDAO" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<%
    Integer userId = (Integer) session.getAttribute("userId");
    if (userId == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    FacultyDAO facultyDAO = new FacultyDAO();
    List<Faculty> facultyList = facultyDAO.getAllFaculties();
%>

<!DOCTYPE html>
<html>
<head>
    <title>Send Message</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="text-center mb-4">Send a Message to Faculty</h3>
        <form action="<%= request.getContextPath() %>/MessageServlet" method="post">
            <input type="hidden" name="fromUserId" value="<%= userId %>">

            <div class="form-group mb-3">
                <label for="toFacultyId">Select Faculty</label>
                <select name="toFacultyId" class="form-select" required>
                    <option value="">-- Select Faculty --</option>
                    <% for (Faculty f : facultyList) { %>
                        <option value="<%= f.getId() %>">
                            <%= f.getName() %> - <%= f.getDesignation() %>
                        </option>
                    <% } %>
                </select>
            </div>

            <div class="form-group mb-3">
                <label for="subject">Subject</label>
                <input type="text" class="form-control" id="subject" name="subject" required>
            </div>

            <div class="form-group mb-3">
                <label for="message">Message</label>
                <textarea class="form-control" id="message" name="message" rows="4" required></textarea>
            </div>

            <button type="submit" class="btn btn-primary w-100">Send Message</button>
        </form>
    </div>
</div>

<%@ include file="../common/footer.jsp" %>
</body>
</html>
