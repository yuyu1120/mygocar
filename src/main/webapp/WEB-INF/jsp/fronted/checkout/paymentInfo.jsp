<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8" />
    <title>MYGOCAR-付款方式</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">
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
                                        <img src="/img/cars/${v.vehicle.vehicleImage}" class="card-img-left rounded" 
                                            style="width:120px; height:80px; object-fit:cover;" 
                                            alt="${v.vehicle.vehicleName}">
                                        <div class="card-body">
                                            <h5 class="card-title mb-1">${v.vehicle.vehicleName}</h5>
                                            <p class="card-text mb-1">品牌：${v.vehicle.vehicleBrand}</p>
                                            <p class="card-text mb-1">租期：${v.borrowDateTime} ~ ${v.returnDateTime}</p>
                                            <p class="card-text mb-1">取車|還車：${v.borrowLocation} | ${v.returnLocation}</p>
                                            <p class="card-text mb-0 fw-bold">月租：NT$ ${v.vehicle.monthPrice}</p>
                                            <p class="card-text mb-0 fw-bold">日租：NT$ ${v.vehicle.dayPrice}</p>
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
                        <button class="btn btn-success btn-lg" id="checkoutBtn">
                            <i class="fas fa-credit-card"></i> Line Pay 結帳
                        </button>
                        <a href="/search" class="btn btn-outline-primary">
                            <i class="fas fa-shopping-bag"></i> 訂閱車搜尋
                        </a>
                        <a href="/rental" class="btn btn-outline-primary">
                            <i class="fas fa-shopping-bag"></i> 日租車搜尋
                        </a>
                        <button class="btn btn-outline-danger" id="removeAllBtn">
                            <i class="fas fa-trash"></i> 清空購物車
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div id="messageArea" class="position-fixed top-0 end-0 p-3" style="z-index: 1055;"></div>

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

<c:if test="${empty isLoggedIn or not isLoggedIn}">

    <script>console.log("isLoggedIn：" + isLoggedIn);</script>

    <script src="/js/fronted_indexlogin/indexlogin.js"></script>

    <jsp:include page="../common/authModal.jsp"/>

    <script src="/js/app.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous">
    </script>

    <script>
        const checkoutBtn = document.getElementById("checkoutBtn");
        const showLoginBtn = document.getElementById("showLoginForm");
        const authSection = document.getElementById("auth-section");
        const closeAuthBtn = document.getElementById("closeAuth");

        // 點結帳按鈕
        checkoutBtn.addEventListener("click", (e) => {   
            // 已登入才真正執行結帳
            checkout();
        });

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
