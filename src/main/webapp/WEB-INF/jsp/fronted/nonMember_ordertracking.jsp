<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>訂閱車搜尋結果</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/index.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/resetcss.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
</head>
<body>

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

<main class="container-fluid" style="margin:10px auto;">
    <section class="row">
        <!-- 查詢表單 -->
        <aside class="col-12 col-md-4 bg-light p-3 mb-3">
            <h5 class="mb-3">訂單查詢 (非會員)</h5>
            <form action="/ordertracking" method="get">
                <div class="mb-3">
                    <label for="orderId" class="form-label">訂單編號</label>
                    <input type="text" class="form-control" id="orderId" name="orderId" required>
                </div>
                <button type="submit" class="btn btn-primary w-100">查詢訂單</button>
            </form>
        </aside>

        <!-- 查詢結果 -->
        <section class="col-12 col-md-8">
            <h5 class="mb-3">查詢結果</h5>

            <c:choose>
                <c:when test="${empty order or empty order.orderId}">
                    <p class="text-muted">尚未查詢或查無此訂單。</p>
                </c:when>
                <c:otherwise>
                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">訂單編號：${order.orderId}</h5>
                            <p class="card-text">建立時間：${order.createAt}</p>
                            <p class="card-text">車輛名稱：${order.vehicleId}</p>
                            <p class="card-text">取車還車地點：${order.borrowLocation}</p>
                            <p class="card-text">租期：${order.borrowDatetime}  ~  ${order.returnDatetime}</p>
                            <p class="card-text text-danger">金額：NT$ ${order.totalPrice}</p>
                            <p class="card-text">狀態：${order.status}</p>
                        </div>
                    </div>
                </c:otherwise>
            </c:choose>
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
    menuToggle.addEventListener('click', () => navLinks.classList.toggle('active'));
</script>

<script src="/js/fronted_search_monthly_rental/date-validation.js"></script>
<script src="/js/fronted_search_monthly_rental/MonthlyConfig.js"></script>

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
