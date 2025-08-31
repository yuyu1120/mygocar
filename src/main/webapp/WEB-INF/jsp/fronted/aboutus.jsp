<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyGoCar租車-關於我們</title>
  <link rel="stylesheet" href="/css/resetcss.css">
  <link rel="stylesheet" href="/css/aboutus.css">
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
    <!-- Hero 主視覺 -->
    <section class="hero">
      <div>
        <img src="/img/bigbanner.png" alt="bigbanner">
      </div>
    </section>
    <ol class="breadcrumb breadcrumb-navigation">
      <li>
        <a href="/" class="menu1">首頁</a>
      </li>
      <li class="active menu3">
        <a href="aboutus">關於我們</a>
      </li>
    </ol>

    <div class="aboutmain">
      <H2>品牌故事</H2>
      <p>MyGoCar 是一個年輕活力、值得信賴的租車品牌，取名自「My Go」，代表 「隨時出發、自由掌控」。<br>
          我們希望每一位使用者，都能在旅程中感受到專屬於自己的自在出行體驗。<br>
          不論是城市短途代步、家庭出遊，還是商務差旅，MyGoCar 都是你的最佳選擇。
        </p>
    </div>
    <div class="aboutmain">
      <H2>品牌理念</H2>
      <p>安全至上：我們提供定期保養、全險保障的車輛，讓旅程更安心。<br>
          彈性自由：短租、長租、假日優惠，依需求彈性選擇。<br>
          年輕活力：以清新、可愛、活潑的品牌形象，打造輕鬆愉快的租車氛圍。<br>
          智慧便利：透過線上平台預約，快速取車與還車，讓流程更簡單。
        </p>
    </div>
    <div class="aboutmain">
      <H2>我們的特色</H2>
      <ul>
        <li>🚗 多樣車款選擇：從小型車、休旅車、豪華車到機車，滿足不同需求。</li>
        <li>💰 透明價格制度：公開清楚的租車價格，不額外隱藏費用。</li>
        <li>🌟 會員專屬優惠：提供折扣、長租方案與早鳥優惠。</li>
        <li>📍 便捷據點：在主要交通樞紐提供取還車服務，讓出行更方便。</li>
      </ul>
    </div>
     <div class="aboutmain">
      <H2>使命與願景</H2>
      <p>MyGoCar 不只是租車平台，更希望成為陪伴使用者旅行與生活的一部分。<br>
        我們的使命是：「讓每一次出行，都能輕鬆、安心、快樂。」<br>
        願景是打造一個 年輕、國際化的智慧租車品牌，讓 MyGoCar 成為你隨時出發的好夥伴。
        </p>
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
