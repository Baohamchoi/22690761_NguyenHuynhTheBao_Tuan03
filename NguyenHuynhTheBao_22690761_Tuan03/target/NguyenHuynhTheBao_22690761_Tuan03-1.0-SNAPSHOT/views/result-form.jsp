<%@ page import="iuh.fit.se.nguyenhuynhthebao_22690761_tuan03.model.Student" %><%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 9/5/2025
  Time: 8:12 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result submit</title>
</head>
<body>
<%
    Student student = (Student) request.getAttribute("student");
    if (student != null) {
%>
<h2>Student Info</h2>
<p>Full Name: <%= student.getFirstName() %> <%= student.getLastName() %></p>
<p>Gender: <%= student.isGender() ? "Male" : "Female" %></p>
<p>Email: <%= student.getEmail() %></p>
<p>Mobile: <%= student.getPhone() %></p>
<p>Birthdate: <%= student.getDob() %></p>
<p>Hobbies:
    <%
        for (String hobby : student.getHobbies()) {
            out.println(hobby + " ");
        }
    %>
</p>
<p>Course: <%= student.getCourse() %></p>
<%
    } else {
        out.println("No student data found.");
    }
%>
</body>
</html>
