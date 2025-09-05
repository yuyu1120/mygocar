<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.*, com.example.mygocar.model.Vehicle, com.example.mygocar.dao.VehicleDAOImpl" %>
<%@ page import="java.time.LocalDate, java.time.format.DateTimeFormatter" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    boolean isLoggedIn = session.getAttribute("username") != null;
    String username = isLoggedIn ? (String) session.getAttribute("username") : "";
    List<Vehicle> filteredVehicles = (List<Vehicle>) request.getAttribute("vehicles");

    DateTimeFormatter dateFormatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
    LocalDate today = LocalDate.now();
    LocalDate defaultStartDate = today.plusDays(1);
    LocalDate defaultEndDate = today.plusDays(2);

    String location   = request.getParameter("location");
    String startDate  = request.getParameter("startDate");
    String startTime  = request.getParameter("startTime");  

    //從searchservlet 依據period跟startDate會算好回傳 request
    String endDate  = (String)request.getAttribute("endDate");
    String endTime  = request.getParameter("endTime");  
    System.out.println(endDate);

    String budgetParam= request.getParameter("budget");
    String sort       = request.getParameter("sort");
    String period     = request.getParameter("period");

    startDate = (startDate == null || startDate.isEmpty()) ? defaultStartDate.format(dateFormatter) : startDate;

    session.setAttribute("startDate", startDate);
    session.setAttribute("startTime", startTime);
    
    session.setAttribute("endDate", endDate);
    session.setAttribute("endTime", startTime);

    session.setAttribute("location", location);
    session.setAttribute("budget", budgetParam);
    session.setAttribute("sort", sort);
    session.setAttribute("period", period);
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>訂閱車搜尋結果</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/resetcss.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
</head>
<body>

<!-- Header -->
  <header class="header">
    <nav class="navbar">
      <!-- Logo -->
      <a href="/" class="logo">
        <img src="img/logo1.png" alt="MyGoCar Logo">
      </a>

      <!-- 導覽連結 -->
      <ul class="nav-links">
        <li><a href="/">首頁</a></li>
        <li><a href="aboutus">關於我們</a></li>
        <li><a href="location">據點查詢</a></li>
        <li><a href="carrentinfo">租車說明</a></li>
        <li><a href="member">會員專區</a></li>
        <li class="nav-item"><a class="nav-link" href="/search">租車</a></li>
        <li class="nav-item">
            <a class="nav-link" href="<%= isLoggedIn ? "account.jsp" : "/login" %>">
                <%= isLoggedIn ? username : "登入" %>
            </a>
        </li>
        <% if (isLoggedIn) { %>
        <li class="nav-item"><a class="nav-link" href="/logout">登出</a></li>
        <% } %>
      </ul>

      <!-- 漢堡選單 -->
      <button class="menu-toggle" id="menu-toggle" aria-label="切換選單">
        <span></span>
        <span></span>
        <span></span>
      </button>
    </nav>
  </header>

  <main class="container-fluid">
      <section class="row">
          <!-- 篩選條件 -->
          <aside class="col-12 col-md-3 bg-light p-3 mb-3">
              <h5 class="d-flex justify-content-between align-items-center">
                  篩選條件
                  <button class="btn btn-sm btn-outline-secondary d-md-none" type="button" data-bs-toggle="collapse" data-bs-target="#filterCollapse">
                      篩選選單
                  </button>
              </h5>
              <div class="collapse d-md-block" id="filterCollapse">
                  <form action="${pageContext.request.contextPath}/search" method="get">
                      <div class="mb-3">
                          <label for="location" class="form-label">取車區域</label>
                          <select class="form-select" id="location" name="location"></select>
                      </div>
                      <div class="mb-3">
                          <label>取車日期</label>
                          <input id="pickupDatetime" class="form-control" name="startDate" value="<%= startDate %>" readonly>
                          <label>取車時間</label>
                          <select id="startTimeSelect" name="startTime" class="form-select"></select>
                      </div>

                      <div class="mb-3">
                          <label>訂閱租期</label>
                          <select id="period" name="period" class="form-select"></select>
                      </div>

                      <input id="rentalRange" class="form-control"  style="display:none">

                      <div id="duration" class="mt-3 text-primary fw-bold"></div>
                      
                      <div class="mb-3">
                          <label for="budget" class="form-label">預算上限</label>
                          <input type="number" class="form-control" id="budget" name="budget" value="<%= budgetParam != null ? budgetParam : "" %>">
                      </div>
                      <div class="mb-3">
                          <label for="sort" class="form-label">排序依據</label>
                          <select class="form-select" id="sort" name="sort">
                              <option value="">-- 請選擇 --</option>
                              <option value="price_asc" <%= "price_asc".equals(sort) ? "selected" : "" %>>價格：低 → 高</option>
                              <option value="price_desc" <%= "price_desc".equals(sort) ? "selected" : "" %>>價格：高 → 低</option>
                          </select>
                      </div>
                      <button type="submit" class="btn btn-primary w-100">搜尋</button>
                  </form>
              </div>
          </aside>

          <!-- 車輛列表 -->
          <section class="col-12 col-md-9">
              <h3 class="mb-4">訂閱車列表</h3>
              <div class="row g-4">
              <!-- 如果 vehicles 為空 -->
                  <c:choose>
                    <c:when test="${empty vehicles}">
                        <p>目前沒有符合條件的車輛，以下是推薦車輛：</p>
                    </c:when>
                </c:choose>

                <div class="row g-4">
                    <c:forEach var="v" items="${vehicles}">
                        <div class="col-12 col-md-3">
                            <div class="card vehicle-card">
                                <img src="/img/cars/${v.vehicleImage}" class="card-img-top" alt="車輛圖片">
                                <div class="card-body">
                                    <h5 class="card-title">${v.vehicleName}</h5>
                                    <p class="card-text">品牌：${v.vehicleBrand}</p>
                                    <p class="card-text text-danger">月租：NT$ ${v.monthPrice.intValue()} /月</p>
                                    <form action="/search/extraInfo" method="post">
                                        <input type="hidden" name="vehicleId" value="${v.vehicleId}" />
                                        <input type="submit" value="查看詳情" class="btn btn-outline-primary btn-sm" />
                                    </form>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
              </div>
          </section>
      </section>
  </main>

  <!-- Footer -->
  <footer class="footer">
    <div class="footer-container">
      <!-- 公司資訊 -->
      <div class="footer-about">
        <h3>MyGoCar租車</h3>
        <p>
          提供全天候、安全可靠的出租車與租車服務。<br>
          以顧客滿意為第一優先，讓您隨時隨地安心出行。
        </p>
      </div>

      <!-- 快速連結 -->
      <div class="footer-links">
        <h4>快速連結</h4>
        <ul>
          <li><a href="#">首頁</a></li>
          <li><a href="#">服務項目</a></li>
          <li><a href="#">車型介紹</a></li>
          <li><a href="#">線上預約</a></li>
          <li><a href="#">常見問題</a></li>
        </ul>
      </div>

      <!-- 聯絡方式 -->
      <div class="footer-contact">
        <h4>聯絡我們</h4>
        <p>📍 台北市中正區XX路100號</p>
        <p>📞 02-1234-5678</p>
        <p>📧 info@mygocar.com</p>
      </div>

<!-- 社群媒體 -->
      <div class="footer-social">
        <h4>追蹤我們</h4>
        <div class="social-icons">
          <a href="teamwk" target="_blank"><i class="fab fa-facebook-f"></i></a>
          <a href="teamwk" target="_blank"><i class="fab fa-instagram"></i></a>
          <a href="teamwk" target="_blank"><i class="fab fa-line"></i></a>
        </div>
      </div>
    </div>

    <!-- 版權 -->
    <div class="footer-bottom">
      <p>&copy; 2025 MyGoCar租車. All rights reserved.</p>
    </div>
  </footer>

<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/zh.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

<script>

    // 漢堡選單
    const menuToggle = document.getElementById('menu-toggle');
    const navLinks = document.querySelector('.nav-links');
    menuToggle.addEventListener('click', () => {
      navLinks.classList.toggle('active');
    });

    // 搜尋 Tabs 切換
    const tabs = document.querySelectorAll(".tab");
    const dailyFields = document.querySelectorAll(".daily-field");
    const subscribeField = document.querySelector(".subscribe-field");

    tabs.forEach(tab => {
      tab.addEventListener("click", () => {
        tabs.forEach(t => t.classList.remove("active"));
        tab.classList.add("active");

        if (tab.dataset.tab === "daily") {
          dailyFields.forEach(f => f.style.display = "flex");
          subscribeField.style.display = "none";
        } else {
          dailyFields.forEach(f => f.style.display = "none");
          subscribeField.style.display = "flex";
        }
      });
    });
    // 將 session 參數傳給 JS
    window.appConfig = {
        location: '${sessionScope.location}',
        startDate: '${sessionScope.startDate}',
        startTime: '${sessionScope.startTime}',
        endDate: '${sessionScope.endDate}',
        endTime: '${sessionScope.endTime}',
        period: '${sessionScope.period}'
    };
</script>

<script src="${pageContext.request.contextPath}/js/fronted_search_monthly_rental/date-validation.js"></script>
<script src="${pageContext.request.contextPath}/js/fronted_search_monthly_rental/MonthlyConfig.js"></script>


</body>
</html>
