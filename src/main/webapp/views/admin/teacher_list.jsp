<%@page import="com.IERP_FINAL.models.Teacher"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Teachers</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
</head>
<style>
    .body {
        background-color: #CDD5DB;
    }

    table thead tr th,
    table tbody tr td {
        text-align: center;
        vertical-align: middle;
    }

    .name {
        color: #292648;
    }

    .subName {
        color: #8E8C8C;
    }

    .mainBtnBg {
        background-color: #292648;
    }

    .heading-font {
        color: #292648;
        font-weight: bold;
        font-size: 24px;
    }

    .p-prc {
        height: 170px;
        width: 170px;
    }

    .announce-card {
        background-color: #EBF4FF;
    }

    .break {
        margin-top: -1px;
    }

    table thead tr th {
        background-color: red;
        color: white;
    }

    table tbody tr:nth-child(even),
    .tableBg {
        background-color: skyblue;
    }

    table tbody tr:nth-child(odd) {
        background-color: darkblue;
        color: white;
    }
</style>

<body class="body">
<%@ include file='staticAdminComponent.jsp' %>

<div class="container main p-3 d-flex flex-column justify-content-center align-items-start">
    <br><br>

    <div class="container main mt-4 p-3 shadow-sm mb-3 rounded bg-white d-flex flex-column justify-content-center align-items-start">
        <div class="w-100 mb-2 d-flex flex-row justify-content-between">
            <h1 class="heading-font text-right fs-2">Teachers</h1>
            <a href="register_teacher.jsp" class="pt-2 btn px-lg-5 px-3 text-white" type="button" style="background-color: #292648;">
                Add
            </a>
        </div>
        <hr class="border border-dark border-1 mb-4 w-100 break">
        <div class="w-100 table-responsive">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th class="text-center" style="color: white; background-color: #292648">Action</th>
                        <th class="text-center" style="color: white; background-color: #292648">ID</th>
                        <th class="text-center" style="color: white; background-color: #292648">Role</th>
                        <th class="text-center" style="color: white; background-color: #292648">Photo</th>
                        <th class="text-center" style="color: white; background-color: #292648">Full Name</th>
                        <th class="text-center" style="color: white; background-color: #292648">Gender</th>
                        <th class="text-center" style="color: white; background-color: #292648">DOB</th>
                        <th class="text-center" style="color: white; background-color: #292648">Email</th>
                        <th class="text-center" style="color: white; background-color: #292648">Contact</th>
                        <th class="text-center" style="color: white; background-color: #292648">Address</th>
                        <th class="text-center" style="color: white; background-color: #292648">Joining Date</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Object obj = request.getAttribute("teacherList");
                        List<Teacher> teacherList = null;

                        if (obj instanceof List<?>) {
                            teacherList = (List<Teacher>) obj;
                        }

                        if (teacherList != null) {
                            for (Teacher teacher : teacherList) {
                    %>
                    <tr class="text-center" onclick="window.location.href='TeacherServlet?teacherId=<%= teacher.getTeacherId() %>&action=getById'">
                   
                        <td class="text-center align-middle" style="background-color:#EBF4FF;">
                        
                        	<form action="TeacherServlet"  method="get" enctype="multipart/form-data" style="display:inline;">
                            	<input type="hidden" name="action" value="getById">
                                <input type="hidden" name="teacherId" value="<%= teacher.getTeacherId() %>" />
                                <button type="submit" class="btn btn-warning">
                                    <i class="bi bi-pencil"></i>
                                </button>
                            </form>
                            <br>
                            <form action="TeacherServlet" method="POST" style="display:inline;">
                            	<input type="hidden" name="action" value="delete">
                                <input type="hidden" name="teacherId" value="<%= teacher.getTeacherId() %>" />
                                <button type="submit" class="btn btn-danger">
                                    <i class="bi bi-trash"></i>
                                </button>
                            </form>
                        </td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= teacher.getTeacherId() %></td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= teacher.getRole() %></td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;">
                            <% if (teacher.getPhoto() != null) { %>
                                <img class="rounded-circle image-fluid shadow-sm"
                                     src="data:image/jpeg;base64,<%= new String(java.util.Base64.getEncoder().encode(teacher.getPhoto())) %>"
                                     width="50" height="50" alt="Avatar" />
                            <% } else { %>
                                No Image
                            <% } %>
                        </td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= teacher.getFullName() %></td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= teacher.getGender() %></td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= teacher.getDateOfBirth() %></td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= teacher.getEmailAddress() %></td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= teacher.getContactNumber() %></td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= teacher.getTemporaryAddress() %></td>
                        <td class="text-center align-middle" style="background-color:#EBF4FF;"><%= teacher.getCreatedAt() %></td>
                    </tr>
                    <% } } %>
                </tbody>
            </table>
        </div>
    </div>
</div>

<script>
    function viewTeacherProfile(teacherId) {
        window.location.href = 'GetTeacherData?teacher_id=' + teacherId;
    }
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
