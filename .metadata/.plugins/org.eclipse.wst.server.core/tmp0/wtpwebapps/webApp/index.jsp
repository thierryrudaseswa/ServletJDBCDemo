<%@ page import="com.thiery.jdbc.rca.Student" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Thiery</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
        }
        h2 {
            color: #007bff; 
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #dee2e6;
        }
        th {
            background-color: #007bff;
            color: #fff; 
        }
        tbody tr:hover {
            background-color: #e2e6ea; 
        }
    </style>
</head>
<body>
<%
    List<Student> students = (List<Student>) request.getAttribute("result");
    if (students != null) {
%>

<div class="container">
    <h2>Student List</h2>
    <table class="table table-striped">
        <thead class="thead-light">
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Age</th>
                <th>DOB</th>
                <th>School</th>
                <th>Code</th>
            </tr>
        </thead>
        <tbody>
            <% for (Student student : students) { %>
                <tr>
                    <td><%= student.getId() %></td>
                    <td><%= student.getName() %></td>
                    <td><%= student.getAge() %></td>
                    <td><%= student.getDob() %></td>
                    <td><%= student.getSchool() %></td>
                    <td><%= student.getCode() %></td>
                </tr>
            <% } %>
        </tbody>
    </table>
</div>

<%
    }
%>
</body>
</html>