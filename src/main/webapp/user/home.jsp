<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>University Search Engine - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="../css/style.css" rel="stylesheet">
</head>
<body style="background-color: #E9F1FA;">
    <div class="container mt-5">
        <div class="text-center mb-4">
            <h1 class="display-5 fw-bold text-primary">Welcome to University Search Engine</h1>
            <p class="lead text-dark">Search and explore universities, faculties, and courses with ease.</p>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Search Universities</h5>
                        <p class="card-text">Find universities by name, location, or specialization.</p>
                        <a href="search.jsp" class="btn btn-primary">Search Now</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">View Faculties</h5>
                        <p class="card-text">Explore faculty members and their profiles from different universities.</p>
                        <a href="viewFaculty.jsp" class="btn btn-primary">View Faculty</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card h-100 shadow-sm">
                    <div class="card-body text-center">
                        <h5 class="card-title">Contact Faculty</h5>
                        <p class="card-text">Send messages or proposals to professors for collaborations.</p>
                        <a href="messageForm.jsp" class="btn btn-primary">Send Message</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>
