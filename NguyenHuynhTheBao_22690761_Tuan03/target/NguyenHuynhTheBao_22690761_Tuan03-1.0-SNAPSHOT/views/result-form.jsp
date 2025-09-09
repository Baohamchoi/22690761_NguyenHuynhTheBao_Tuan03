<%@ page import="iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model.Student" %>
<%@ page import="iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model.Qualification" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Registration Result</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f8ff;
            margin: 0;
            padding: 0;
        }

        .container {
            margin: 50px auto;
            width: 800px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.2);
            padding: 30px;
        }

        h2, h3 {
            text-align: center;
            color: #333366;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        td, th {
            padding: 12px;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
            text-align: left;
        }

        td.label {
            font-weight: bold;
            width: 30%;
            color: #444;
            background: #f9f9f9;
        }

        .hobbies span {
            background: #e0f0ff;
            color: #004080;
            padding: 5px 10px;
            border-radius: 15px;
            margin-right: 5px;
            font-size: 14px;
            display: inline-block;
        }

        .qualification-table th {
            background: #add8e6;
            font-weight: bold;
            text-align: center;
        }

        .qualification-table td {
            text-align: center;
        }

        .footer {
            text-align: center;
            margin-top: 30px;
        }

        .btn {
            padding: 10px 18px;
            border: none;
            border-radius: 8px;
            background: #4CAF50;
            color: white;
            cursor: pointer;
            font-size: 15px;
        }

        .btn:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Student Information</h2>

    <%
        Student student = (Student) request.getAttribute("student");
        if (student != null) {
    %>
    <table>
        <tr>
            <td class="label">Full Name</td>
            <td><%= student.getFirstName() %> <%= student.getLastName() %></td>
        </tr>
        <tr>
            <td class="label">Gender</td>
            <td><%= student.isGender() ? "Male" : "Female" %></td>
        </tr>
        <tr>
            <td class="label">Email</td>
            <td><%= student.getEmail() %></td>
        </tr>
        <tr>
            <td class="label">Mobile</td>
            <td><%= student.getPhone() %></td>
        </tr>
        <tr>
            <td class="label">Birthdate</td>
            <td><%= student.getDob() %></td>
        </tr>
        <tr>
            <td class="label">Hobbies</td>
            <td class="hobbies">
                <%
                    for (String hobby : student.getHobbies()) {
                %>
                <span><%= hobby %></span>
                <% } %>
            </td>
        </tr>
        <tr>
            <td class="label">Course</td>
            <td><%= student.getCourse() %></td>
        </tr>
    </table>

    <h3>Qualification Details</h3>
    <table class="qualification-table">
        <tr>
            <th>Examination</th>
            <th>Board</th>
            <th>Percentage</th>
            <th>Year of Passing</th>
        </tr>
        <%
            if (student.getQualifications() != null) {
                for (Qualification q : student.getQualifications()) {
        %>
        <tr>
            <td><%= q.getExamination() %></td>
            <td><%= q.getBoard() %></td>
            <td><%= q.getPercentage() %></td>
            <td><%= q.getYearOfPassing() %></td>
        </tr>
        <%
                }
            }
        %>
    </table>
    <%
    } else {
    %>
    <p style="text-align:center; color:red;">No student data found.</p>
    <%
        }
    %>

    <div class="footer">
        <a href="views/formInput.jsp"><button class="btn">← Back to Form</button></a>
    </div>
</div>
</body>
</html>
