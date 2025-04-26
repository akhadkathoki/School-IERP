<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.IERP_FINAL.models.Holiday, java.text.SimpleDateFormat" %>
<%
    String action = request.getParameter("action");
    List<Holiday> holidayList = null;
    Holiday holiday = null;

    try {
        com.IERP_FINAL.dao.HolidayDAO dao = new com.IERP_FINAL.dao.HolidayDAO();

        if (action == null) {
            holidayList = dao.getAllHolidays();
            if (!holidayList.isEmpty()) {
                holiday = holidayList.get(0); // default selected
            }
        } else if ("singleView".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            holidayList = dao.getAllHolidays();
            holiday = dao.getHolidayById(id);
        } 
    } catch (Exception e) {
        e.printStackTrace();
    }

    request.setAttribute("holidayList", holidayList);
    request.setAttribute("holiday", holiday);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Holidays</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
</head>

<style>
    .light-bg { background-color: #EBF4FF; }
    .custom-body { background-color: #CDD5DB; }
    .name { color: #292648; }
    .subName { color: #8E8C8C; }
    .mainBtnBg { background-color: #292648; }
    .heading-font {
        color: #292648;
        font-weight: bold;
        font-size: 24px;
    }
    .announce-card { background-color: #EBF4FF; }
    .break { margin-top: -1px; }
</style>

<body class="custom-body">

<%@ include file='staticParentComponent.jsp' %>
<div class="container main p-3 d-flex flex-column justify-content-center align-items-start">
    <br><br>
<div class="container mt-4 p-3 bg-transparent d-flex flex-column justify-content-center align-items-start">
    <div class="d-flex flex-row justify-content-between w-100">
        <h1 class="heading-font fs-2">Holidays</h1>
    </div>
    <hr class="border border-dark border-2 mt-3 mb-4 w-100 break">

    <div class="row w-100">
        <!-- Left Panel: Holiday Detail -->
        <div class="col-12 col-lg-5 mb-3">
            <div class="light-bg w-100 p-4 rounded shadow text-center">
                <%
                    Holiday holiday2 = (Holiday) request.getAttribute("holiday");
                    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                    SimpleDateFormat dayFormat = new SimpleDateFormat("EEEE");
                    SimpleDateFormat monthYearFormat = new SimpleDateFormat("MMM yyyy");

                    if (holiday2 != null) {
                        Date date = holiday2.getFromDate();
                %>
                    <h4 class="name mt-3 fs-2 fw-bold"><%= monthYearFormat.format(date) %></h4>
                    <h1 class="fw-bold text-danger" style="font-size: 90px;"><%= new SimpleDateFormat("dd").format(date) %></h1>
                    <h4 class="name fs-3"><%= dayFormat.format(date) %></h4>
                    <hr class="border border-dark mt-3 mb-3">
                    <h4 class="fs-3 fw-bold text-danger"><%= holiday2.getName() %></h4>
                    <p class="text-secondary"><%= holiday2.getDescription() %></p>
                <%
                    }
                %>
            </div>
        </div>

        <!-- Right Panel: Holiday Table -->
        <div class="col-12 col-lg-7 mb-3">
            <div class="p-3 shadow-sm bg-white rounded">
                <h1 class="heading-font">All Holidays</h1>
                <hr class="border border-dark mb-4 w-100 break">

                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th class="text-center" style="color: white; background-color: #292648">Name</th>
                                <th class="text-center" style="color: white; background-color: #292648">From (Date)</th>
                                <th class="text-center" style="color: white; background-color: #292648">To Date</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                            List<Holiday> holidayList2 = (List<Holiday>) request.getAttribute("holidayList");
                            if (holidayList2 != null && !holidayList2.isEmpty()) {
                                for (Holiday h : holidayList2) {
                        %>
                            <tr class="text-center" style="cursor: pointer;" onclick="window.location.href='holidays_list.jsp?id=<%= h.getId() %>&action=singleView'">
                                <td style="background-color:#EBF4FF;"><%= h.getName() %></td>
                                <td style="background-color:#EBF4FF;">
                                    <%= dateFormat.format(h.getFromDate()) %> <br> (<%= dayFormat.format(h.getFromDate()) %>)
                                </td>
                                <td style="background-color:#EBF4FF;">
                                    <%= dateFormat.format(h.getToDate()) %> <br> (<%= dayFormat.format(h.getToDate()) %>)
                                </td>
                            </tr>
                        <%
                                }
                            }
                        %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</div>

<script src="bootstrap.bundle.min.js"></script>
<script src="dashboard.js"></script>
</body>
</html>
