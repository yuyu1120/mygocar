<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>訂閱車搜尋結果</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css" rel="stylesheet">
    <link rel="stylesheet" href="/css/resetcss.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" href="/img/favicon.ico" type="image/x-icon">
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
                            <button id="showLoginForm" class="btnlogin">登入/註冊</button>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </nav>
    </header>

    <main class="container-fluid" style="margin:10px auto;">
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
                    <form action="/search" method="get">
                        <div class="mb-3">
                            <label for="location" class="form-label">取車區域</label>
                            <select class="form-select" id="location" name="location" ></select>
                        </div>

                        <div class="mb-3">
                            <label>取車日期</label>
                            <input id="pickupDatetime" class="form-control" name="startDate" value="${startDate}" readonly>
                            <label>取車時間</label>
                            <select id="startTimeSelect" name="startTime" class="form-select"></select>
                        </div>

                        <div class="mb-3">
                            <label>訂閱租期</label>
                            <select id="period" name="period" class="form-select"></select>
                        </div>

                        <input id="rentalRange" class="form-control" style="display:none">
                        <div id="duration" class="mt-3 text-primary fw-bold"></div>

                        <div class="mb-3">
                            <label for="budget" class="form-label">預算上限</label>
                            <input type="number" class="form-control" id="budget" name="budget" value="${budget}">
                        </div>

                        <div class="mb-3">
                            <label for="sort" class="form-label">排序依據</label>
                            <select class="form-select" id="sort" name="sort">
                                <option value="">-- 請選擇 --</option>
                                <option value="price_asc" <c:if test="${sort eq 'price_asc'}">selected</c:if>>價格：低 → 高</option>
                                <option value="price_desc" <c:if test="${sort eq 'price_desc'}">selected</c:if>>價格：高 → 低</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">搜尋</button>
                    </form>
                </div>
            </aside>

            <!-- 車輛列表 -->
            <section class="col-12 col-md-9">
                <h3 class="mb-4">訂閱車列表</h3>
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
<script src="/js/fronted_search_monthly_rental/date-validation.js"></script>
<script src="/js/fronted_search_monthly_rental/MonthlyConfig.js"></script>

<c:if test="${empty isLoggedIn or not isLoggedIn}">

  <jsp:include page="../../common/authModal.jsp" />

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
    // 漢堡選單
    const menuToggle = document.getElementById('menu-toggle');
    const navLinks = document.querySelector('.nav-links');
    menuToggle.addEventListener('click', () => navLinks.classList.toggle('active'));

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
