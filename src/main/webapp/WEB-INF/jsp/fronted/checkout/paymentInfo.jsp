<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // 假設這些變數已在其他地方初始化
    boolean isLoggedIn = session.getAttribute("username") != null;
    String username = isLoggedIn ? (String) session.getAttribute("username") : "";
 
    // 從 request 或 session 取得當前步驟
    int currentStep = 4; // 預設第一步
    String stepParam = request.getParameter("step");
    if (stepParam != null) {
        try {
            currentStep = Integer.parseInt(stepParam);
        } catch (NumberFormatException e) {
            currentStep = 1;
        }
    }
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8" />
    <title>付款方式</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="/css/nav-order-step.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/css/resetcss.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">
    <style>
        .v-line{
            height:6vh;
            width:.1vw;
            border-width:0;
            color:#000;
            background-color:#000;
        }
    </style>
</head>

<body class="container py-4">

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
    
    
    <!-- 狀態步驟條 -->
    <div class="container my-4">
        <div class="progress-container">
            <div class="step <%= currentStep > 1 ? "completed" : (currentStep == 1 ? "active" : "") %>">
                <div class="step-label">加選配件</div>
                <div class="circle"></div>
            </div>
            <div class="line"></div>
            <div class="step <%= currentStep > 2 ? "completed" : (currentStep == 2 ? "active" : "") %>">
                <div class="step-label">駕駛資訊</div>
                <div class="circle"></div>
            </div>
            <div class="line"></div>
            <div class="step <%= currentStep > 3 ? "completed" : (currentStep == 3 ? "active" : "") %>">
                <div class="step-label">金額明細</div>
                <div class="circle"></div>
            </div>
            <div class="line"></div>
            <div class="step <%= currentStep == 4 ? "active" : "" %>">
                <div class="step-label">付款方式</div>
                <div class="circle"></div>
            </div>
        </div>
    </div>
    <!-- ---- 內容區域 ---- -->
    <div class="container my-4">
        <div class="row g-4">
            <!-- 左側購物車列表 -->
            <h2>金額明細</h2>
            <div class="col-lg-8 col-12" id="cartContainer">
                
                <c:choose>
                    <c:when test="${empty cart}">
                        <p>目前購物車是空的。</p>
                    </c:when>
                    <c:otherwise>
                        <div class="row g-3">
                            <c:forEach var="v" items="${cart}">
                                <div class="col-12">
                                    <div class="card flex-row align-items-center p-2 shadow-sm">
                                        <img src="${v.vehicle.vehicleImage}" class="card-img-left rounded" 
                                            style="width:120px; height:80px; object-fit:cover;" 
                                            alt="${v.vehicle.vehicleName}">
                                        <div class="card-body">
                                            <h5 class="card-title mb-1">${v.vehicle.vehicleName}</h5>
                                            <p class="card-text mb-1">品牌：${v.vehicle.vehicleBrand}</p>
                                            <p class="card-text mb-1">租期：${v.borrowDateTime} ~ ${v.returnDateTime}</p>
                                            <p class="card-text mb-1">取車|還車：${v.borrowLocation} | ${v.returnLocation}</p>
                                            <p class="card-text mb-0 fw-bold">月租：NT$ ${v.vehicle.monthPrice}</p>
                                        </div>
                                        <div class="card-actions ms-auto pe-2">
                                            <form method="post" action="/cart/remove">
                                                <input type="hidden" name="vehicleId" value="${v.vehicle.vehicleId}">
                                                <button type="submit" class="btn btn-sm btn-outline-danger">
                                                    <i class="fas fa-trash"></i> 刪除
                                                </button>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 右側訂單總計與按鈕 -->
            <div class="col-lg-4 col-12">
                <div class="card p-3 shadow-sm">
                    <h4>訂單總計</h4>
                    <hr>
                    <p class="fs-5 fw-bold total" id="totalAmount">總金額：NT$ ${total}</p>
                    <div class="d-grid gap-2">
                        <button class="btn btn-success btn-lg" onclick="checkout()" id="checkoutBtn">
                            <i class="fas fa-credit-card"></i> Line Pay 結帳
                        </button>
                        <a href="/search" class="btn btn-outline-primary">
                            <i class="fas fa-shopping-bag"></i> 繼續購物
                        </a>
                        <button class="btn btn-outline-danger" id="removeAllBtn">
                            <i class="fas fa-trash"></i> 清空購物車
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>


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

    <script>
        window.initialCart = ${cartJson};
    </script>
    <script src="/js/fronted_checkout_paymentInfo/button.js"></script>

</body>
</html>
