<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>


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
            <p><strong>會員</strong></p>
            <p>${username}</p>
        </div>

        <ul class="menu">
            <li><button class="sidebar-btn active" data-target="orders">我的訂單</button></li>
            <li><button class="sidebar-btn" data-target="profile">帳號管理</button></li>
            <li><button onclick="location.href='/logout'">登出</button></li>
        </ul>

        <div class="sidebar-footer">
            <img src="/img/car.png" alt="Car" class="car-img">
        </div>
      </aside>


      <!-- 主內容區 -->
      <main class="content">
        <div id="orders" class="content-section">
            <h2>我的訂單</h2>

            <!-- 分頁按鈕 -->
            <div class="tabs">
                <button class="tab active" data-tab="daily">日租</button>
                <button class="tab" data-tab="subscribe">訂閱</button>
            </div>

            <!-- 日租訂單 -->
            <div class="tab-content" id="daily" style="display:block;">
                <c:choose>
                    <c:when test="${not empty orders_daily}">
                        <table class="order-table">
                            <thead>
                                <tr>
                                    <th>訂單編號</th>
                                    <th>車輛ID</th>
                                    <th>會員ID</th>
                                    <th>總價</th>
                                    <th>狀態</th>
                                    <th>借車時間</th>
                                    <th>還車時間</th>
                                    <th>借車地點</th>
                                    <th>還車地點</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders_daily}">
                                    <tr>
                                        <td>${order.orderId}</td>
                                        <td>${order.vehicleId}</td>
                                        <td>${order.memberId}</td>
                                        <td>${order.totalPrice}</td>
                                        <td>${order.status}</td>
                                        <td><fmt:formatDate value="${order.borrowDatetime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                        <td><fmt:formatDate value="${order.returnDatetime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                        <td>${order.borrowLocation}</td>
                                        <td>${order.returnLocation}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>目前沒有日租訂單資料哦！</p>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- 訂閱訂單 -->
            <div class="tab-content" id="subscribe" style="display:none;">
                <c:choose>
                    <c:when test="${not empty orders_monthly}">
                        <table class="order-table">
                            <thead>
                                <tr>
                                    <th>訂單編號</th>
                                    <th>車輛ID</th>
                                    <th>會員ID</th>
                                    <th>總價</th>
                                    <th>狀態</th>
                                    <th>開始時間</th>
                                    <th>結束時間</th>
                                    <th>借車地點</th>
                                    <th>還車地點</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="order" items="${orders_monthly}">
                                    <tr>
                                        <td>${order.orderId}</td>
                                        <td>${order.vehicleId}</td>
                                        <td>${order.memberId}</td>
                                        <td>${order.totalPrice}</td>
                                        <td>${order.status}</td>
                                        <td><fmt:formatDate value="${order.borrowDatetime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                        <td><fmt:formatDate value="${order.returnDatetime}" pattern="yyyy-MM-dd HH:mm"/></td>
                                        <td>${order.borrowLocation}</td>
                                        <td>${order.returnLocation}</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </c:when>
                    <c:otherwise>
                        <p>目前沒有訂閱訂單資料哦！</p>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>


        <div id="profile" class="content-section" style="display:none;">
          <h2>帳號管理</h2>

          <div class="profile-card">
            <img src="/img/members/${member.photo_url}" class="card-img-top" alt="會員圖片">

            <div class="info-section">
              <h3>👤 個人資訊</h3>
              <div class="info-row"><span>姓名：</span><span>${member.name}</span></div>
              <div class="info-row"><span>性別：</span><span>${member.gender}</span></div>
              <div class="info-row"><span>生日：</span><span>${member.birthday}</span></div>
              <div class="info-row"><span>地址：</span><span>${member.address}</span></div>
            </div>

            <div class="info-section">
              <h3>📞 聯絡方式</h3>
              <div class="info-row"><span>Email：</span><span>${member.email}</span></div>
              <div class="info-row"><span>電話：</span><span>${member.phone}</span></div>
            </div>

            <div class="info-section">
              <h3>⚙️ 系統資訊</h3>
              <div class="info-row"><span>帳號：</span><span>${member.account}</span></div>
              <div class="info-row"><span>角色：</span><span>${member.role}</span></div>
              <div class="info-row"><span>註冊時間：</span><span>${member.create_Time}</span></div>
            </div>
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

    <script>
        document.addEventListener("DOMContentLoaded", function() {
            // 漢堡選單
            const menuToggle = document.getElementById('menu-toggle');
            const navLinks = document.querySelector('.nav-links');
            if(menuToggle && navLinks){
                menuToggle.addEventListener('click', () => {
                    navLinks.classList.toggle('active');
                });
            }


            

            // 側邊欄按鈕切換內容
            const sidebarBtns = document.querySelectorAll('.sidebar-btn');
            const sections = document.querySelectorAll('.content-section');

            if(sidebarBtns.length > 0 && sections.length > 0){
                sidebarBtns.forEach(btn => {
                    btn.addEventListener('click', () => {
                        // 切換 active 樣式
                        sidebarBtns.forEach(b => b.classList.remove('active'));
                        btn.classList.add('active');

                        // 顯示對應內容
                        const targetId = btn.getAttribute('data-target');
                        sections.forEach(sec => {
                            if(sec.id === targetId){
                                sec.style.display = 'block';
                            } else {
                                sec.style.display = 'none';
                            }
                        });
                    });
                });
            }
        });


        document.addEventListener("DOMContentLoaded", function() {

    // ----------------------
    // 側邊欄按鈕切換內容
    // ----------------------
    const sidebarBtns = document.querySelectorAll('.sidebar-btn');
    const sections = document.querySelectorAll('.content-section');

    sidebarBtns.forEach(btn => {
        btn.addEventListener('click', () => {
            // 切換 active 樣式
            sidebarBtns.forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            // 顯示對應內容
            const targetId = btn.dataset.target;
            sections.forEach(sec => {
                sec.style.display = (sec.id === targetId) ? 'block' : 'none';
            });

            // 點回訂單時，預設日租 tab
            if(targetId === 'orders'){
                activateTab('daily');
            }
        });
    });

    // ----------------------
    // 訂單 Tab 切換 (日租 / 訂閱)
    // ----------------------
    const tabs = document.querySelectorAll(".tab");
    const contents = document.querySelectorAll(".tab-content");

    tabs.forEach(tab => {
        tab.addEventListener("click", () => {
            activateTab(tab.dataset.tab);
        });
    });

    // ----------------------
    // Tab 切換函數
    // ----------------------
    function activateTab(tabId){
        // 切換按鈕 active
        tabs.forEach(t => t.classList.toggle('active', t.dataset.tab === tabId));
        // 切換內容顯示
        contents.forEach(c => c.style.display = (c.id === tabId) ? 'block' : 'none');
    }

    // ----------------------
    // 預設顯示會員專區訂單 -> 日租
    // ----------------------
    activateTab('daily');

});


        
    </script>

   
</body>
</html>
