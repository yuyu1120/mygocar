<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyGoCar租車-租車說明</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
  <link rel="stylesheet" href="/css/index.css">
  <link rel="stylesheet" href="/css/resetcss.css">
  <link rel="stylesheet" href="/css/carrentinfo.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
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
          <li><a href="${pageContext.request.contextPath}/aboutus">關於我們</a></li>
          <li><a href="${pageContext.request.contextPath}/location">據點查詢</a></li>
          <li><a href="${pageContext.request.contextPath}/carrentinfo">租車說明</a></li>
          <li><a href="${pageContext.request.contextPath}/ordertracking">未登入查詢訂單</a></li>
          
              <c:choose>
                  <c:when test="${isLoggedIn}">
                      <li>
                          <a href="${pageContext.request.contextPath}/member" class="btnmember">
                              <c:out value="${username}"/> 會員專區
                          </a>
                      </li>
                      <li>
                          <a href="${pageContext.request.contextPath}/logout" class="btnapply">登出</a>
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
      <div>
        <img src="/img/bigbanner.png" alt="bigbanner">
      </div>
    </section>

    <ol class="breadcrumb breadcrumb-navigation">
      <li>
        <a href="/" class="menu1">首頁</a>
      </li>
      <li class="active menu3">
        <a href="carrentinfo">租車說明</a>
      </li>
    </ol>

    <div class="info-pics">
      <div class="info-item">
        <img src="/img/order.png" alt="預約">
        <p>預約</p>
      </div>
      <div class="info-item">
        <img src="/img/check.png" alt="確認">
        <p>確認</p>
      </div>
      <div class="info-item">
        <img src="/img/car.png" alt="領車">
        <p>領車</p>
      </div>
      <div class="info-item">
        <img src="/img/info.png" alt="說明">
        <p>說明</p>
      </div>
      <div class="info-item">
        <img src="/img/money.png" alt="費用">
        <p>費用</p>
      </div>
    </div>

    <!-- 流程說明 -->
    <section class="steps">
      <div class="card">
        <h2>1. 預約</h2>
        <ul>
          <li>透過MyGoCar網站預約車輛</li>
          <li>選擇日期、時間、地點</li>
          <li>系統顯示可用車款與價格</li>
          <li>預約完成後寄送通知</li>
        </ul>
      </div>

      <div class="card">
        <h2>2. 確認</h2>
        <ul>
          <li>完成身份驗證（手機號碼＋駕照上傳）</li>
          <li>線上簽署租車契約</li>
        </ul>
      </div>

      <div class="card">
        <h2>3. 領車</h2>
        <ul>
          <li>出示駕照與訂單編號</li>
          <li>檢查車況確認車牌號碼，<br>專員確認後拍照留證</li>
          <li>使用交通卡解鎖車門</li>
          <li>車內檢查：駕照、保險卡、停車卡、加油卡</li>
        </ul>
      </div>

      <div class="card">
        <h2>4. 說明</h2>
        <ul>
          <li>加油：使用車內加油卡於合作加油站</li>
          <li>停車：停放於指定車格</li>
          <li>還車：停好車後，與專員確認後完成還車程序</li>
          <li>遇到異常請立即聯繫客服</li>
        </ul>
      </div>

      
    </section>
      <div class="fee-table">
        <h2>費用</h2>
        <p>透明公開，無隱藏收費</p>
        <p><strong>實際價格以結帳頁面為主</strong></p>
        <table>
          <tr>
            <th>車款類型</th>
            <th>平日 (NTD/日)</th>
            <th>假日 (NTD/日)</th>
            <th>押金</th>
            <th>備註</th>
          </tr>
          <tr>
            <td>小型車</td>
            <td>1,200⭡</td>
            <td>1,500⭡</td>
            <td>3,000</td>
            <td>市區代步、好停車</td>
          </tr>
          <tr>
            <td>中型車</td>
            <td>1,600⭡</td>
            <td>1,900⭡</td>
            <td>3,000</td>
            <td>家庭、長途首選</td>
          </tr>
          <tr>
            <td>SUV</td>
            <td>2,200⭡</td>
            <td>2,500⭡</td>
            <td>5,000</td>
            <td>高車身、空間大</td>
          </tr>
          <tr>
            <td>豪華車</td>
            <td>4,500⭡</td>
            <td>5,200⭡</td>
            <td>10,000</td>
            <td>商務、特殊場合</td>
          </tr>
        </table>
        <p>
          <strong>優惠方案：</strong> 首次租車9折｜連續租7天85折｜提前30天預約95折
        </p>
      </div>
  </main>
<button id="backToTopBtn">⇧</button>
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

  <c:if test="${empty isLoggedIn or not isLoggedIn}">

  <script src="/js/fronted_indexlogin/indexlogin.js"></script>

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
</body>
</html>
