<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyGoCar租車-據點查詢</title>
  <link rel="stylesheet" href="/css/resetcss.css">
  <link rel="stylesheet" href="/css/location.css">
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
        <a href="location">據點查詢</a>
      </li>
    </ol>

<div class="main-flex">
  <div class="sidebar">

  <!-- 關鍵字搜尋 -->
  <div class="search-box">
    <div class="box-header">用關鍵字搜尋據點</div>
    <div class="box-body">
      <input type="text" placeholder="輸入地點" class="search-input">
      <button class="search-btn">搜尋據點</button>
    </div>
  </div>

  <!-- 條件查詢 -->
  <div class="filter-box">
    <div class="box-header">用條件查詢據點</div>
    <div class="box-body">

      <!-- 台北市 -->
      <details>
        <summary>台北市</summary>
        <ul class="district-list">
          <li><label><input type="checkbox"> 全選</label></li>
          <li><label><input type="checkbox"> 中正區</label></li>
          <li><label><input type="checkbox"> 大同區</label></li>
          <li><label><input type="checkbox"> 中山區</label></li>
          <li><label><input type="checkbox"> 松山區</label></li>
          <li><label><input type="checkbox"> 大安區</label></li>
          <li><label><input type="checkbox"> 萬華區</label></li>
          <li><label><input type="checkbox"> 信義區</label></li>
          <li><label><input type="checkbox"> 士林區</label></li>
          <li><label><input type="checkbox"> 北投區</label></li>
          <li><label><input type="checkbox"> 內湖區</label></li>
          <li><label><input type="checkbox"> 南港區</label></li>
          <li><label><input type="checkbox"> 文山區</label></li>
        </ul>
      </details>

      <!-- 新北市 -->
      <details>
        <summary>新北市</summary>
        <ul class="district-list">
          <li><label><input type="checkbox"> 全選</label></li>
          <li><label><input type="checkbox"> 板橋區</label></li>
          <li><label><input type="checkbox"> 三重區</label></li>
          <li><label><input type="checkbox"> 中和區</label></li>
          <li><label><input type="checkbox"> 永和區</label></li>
          <li><label><input type="checkbox"> 新莊區</label></li>
          <li><label><input type="checkbox"> 新店區</label></li>
          <li><label><input type="checkbox"> 土城區</label></li>
          <li><label><input type="checkbox"> 樹林區</label></li>
          <li><label><input type="checkbox"> 鶯歌區</label></li>
          <li><label><input type="checkbox"> 三峽區</label></li>
          <li><label><input type="checkbox"> 淡水區</label></li>
          <li><label><input type="checkbox"> 汐止區</label></li>
          <li><label><input type="checkbox"> 瑞芳區</label></li>
          <!-- 其餘略 -->
        </ul>
      </details>

      <!-- 桃園市 -->
      <details>
        <summary>桃園市</summary>
        <ul class="district-list">
          <li><label><input type="checkbox"> 全選</label></li>
          <li><label><input type="checkbox"> 桃園區</label></li>
          <li><label><input type="checkbox"> 中壢區</label></li>
          <li><label><input type="checkbox"> 平鎮區</label></li>
          <li><label><input type="checkbox"> 八德區</label></li>
          <li><label><input type="checkbox"> 龍潭區</label></li>
          <li><label><input type="checkbox"> 大溪區</label></li>
          <li><label><input type="checkbox"> 楊梅區</label></li>
          <li><label><input type="checkbox"> 新屋區</label></li>
          <li><label><input type="checkbox"> 觀音區</label></li>
          <li><label><input type="checkbox"> 龜山區</label></li>
          <li><label><input type="checkbox"> 復興區</label></li>
          <li><label><input type="checkbox"> 大園區</label></li>
          <li><label><input type="checkbox"> 蘆竹區</label></li>
          <!-- 其餘略 -->
        </ul>
      </details>

      <!-- 基隆市 -->
      <details>
        <summary>基隆市</summary>
        <ul class="district-list">
          <li><label><input type="checkbox"> 全選</label></li>
          <li><label><input type="checkbox"> 仁愛區</label></li>
          <li><label><input type="checkbox"> 信義區</label></li>
          <li><label><input type="checkbox"> 中正區</label></li>
          <li><label><input type="checkbox"> 中山區</label></li>
          <li><label><input type="checkbox"> 安樂區</label></li>
          <li><label><input type="checkbox"> 暖暖區</label></li>
          <li><label><input type="checkbox"> 七堵區</label></li>
          <!-- 其餘略 -->
        </ul>
      </details>
      <!-- 台中市 -->
      <details>
        <summary>台中市</summary>
        <ul class="district-list">
          <li><label><input type="checkbox"> 全選</label></li>
          <li><label><input type="checkbox"> 中區</label></li>
          <li><label><input type="checkbox"> 東區</label></li>
          <li><label><input type="checkbox"> 南區</label></li>
          <li><label><input type="checkbox"> 西區</label></li>
          <li><label><input type="checkbox"> 北區</label></li>
          <li><label><input type="checkbox"> 北屯區</label></li>
          <li><label><input type="checkbox"> 七堵區</label></li>
          <li><label><input type="checkbox"> 西屯區</label></li>
          <li><label><input type="checkbox"> 南屯區</label></li>
          <li><label><input type="checkbox"> 太平區</label></li>
          <li><label><input type="checkbox"> 大里區</label></li>
          <li><label><input type="checkbox"> 霧峰區</label></li>
          <li><label><input type="checkbox"> 烏日區</label></li>
          <li><label><input type="checkbox"> 豐原區</label></li>
          <li><label><input type="checkbox"> 后里區</label></li>
          <li><label><input type="checkbox"> 石岡區</label></li>
          <li><label><input type="checkbox"> 東勢區</label></li>
          <li><label><input type="checkbox"> 和平區</label></li>
          <li><label><input type="checkbox"> 新社區</label></li>
          <li><label><input type="checkbox"> 潭子區</label></li>
          <li><label><input type="checkbox"> 大雅區</label></li>
          <li><label><input type="checkbox"> 神岡區</label></li>
          <li><label><input type="checkbox"> 大肚區</label></li>
          <li><label><input type="checkbox"> 沙鹿區</label></li>
          <li><label><input type="checkbox"> 龍井區</label></li>
          <li><label><input type="checkbox"> 梧棲區</label></li>
          <li><label><input type="checkbox"> 清水區</label></li>
          <li><label><input type="checkbox"> 大甲區</label></li>
          <li><label><input type="checkbox"> 外埔區</label></li>
          <li><label><input type="checkbox"> 大安區</label></li>
          <!-- 其餘略 -->
        </ul>
      </details>
      <!-- 台南市 -->
      <details>
        <summary>台南市</summary>
        <ul class="district-list">
          <li><label><input type="checkbox"> 全選</label></li>
          <li><label><input type="checkbox"> 中西區</label></li>
          <li><label><input type="checkbox"> 東區</label></li>
          <li><label><input type="checkbox"> 南區</label></li>
          <li><label><input type="checkbox"> 北區</label></li>
          <li><label><input type="checkbox"> 安平區</label></li>
          <li><label><input type="checkbox"> 安南區</label></li>
          <li><label><input type="checkbox"> 永康區</label></li>
          <li><label><input type="checkbox"> 歸仁區</label></li>
          <li><label><input type="checkbox"> 新化區</label></li>
          <li><label><input type="checkbox"> 左鎮區</label></li>
          <li><label><input type="checkbox"> 玉井區</label></li>
          <li><label><input type="checkbox"> 楠西區</label></li>
          <li><label><input type="checkbox"> 南化區</label></li>
          <li><label><input type="checkbox"> 仁德區</label></li>
          <li><label><input type="checkbox"> 關廟區</label></li>
          <li><label><input type="checkbox"> 龍崎區</label></li>
          <li><label><input type="checkbox"> 官田區</label></li>
          <li><label><input type="checkbox"> 麻豆區</label></li>
          <li><label><input type="checkbox"> 佳里區</label></li>
          <li><label><input type="checkbox"> 西港區</label></li>
          <li><label><input type="checkbox"> 將軍區</label></li>
          <li><label><input type="checkbox"> 學甲區</label></li>
          <li><label><input type="checkbox"> 北門區</label></li>
          <li><label><input type="checkbox"> 新營區</label></li>
          <li><label><input type="checkbox"> 後壁區</label></li>
          <li><label><input type="checkbox"> 白河區</label></li>
          <li><label><input type="checkbox"> 東山區</label></li>
          <li><label><input type="checkbox"> 六甲區</label></li>
          <li><label><input type="checkbox"> 下營區</label></li>
          <li><label><input type="checkbox"> 鹽水區</label></li>
          <li><label><input type="checkbox"> 善化區</label></li>
          <li><label><input type="checkbox"> 大內區</label></li>
          <li><label><input type="checkbox"> 山上區</label></li>
          <li><label><input type="checkbox"> 新市區</label></li>
          <li><label><input type="checkbox"> 安定區</label></li>
          <!-- 其餘略 -->
        </ul>
      </details>
      <!-- 高雄市 -->
      <details>
        <summary>高雄市</summary>
        <ul class="district-list">
          <li><label><input type="checkbox"> 全選</label></li>
          <li><label><input type="checkbox"> 新興區</label></li>
          <li><label><input type="checkbox"> 前金區</label></li>
          <li><label><input type="checkbox"> 苓雅區</label></li>
          <li><label><input type="checkbox"> 鹽埕區</label></li>
          <li><label><input type="checkbox"> 鼓山區</label></li>
          <li><label><input type="checkbox"> 旗津區</label></li>
          <li><label><input type="checkbox"> 前鎮區</label></li>
          <li><label><input type="checkbox"> 三民區</label></li>
          <li><label><input type="checkbox"> 楠梓區</label></li>
          <li><label><input type="checkbox"> 小港區</label></li>
          <li><label><input type="checkbox"> 左營區</label></li>
          <li><label><input type="checkbox"> 仁武區</label></li>
          <li><label><input type="checkbox"> 大社區</label></li>
          <li><label><input type="checkbox"> 岡山區</label></li>
          <li><label><input type="checkbox"> 路竹區</label></li>
          <li><label><input type="checkbox"> 阿蓮區</label></li>
          <li><label><input type="checkbox"> 田寮區</label></li>
          <li><label><input type="checkbox"> 燕巢區</label></li>
          <li><label><input type="checkbox"> 橋頭區</label></li>
          <li><label><input type="checkbox"> 梓官區</label></li>
          <li><label><input type="checkbox"> 彌陀區</label></li>
          <li><label><input type="checkbox"> 永安區</label></li>
          <li><label><input type="checkbox"> 湖內區</label></li>
          <li><label><input type="checkbox"> 鳳山區</label></li>
          <li><label><input type="checkbox"> 大寮區</label></li>
          <li><label><input type="checkbox"> 林園區</label></li>
          <li><label><input type="checkbox"> 鳥松區</label></li>
          <li><label><input type="checkbox"> 大樹區</label></li>
          <li><label><input type="checkbox"> 旗山區</label></li>
          <li><label><input type="checkbox"> 美濃區</label></li>
          <li><label><input type="checkbox"> 六龜區</label></li>
          <li><label><input type="checkbox"> 內門區</label></li>
          <li><label><input type="checkbox"> 杉林區</label></li>
          <li><label><input type="checkbox"> 甲仙區</label></li>
          <li><label><input type="checkbox"> 桃源區</label></li>
          <li><label><input type="checkbox"> 那瑪夏區</label></li>
          <li><label><input type="checkbox"> 茂林區</label></li>
          <li><label><input type="checkbox"> 茄萣區</label></li>
          <!-- 其餘略 -->
        </ul>
      </details>
    </div>
  </div>

</div>



    <p class="map">
      <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2336.9514637063558!2d121.    53814659073691!3d25.0269962608951!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.    1!3m3!1m2!1s0x3442abd25de45915%3A0x47162bee639ac61c!2z5Lit5ZyL5paH5YyW5aSn5a24QVBB6Jed5paH5Lit5b-D5aSn5   aSP6aSo!5e0!3m2!1szh-TW!2stw!4v1756126417866!5m2!1szh-TW!2stw" width="600" height="450"   style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade">
      </iframe>
      沒有錢錢接付費版qwq <br>
    </p>
</div>


<button id="backToTopBtn">⇧</button>

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
    <script>
      const backToTopBtn = document.getElementById("backToTopBtn");

      window.addEventListener("scroll", () => {
        if (window.scrollY > 200) { // 捲動超過 200px 才出現
          backToTopBtn.style.display = "block";
        } else {
          backToTopBtn.style.display = "none";
        }
      });

      backToTopBtn.addEventListener("click", () => {
        window.scrollTo({
          top: 0,
          behavior: "smooth" // 平滑滾動
        });
      });
    </script>
</body>
</html>
