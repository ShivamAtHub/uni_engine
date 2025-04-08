<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<html>
<head>
    <title>Search Universities</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">🔍 Search for a University</h2>

    <form action="../../SearchServlet" method="post" class="row g-3 shadow p-4 rounded bg-light">
        <div class="col-md-4">
            <label class="form-label">University Name</label>
            <input type="text" name="name" class="form-control" placeholder="e.g. Pune University">
        </div>
        <div class="col-md-4">
            <label class="form-label">State</label>
            <input type="text" name="state" class="form-control" placeholder="e.g. Maharashtra">
        </div>
        <div class="col-md-4">
            <label class="form-label">Course</label>
            <input type="text" name="course" class="form-control" placeholder="e.g. B.Tech">
        </div>
        <div class="col-12 text-center mt-3">
            <button type="submit" class="btn btn-primary px-4">Search</button>
        </div>
    </form>
</div>
</body>
</html>
