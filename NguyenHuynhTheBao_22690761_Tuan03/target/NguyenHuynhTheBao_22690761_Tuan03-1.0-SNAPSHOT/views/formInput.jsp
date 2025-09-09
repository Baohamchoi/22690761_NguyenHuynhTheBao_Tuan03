<%--
  Created by IntelliJ IDEA.
  User: Student
  Date: 9/5/2025
  Time: 7:10 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register information Course</title>
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Student Registration Form</title>
        <style>
            form {
                margin: 20px auto;
                padding: 20px;
                width: 700px;
                background-color: #add8e6;
                border: 1px solid #999;
                border-radius: 10px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            td {
                padding: 8px;
            }
            input[type="text"],
            input[type="email"],
            input[type="number"],
            textarea,
            select {
                width: 95%;
                padding: 5px;
            }
            .qualification-table {
                border: 2px solid blue;
                padding: 10px;
            }
            .qualification-table th,
            .qualification-table td {
                border: 1px solid #000;
                padding: 5px;
                text-align: center;
            }
            .center-btn {
                text-align: center;
                padding-top: 20px;
            }
        </style>
</head>
<body style="justify-items: center">
    <h2>Enter information in form</h2>
    <form action="registration-form" name="formDangKy" method="GET">
        <table>
            <tr>
                <td>First name</td>
                <td><input type="text" name="firstName" maxlength="30" required></td>
            </tr>
            <tr>
                <td>Last name</td>
                <td><input type="text" name="lastName" maxlength="30" required></td>
            </tr>
            <tr>
                <td>Date of birth</td>
                <td>
                    <select name="dob_day" style="width: 120px">
                        <option>Day:</option>
                        <% for (int i = 1; i <= 31; i++) { %>
                        <option><%= i %></option>
                        <% } %>
                    </select>
                    <select name="dob_month" style="width: 120px">
                        <option>Month:</option>
                        <% String[] months = {"January", "February", "March", "April", "May", "June",
                                "July", "August", "September", "October", "November", "December"};
                            for (String month : months) { %>
                        <option><%= month %></option>
                        <% } %>
                    </select>
                    <select name="dob_year" style="width: 120px">
                        <option>Year:</option>
                        <% for (int i = 1980; i <= 2010; i++) { %>
                        <option><%= i %></option>
                        <% } %>
                    </select>
                </td>
            </tr>
            <tr>
                <td>Email</td>
                <td><input type="email" name="email" required></td>
            </tr>
            <tr>
                <td>Mobile number</td>
                <td><input type="text" name="mobile" maxlength="10" required></td>
            </tr>
            <tr>
                <td>Gender</td>
                <td>
                    <input type="radio" name="gender" value="Male" required> Male
                    <input type="radio" name="gender" value="Female"> Female
                </td>
            </tr>
            <tr>
                <td>Address</td>
                <td><textarea name="address" rows="3" cols="30"></textarea></td>
            </tr>
            <tr>
                <td>City</td>
                <td><input type="text" name="city" maxlength="30"></td>
            </tr>
            <tr>
                <td>Pin code</td>
                <td><input type="text" name="pincode" maxlength="6"></td>
            </tr>
            <tr>
                <td>State</td>
                <td><input type="text" name="state" maxlength="30"></td>
            </tr>
            <tr>
                <td>Country</td>
                <td><input type="text" name="country" value="India"></td>
            </tr>
            <tr>
                <td>Hobbies</td>
                <td>
                    <input type="checkbox" name="hobbies" value="Drawing"> Drawing
                    <input type="checkbox" name="hobbies" value="Singing"> Singing
                    <input type="checkbox" name="hobbies" value="Dancing"> Dancing
                    <input type="checkbox" name="hobbies" value="Sketching"> Sketching
                    <input type="checkbox" name="hobbies" value="Others"> Others
                    <input type="text" name="hobbyOther">
                </td>
            </tr>
            <tr>
                <td>Qualification</td>
                <td>
                    <table class="qualification-table">
                        <tr>
                            <th>Sl.No.</th>
                            <th>Examination</th>
                            <th>Board</th>
                            <th>Percentage</th>
                            <th>Year of Passing</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>Class X</td>
                            <td><input type="text" name="board1" maxlength="10"></td>
                            <td><input type="text" name="percentage1" maxlength="5"></td>
                            <td><input type="text" name="year1" maxlength="4"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Class XII</td>
                            <td><input type="text" name="board2" maxlength="10"></td>
                            <td><input type="text" name="percentage2" maxlength="5"></td>
                            <td><input type="text" name="year2" maxlength="4"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Graduation</td>
                            <td><input type="text" name="board3" maxlength="10"></td>
                            <td><input type="text" name="percentage3" maxlength="5"></td>
                            <td><input type="text" name="year3" maxlength="4"></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td>Masters</td>
                            <td><input type="text" name="board4" maxlength="10"></td>
                            <td><input type="text" name="percentage4" maxlength="5"></td>
                            <td><input type="text" name="year4" maxlength="4"></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>Course applies for</td>
                <td>
                    <input type="radio" name="course" value="BCA" required> BCA
                    <input type="radio" name="course" value="B.Com"> B.Com
                    <input type="radio" name="course" value="B.Sc"> B.Sc
                    <input type="radio" name="course" value="B.A"> B.A
                </td>
            </tr>
        </table>

        <div class="center-btn">
            <input type="submit" value="Submit">
            <input type="reset" value="Reset">
        </div>
    </form>
</body>
</html>
