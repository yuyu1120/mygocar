<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="zh-Hant">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyGoCar租車</title>
  <link rel="stylesheet" href="/css/indexlogin.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
  
  <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
  <link rel="stylesheet" href="/css/resetcss.css">
  <link rel="stylesheet" href="/css/index.css">
  <link rel="icon" href="img/favicon.ico" type="image/x-icon">
</head>

<body>
  <!-- Header -->
  <header class="header">
    <nav class="navbar">
      <!-- Logo -->
      <a href="/" class="logo"><img src="/img/logo1.png" alt="MyGoCar Logo"></a>

      <!-- 左邊導覽 -->
      <ul class="nav-links">
        <li><a href="/">首頁</a></li>
        <li><a href="aboutus">關於我們</a></li>
        <li><a href="location">據點查詢</a></li>
        <li><a href="carrentinfo">租車說明</a></li>
        <li><a href="ordertracking">未登入查詢訂單</a></li>
      
          <c:choose>
              <c:when test="${isLoggedIn}">
                  <li>
                      <a href="/member" class="btnmember">
                          <c:out value="${username}"/> 會員專區
                      </a>
                  </li>
                  <li>
                      <a href="/logout" class="btnapply">登出</a>
                  </li>
              </c:when>

              <c:otherwise>
                  <li>
                      <button id="showLoginForm" class="btnlogin" onclick="showLoginForm()">登入/註冊</button>
                  </li>
              </c:otherwise>
          </c:choose>
      </ul>
    </nav>
  </header>


  <!-- Main -->
  <main>
    <!-- Hero 主視覺 -->
    <section class="hero">
      <div class="hero-text">
        <h1>
          MyGo! 優惠租車<br>
          <span class="highlight">預約・搜尋 GO!GO!</span>
        </h1>
        <img src="/img/bannerpic1.png" class="event" alt="活動圖">
      </div>

      <div class="hero-image">
        <img src="/img/bannerbk.jpg" class="bg" alt="背景插圖">
        <img src="/img/bannerpic.png" class="car" alt="主視覺車子">
      </div>
    </section>

    <!-- 搜尋框 -->
    <section class="search-box">
      <form id="searchForm" action="/rental" method="get">

        <!-- Tabs -->
        <div class="search-tabs">
          <button type="button" class="tab active" data-tab="daily">🚗 日租</button>
          <button type="button" class="tab" data-tab="subscribe">📅 訂閱</button>
        </div>

        <!-- 共用：地點 -->
        <div class="search-field">
          <i class="fas fa-map-marker-alt"></i>
          <label for="location" class="form-label">取還車區域</label>
          <select class="form-select" id="location" name="location"></select>
        </div>

        <!-- 日租模式 -->
        <div class="search-field date-field daily-field">
          <i class="fas fa-calendar-alt"></i>
          <label for="start-date">租車日期</label>
          <input type="date" id="start-date" name="dailyStartDate" value="${param.startDate}">
        </div>

        <div class="search-field date-field daily-field">
          <i class="fas fa-calendar-alt"></i>
          <label for="end-date">還車日期</label>
          <input type="date" id="end-date" name="dailyEndDate" value="${param.endDate}">
        </div>

        <!-- 訂閱模式 -->
        <div class="search-field subscribe-field" style="display:none;">
          <div class="mb-3">
            <i class="fas fa-calendar-alt"></i>
              <label>取車日期</label>
              <input id="pickupDatetime" class="form-control" name="startDate" value="${startDate}" readonly>
              <input id="rentalRange" class="form-control" style="display:none">
              <%-- <i class="fas fa-clock"></i>
              <label>取車時間</label>
              <select id="startTimeSelect" name="startTime" class="form-select"></select> --%>
          </div>

          <%-- <div class="mb-3">
              <i class="fas fa-calendar-days"></i>
              <label>訂閱租期</label>
              <select id="period" name="period" class="form-select"></select>
          </div> --%>

          
          <%-- <div id="duration" class="mt-3 text-primary fw-bold"></div> --%>
        </div>

        <!-- 搜尋按鈕 -->
        <div class="search-actions">
          <button type="submit" class="search-btn">🔍 搜尋</button>
        </div>
      </form>
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
    <script src="/js/fronted_search_monthly_rental/date-validation.js"></script>
    <script src="/js/fronted_search_monthly_rental/MonthlyConfig.js"></script>
  
    <script src="/js/fronted_indexlogin/indexlogin.js"></script>
    <c:if test="${empty isLoggedIn or not isLoggedIn}">

    

    <jsp:include page="common/authModal.jsp"/>
  
    <script src="/js/app.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous">
    </script>

    <script>
      const showLoginBtn = document.getElementById("showLoginForm");
      const authSection = document.getElementById("auth-section");
      const closeAuthBtn = document.getElementById("closeAuth");

      showLoginBtn?.addEventListener("click", () => {
        authSection.style.display = "flex";
      });

      closeAuthBtn?.addEventListener("click", () => {
        authSection.style.display = "none";
      });

      // 點 modal 背景關閉
      authSection?.addEventListener("click", (e) => {
        if (e.target === authSection) {
          authSection.style.display = "none";
        }
      });

      // 阻止 modal 內部點擊冒泡
      const authContainer = document.getElementById("auth-container");
      authContainer?.addEventListener("click", (e) => {
        e.stopPropagation(); // 阻止事件冒泡到 auth-section
      });

    </script>
    
  </c:if>



  <script>
    // 將 Session 參數傳給 JS
    window.appConfig = {
        location: '${location}',
        startDate: '${startDate}',
        startTime: '', // 可自行改 Controller 傳回 startTime
        endDate: '${endDate}',
        endTime: '',   // 可自行改 Controller 傳回 endTime
        period: '${period}'
    };
  </script>

</body>
</html>