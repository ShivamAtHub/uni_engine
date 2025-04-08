<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <title>Send Message</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>
<div class="container mt-5">
    <div class="card shadow p-4">
        <h3 class="text-center mb-4">Send a Message to Admin</h3>
        <form action="../../MessageServlet" method="post">
            <div class="form-group mb-3">
                <label for="name">Your Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>

            <div class="form-group mb-3">
                <label for="email">Your Email</label>
                <input type="email" class="form-control" id="email" name="email" required>
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
