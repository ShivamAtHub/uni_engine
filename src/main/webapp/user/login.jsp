<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page session="true" %>
<%@ include file="../common/header.jsp" %>
<%@ include file="../common/navbar.jsp" %>

<html>
<head>
    <title>Login - University Search Engine</title>
    <link rel="stylesheet" href="../css/style.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center mb-4">User Login</h2>
    <div class="row justify-content-center">
        <div class="col-md-5 shadow p-4 rounded bg-light">
            <% String error = request.getParameter("error");
               if ("1".equals(error)) { %>
               <div class="alert alert-danger text-center">Invalid Email or Password!</div>
            <% } else if ("registered".equals(request.getParameter("msg"))) { %>
               <div class="alert alert-success text-center">Registered successfully! Please login.</div>
            <% } %>
            <form action="<%= request.getContextPath() %>/LoginServlet" method="post">
                <div class="mb-3">
                    <label for="email" class="form-label">Email</label>
                    <input type="email" name="email" required class="form-control" />
                </div>
                <div class="mb-3">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" name="password" required class="form-control" />
                </div>
                <button type="submit" class="btn btn-primary w-100">Login</button>
                <div class="text-center mt-3">
                    <a href="register.jsp">Don't have an account? Register</a>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
