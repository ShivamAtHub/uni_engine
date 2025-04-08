<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<%
    String userName = (String) session.getAttribute("userName");
    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<html>
<head>
    <title>Welcome, <%= userName %>!</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        .card-hover:hover {
            transform: scale(1.05);
            transition: 0.3s ease-in-out;
        }
    </style>
</head>
<body>

<div class="container mt-5">
    <h2 class="text-center mb-4">Welcome, <%= userName %> 👋</h2>

    <div class="row g-4">
        <!-- Search Universities Card -->
        <div class="col-md-4" data-aos="fade-up">
            <div class="card shadow card-hover text-center">
                <div class="card-body">
                    <h5 class="card-title">🔍 Search Universities</h5>
                    <p class="card-text">Find top universities based on name, state or course.</p>
                    <a href="search.jsp" class="btn btn-primary">Start Searching</a>
                </div>
            </div>
        </div>

        <!-- View Faculties Card -->
        <div class="col-md-4" data-aos="fade-up" data-aos-delay="150">
            <div class="card shadow card-hover text-center">
                <div class="card-body">
                    <h5 class="card-title">👨‍🏫 View Faculties</h5>
                    <p class="card-text">Browse faculty profiles of various universities.</p>
                    <a href="viewFaculty.jsp" class="btn btn-primary">View Faculty</a>
                </div>
            </div>
        </div>

        <!-- Message Faculty Card -->
        <div class="col-md-4" data-aos="fade-up" data-aos-delay="300">
            <div class="card shadow card-hover text-center">
                <div class="card-body">
                    <h5 class="card-title">📩 Send a Message</h5>
                    <p class="card-text">Have a query? Reach out to faculty members.</p>
                    <a href="messageForm.jsp" class="btn btn-primary">Message Us</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script>
    AOS.init();
</script>
</body>
</html>
