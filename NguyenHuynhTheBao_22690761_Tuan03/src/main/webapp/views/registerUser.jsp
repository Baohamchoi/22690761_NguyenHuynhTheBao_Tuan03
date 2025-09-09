<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration Form</title>
    <style>
        body { font-family: Arial; background: #f0f8ff; }
        .container {
            margin: 50px auto; width: 400px; background: #fff; padding: 20px;
            border-radius: 10px; box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        }
        h2 { text-align: center; }
        input, select { width: 100%; padding: 10px; margin: 8px 0; }
        .row { display: flex; gap: 10px; }
        .row input { flex: 1; }
        .btn {
            width: 100%; padding: 10px; background: #4CAF50; color: white;
            border: none; border-radius: 6px; cursor: pointer;
        }
        .btn:hover { background: #45a049; }
    </style>
</head>
<body>
<div class="container">
    <h2>User Registration Form</h2>
    <form method="post" action="registration-user">
        <div class="row">
            <input type="text" name="first-name" placeholder="First Name" required>
            <input type="text" name="last-name" placeholder="Last Name" required>
        </div>
        <input type="email" name="your-email" placeholder="Your Email" required>
        <input type="email" name="reEmail" placeholder="Re-enter Email" required>
        <input type="password" name="password" placeholder="New Password" required>

        <label>Birthday</label>
        <div class="row">
            <select name="monthOfBirth">
                <% for(int i=1;i<=12;i++){ %>
                <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
            <select name="dayOfBirth">
                <% for(int i=1;i<=31;i++){ %>
                <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
            <select name="yearOfBirth">
                <% for(int i=1980;i<=2025;i++){ %>
                <option value="<%= i %>"><%= i %></option>
                <% } %>
            </select>
        </div>

        <label><input type="radio" name="gender" value="Female" checked> Female</label>
        <label><input type="radio" name="gender" value="Male"> Male</label>

        <button type="submit" class="btn">Sign Up</button>
    </form>
</div>
</body>
</html>
