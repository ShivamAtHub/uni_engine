<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Login | University Search Engine</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background: linear-gradient(135deg, #dfe9f3 0%, #ffffff 100%);
        }
    </style>
</head>
<body class="min-h-screen flex items-center justify-center px-4">

    <!-- Glass Card -->
    <div class="backdrop-blur-md bg-white/60 border border-gray-200 shadow-xl rounded-2xl p-8 w-full max-w-md transition-all duration-300 hover:shadow-2xl">
        <h2 class="text-3xl font-bold text-center text-gray-800 mb-6 tracking-tight">Admin Login</h2>

        <form action="<%= request.getContextPath() %>/adminLogin" method="post" class="space-y-6">
            <div>
                <label for="username" class="block text-gray-700 text-sm font-medium mb-1">Username</label>
                <input type="text" name="username" id="username" required
                       class="w-full px-4 py-2 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:outline-none bg-white/80 placeholder-gray-500 transition">
            </div>

            <div>
                <label for="password" class="block text-gray-700 text-sm font-medium mb-1">Password</label>
                <input type="password" name="password" id="password" required
                       class="w-full px-4 py-2 rounded-xl border border-gray-300 focus:ring-2 focus:ring-blue-500 focus:outline-none bg-white/80 placeholder-gray-500 transition">
            </div>

            <button type="submit"
                    class="w-full py-2 px-4 bg-blue-600 hover:bg-blue-700 text-white font-semibold rounded-xl transition duration-300">
                Login
            </button>
        </form>

        <p class="mt-5 text-center text-sm text-gray-600">
            🚫 Not for student use. <strong class="text-red-600">Admin only.</strong>
        </p>
    </div>

</body>
</html>
