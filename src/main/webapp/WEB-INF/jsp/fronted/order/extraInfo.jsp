<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    boolean isLoggedIn = session.getAttribute("username") != null;
    String username = isLoggedIn ? (String) session.getAttribute("username") : "";
%>

<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8">
    <title>訂閱車 額外選項</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/quantity.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/nav-order-step.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/css/resetcss.css">
    <link rel="stylesheet" href="/css/index.css">
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
        <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/search/rental_search.jsp">租車</a></li>
        <li class="nav-item">
            <a class="nav-link" href="<%= isLoggedIn ? "account.jsp" : "../login.jsp" %>">
                <%= isLoggedIn ? username : "登入" %>
            </a>
        </li>
        <% if (isLoggedIn) { %>
        <li class="nav-item"><a class="nav-link" href="../login.jsp?action=logout">登出</a></li>
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


    <main class="container py-5">

        <div class="row g-4">

            <!-- 左側車輛資訊 -->
            <section class="col-md-8">
                <div class="card mb-4">
                    <div class="row g-0">
                        <!-- 車子圖片 -->
                        <div class="col-md-4 d-flex align-items-center justify-content-center">
                            <img src="${vehicle.vehicleImage}" 
                                class="img-fluid" 
                                alt="${vehicle.vehicleName}" 
                                style="max-height: 200px; object-fit: contain;">
                        </div>
                        <!-- 車輛細節表格 -->
                        <div class="col-md-8">
                            <div class="card-body">
                                <h3 class="card-title mb-3">${vehicle.vehicleName}</h3>
                                <table class="table table-borderless table-sm mb-0">
                                    <tbody>
                                        <tr>
                                            <th scope="row">品牌</th>
                                            <td>${vehicle.vehicleBrand}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">型號</th>
                                            <td>${vehicle.vehicleModel}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">年份</th>
                                            <td>${vehicle.vehicleYear}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">顏色</th>
                                            <td>${vehicle.vehicleColor}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">車牌號碼</th>
                                            <td>${vehicle.vehicleLicensePlate}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">燃料類型</th>
                                            <td>${vehicle.vehicleFuelType}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">里程數</th>
                                            <td>${vehicle.vehicleMileage}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">位置</th>
                                            <td>${vehicle.vehicleLocation}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">描述</th>
                                            <td>${vehicle.vehicleDescription}</td>
                                        </tr>
                                        <tr>
                                            <th scope="row">月租</th>
                                            <td>NT$ ${vehicle.monthPrice} / 月</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 配件選購 -->
                <div class="card mb-4 p-3">
                    <h5 class="mb-3">用車配件選購</h5>
                    <div class="row g-3">
                        <c:set var="accessories" value="${['GPS','行車紀錄器','安全座椅']}" />
                        <c:forEach var="acc" items="${accessories}">
                            <div class="col-md-4">
                                <div class="card p-3 text-center">
                                    <p class="mb-2">${acc}</p>
                                    <div class="d-flex justify-content-center align-items-center gap-2">
                                        <button class="btn btn-outline-secondary decrease" disabled>-</button>
                                        <span class="count">0</span>
                                        <button class="btn btn-outline-primary increase">+</button>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- 下一步按鈕 -->
                <form method="post" action="/order/cart" class="mb-4">
                    <input type="hidden" name="action" value="addToCart" />
                    <input type="hidden" name="vehicleId" value="${param.vehicleId}" />
                    <input type="hidden" name="rentalQuantity" value="${rentalQuantity}" />
                    <input type="hidden" name="borrowLocation" value="${location}" />
                    <input type="hidden" name="returnLocation" value="${location}" />
                    <input type="hidden" name="startDate" value="${startDate}" />
                    <input type="hidden" name="endDate" value="${endDate}" />
                    <input type="hidden" name="startTime" value="${startTime}" />
                    <input type="hidden" name="endTime" value="${startTime}" />
                    <button class="btn btn-primary w-100" type="submit">下一步，付款</button>
                </form>
            </section>

            <!-- 右側訂單明細 -->
            <aside class="col-md-4">
                <div class="card shadow-sm p-3">
                    <div class="card-header bg-primary text-white fw-bold">訂單明細</div>
                    <div class="card-body">
                        <table class="table table-borderless table-sm mb-2">
                            <tbody>
                                <tr>
                                    <th scope="row">車輛名稱</th>
                                    <td>${vehicle.vehicleName}</td>
                                </tr>
                                <tr>
                                    <th scope="row">單價</th>
                                    <td>NT$ ${vehicle.monthPrice}</td>
                                </tr>
                                <tr>
                                    <th scope="row">租期</th>
                                    <td>${rentalQuantity} ${periodUnit}</td>
                                </tr>
                                <tr>
                                    <th scope="row">取車地點</th>
                                    <td>${location}</td>
                                </tr>
                                <tr>
                                    <th scope="row">取車時間</th>
                                    <td>${startDate} ${startTime}</td>
                                </tr>
                                <tr>
                                    <th scope="row">還車時間</th>
                                    <td>${endDate} ${endTime}</td>
                                </tr>
                                <tr>
                                    <th scope="row">總金額</th>
                                    <td>
                                        <strong class="text-danger">NT$ ${vehicle.monthPrice * rentalQuantity}</strong>
                                        <small class="text-muted">(${vehicle.monthPrice} × ${rentalQuantity})</small>
                                    </td>
                                </tr>
                            </tbody>
                        </table>

                        <hr class="my-2">

                        <!-- 配件提示 -->
                        <p class="mb-1"><strong>配件選購：</strong>可於下一步頁面選擇 GPS、行車紀錄器或安全座椅，費用將另計。</p>
                        <p class="mb-1 text-muted">※ 本訂單金額僅含車輛租金，保險、加油及其他服務費用未含在內。</p>
                        <p class="mb-0 text-muted">※ 請確認取還車日期與時間，以免影響租期計算。</p>
                </div>
                </div>
        
        
            </aside >

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

    <!-- 錯誤 Modal（在最下面頁面中即可） 待移到到js資料夾 -->
    <div id="errorModalMissingData" class="modal fade" tabindex="-1" role="dialog">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">錯誤</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>資料缺失，請先搜尋或填寫完整資訊！</p>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="window.location.href='/search'">關閉，並回到上一頁</button>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        // 只有在有錯誤訊息時才顯示 modal
        <% 
        System.out.println("asd");
        if (request.getAttribute("errorMessage_missingData") != null ) { %>

            document.addEventListener('DOMContentLoaded', function() {
                const modal = new bootstrap.Modal(document.getElementById('errorModalMissingData'));
                modal.show();
            });
            System.out.println("asd");
        <% } %>
    </script>


<!-- 共用錯誤 Modal (支援多 key) -->
<%-- <c:import url="/fronted/order/errorModal.jspf">
    <c:param name="modalId" value="errorModalMissingData" />
    <c:param name="errorKey" value="errorMessage_missingData" />
</c:import> --%>

<%-- <jsp:include page="/fronted/order/errorModal.jspf">
  <jsp:param name="modalId" value="errorModalMissingData" />
  <jsp:param name="errorKey" value="errorMessage_missingData" />
</jsp:include> --%>

<script src="${pageContext.request.contextPath}/js/button.js"></script>
</body>
</html>
