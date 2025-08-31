<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyGoCar租車-會員專區</title>
  <link rel="stylesheet" href="/css/resetcss.css">
  <link rel="stylesheet" href="/css/member.css">
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
      </ul>

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
    <ol class="breadcrumb breadcrumb-navigation">
      <li>
        <a href="/" class="menu1">首頁</a>
      </li>
      <li class="active menu3">
        <a href="member">會員專區</a>
      </li>
    </ol>

    <div class="member-layout">
    
    <!-- 側邊欄 -->
    <aside class="sidebar">
      <div class="profile-box">
        <p><strong>白金會員</strong></p>
        <p>小美</p>
      </div>

      <ul class="menu">
        <li class="active"><a href="#">我的訂單</a></li>
        <li><a href="#">付款方式</a></li>
        <li><a href="#">收藏清單</a></li>
        <li><a href="#">帳號管理</a></li>
        <li><a href="#">登出</a></li>
      </ul>

      <div class="sidebar-footer">
        <img src="/img/car.png" alt="Car" class="car-img">
      </div>
    </aside>

    <!-- 主內容區 -->
    <main class="content">
      <div class="card">
        <h2>我的訂單</h2>
        <div class="tabs">
          <button class="tab active">日租</button>
          <button class="tab">訂閱</button>
        </div>

        <div class="order-list empty">

          <p>目前沒有訂單資料哦！</p>
          <button class="btn-primary">前往訂車</button>
        </div>
      </div>
    </main>

  </div>
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
