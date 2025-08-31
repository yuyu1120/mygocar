<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyGoCar租車</title>
  <link rel="stylesheet" href="/css/resetcss.css">
  <link rel="stylesheet" href="/css/indexlogin.css">
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

    <!-- 左邊導覽 -->
    <ul class="nav-links">
      <li><a href="/">首頁</a></li>
      <li><a href="aboutus">關於我們</a></li>
      <li><a href="location">據點查詢</a></li>
      <li><a href="carrentinfo">租車說明</a></li>
      
    </ul>

    <!-- 右邊登入/註冊 -->
    <ul class="nav-auth">
      <li><a href="#" class="btnlogin">登入</a></li>
      <li><a href="#" class="btnapply">註冊</a></li>
    </ul>
  </nav>
</header>




      <!-- 漢堡選單 -->
      <button class="menu-toggle" id="menu-toggle" aria-label="切換選單">
        <span></span>
        <span></span>
        <span></span>
      </button>
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
      <!-- Tabs -->
      <div class="search-tabs">
        <button class="tab active" data-tab="daily">🚗 日租</button>
        <button class="tab" data-tab="subscribe">📅 訂閱</button>
      </div>

      <!-- 共用：地點 -->
      <div class="search-field">
        <i class="fas fa-map-marker-alt"></i>
        <input type="text" placeholder="輸入地點">
      </div>

      <!-- 日租模式 -->
      <div class="search-field date-field daily-field">
        <i class="fas fa-calendar-alt"></i>
        <label for="start-date">租車日期</label>
        <input type="date" id="start-date">
      </div>

      <div class="search-field date-field daily-field">
        <i class="fas fa-calendar-alt"></i>
        <label for="end-date">還車日期</label>
        <input type="date" id="end-date">
      </div>

      <!-- 訂閱模式 -->
      <div class="search-field subscribe-field" style="display: none;">
        <i class="fas fa-calendar-alt"></i>
        <select>
          <option value="1">1 個月</option>
          <option value="3">3 個月</option>
          <option value="6">6 個月</option>
          <option value="12">12 個月</option>
        </select>
      </div>

      <!-- 搜尋按鈕 -->
      <div class="search-actions">
        <button class="search-btn">🔍 搜尋</button>
      </div>
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

  <!-- Scripts -->
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
  </script>
  
</body>
</html>
