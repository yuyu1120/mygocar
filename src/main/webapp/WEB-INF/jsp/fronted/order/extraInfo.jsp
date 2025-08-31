<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, java.time.LocalDateTime, java.time.format.DateTimeFormatter, java.time.temporal.ChronoUnit" %>
<%@ page import="com.example.model.Vehicle, com.example.model.CartItem" %>
<%@ page import="com.example.strategy.*" %>
<%@ page import="com.example.dao.VehicleDAOImpl" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // 假設 session 已經存了使用者資訊
    boolean isLoggedIn = session.getAttribute("username") != null;
    request.setAttribute("isLoggedIn", isLoggedIn);
    request.setAttribute("username", isLoggedIn ? session.getAttribute("username") : "");

    // 從 session 取得租車資訊
    String vid = request.getParameter("vid");
    if (vid == null || vid.isEmpty()) {
        out.println("<script>alert('車輛資訊缺失，請先搜尋！'); location.href='" + request.getContextPath() + "/search/rental_search.jsp';</script>");
        return;
    }

    String startDate = (String) session.getAttribute("startDate");
    String startTime = (String) session.getAttribute("startTime");
    String endDate = (String) session.getAttribute("endDate");
    String location  = (String) session.getAttribute("location");
    String period =    (String) session.getAttribute("period");
    String rentalType = "monthly";

    String periodUnit = "月";  //"monthly".equals(rentalType) ? "月" : "天";

    System.out.println(period);

    if (startDate == null || startTime == null || location == null) {
        out.println("<script>alert('請先搜尋取車日期與地點，再查看詳情！'); location.href='" + request.getContextPath() + "/search/rental_search.jsp';</script>");
        return;
    }

    com.example.dao.VehicleDAOImpl vehicleDAO = new com.example.dao.VehicleDAOImpl();
    Vehicle vehicle = vehicleDAO.getVehicleById(vid);
    request.setAttribute("vehicle", vehicle);

    long rentalQuantity = 0L;
    if (period != null && !period.isEmpty()) {
        rentalQuantity = Long.parseLong(period);  
    }
    request.setAttribute("rentalQuantity", rentalQuantity);
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
<meta charset="UTF-8">
<title>訂閱車 額外選項</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/quantity.css" rel="stylesheet"/>
<link href="${pageContext.request.contextPath}/css/nav-order-step.css" rel="stylesheet"/>
</head>
<body class="container py-4">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">MYCAR</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/search/rental_search.jsp">租車</a></li>
                <li class="nav-item">
                    <a class="nav-link" href="${isLoggedIn ? 'account.jsp' : '../login.jsp'}">${username}</a>
                </li>
                <c:if test="${isLoggedIn}">
                    <li class="nav-item"><a class="nav-link" href="../login.jsp?action=logout">登出</a></li>
                </c:if>
            </ul>
        </div>
    </div>
</nav>

<div class="container" style="padding-top: 80px;">
    <div class="row">
        <div class="col-md-8">
            <h3>${vehicle.vehicleName} 詳情</h3>
            <p>品牌：${vehicle.vehicleBrand}</p>
            <p>取車區域：${location}</p>
            <p>取車時間：${startDate} ${startTime}</p>
            <p>還車時間：${endDate} ${endTime}</p>
            <p>月租：NT$ ${vehicle.monthPrice} / 月</p>

            <!-- 配件選購 -->
            <div class="mb-4">
                <h3>用車配件選購</h3>
                <div class="row g-3">
                    <c:set var="accessories" value="${['GPS','行車紀錄器','安全座椅']}" />
                    <c:forEach var="acc" items="${accessories}">
                        <div class="col-md-4">
                            <div class="card p-3">
                                <p>${acc}</p>
                                <div class="d-flex justify-content-center align-items-center gap-2">
                                    <button class="btn btn-outline-secondary decrease" disabled>-</button>
                                    <span class="count">0</span>
                                    <button class="btn btn-outline-primary increase">+</button>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <!-- 下一步按鈕 -->
           <form method="post" action="${pageContext.request.contextPath}/cart">
                    <input type="hidden" name="action" value="addToCart" />
                    <input type="hidden" name="vehicleId" value="<%= vid %>" />
                    <input type="hidden" name="rentalType" value="<%= rentalType %>" />
                    <input type="hidden" name="rentalQuantity" value="<%= rentalQuantity %>" />
                    <input type="hidden" name="borrowLocation" value="<%= location %>" />
                    <input type="hidden" name="returnLocation" value="<%= location %>" />
                    <input type="hidden" name="startDate" value="<%= startDate %>" />
                    <input type="hidden" name="endDate" value="<%= endDate %>" />
                    <input type="hidden" name="startTime" value="<%= startTime %>" />
                    <input type="hidden" name="endTime" value="<%= startTime %>" />
                    <button class="btn btn-primary" type="submit">下一步，付款</button>
            </form>
        </div>

        <div class="col-md-4">
            <div class="card p-3">
                <div class="card-header">訂單明細</div>
                <div class="card-body">
                    租期：${rentalQuantity}
                    ${periodUnit}
                    <br>總金額：NT$ ${vehicle.monthPrice * rentalQuantity}
                </div>
            </div>
        </div>
    </div>
</div>

<script src="${pageContext.request.contextPath}/js/button.js"></script>
</body>
</html>
