<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
        crossorigin="anonymous">
    <title>MyGoCar租車-日租車搜尋</title>
    <link rel="stylesheet" href="/css/resetcss.css">
    <link rel="stylesheet" href="/css/index.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <link rel="icon" href="img/favicon.ico" type="image/x-icon">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
        crossorigin="anonymous">
    </script>
    <style>
        .vihicle-container {
            background-color: #f0f2f5;
            width: 1000px;
            height: 800ox;
            margin: 100px auto;
        }

        /* -------- 上方分類選單 -------- */
        .top-menu {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            background: #f5f5f5;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            gap: 10px;
        }

        .top-menu button {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .top-menu button:hover,
        .top-menu button.active {
            background-color: #2b80ff;
            color: white;
            border-color: #2b80ff;
        }

        .filter-bar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding-left: 50px;
            font-size: 14px;
            color: #666;
        }

        /* 汽車 */

        .card-list {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            justify-items: center;

            width: 1000px;
            height: 1450px;


        }


        .car-card {

            background: white;
            border-radius: 12px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            height: 450px;
            margin-top: 20px;



        }

        .car-header-container {
            position: relative;
        }


        .car-header {


            background: linear-gradient(to right, #4fa3f4, #2b80ff);
            color: white;
            text-align: center;
            padding: 5px;
            font-weight: bold;
            font-size: 14px;

        }



        .car-card img {

            width: 300px;
            height: 250px;
            object-fit: cover;

        }

        .car-body {
            padding: 15px;
        }

        .car-meta {
            color: #777;
            font-size: 13px;
        }

        .car-name {
            font-weight: bold;
            font-size: 18px;
            margin-top: 5px;
        }

        .car-id {
            font-size: 12px;
            color: #999;
        }

        .tag {
            position: absolute;
            display: flex;
            justify-content: center;
            align-items: center;
            top: 240px;
            left: 10px;
            background: #ffa726;
            color: white;
            width: 70px;
            height: 30px;
            font-size: 15px;

            border-radius: 4px;
            margin: 8px 0;
            z-index: 999;
        }

        .price-info {
            display: flex;

            text-align: center;
            background: #f1f3f5;
            border-radius: 8px;

            height: 80px;
            width: 300px;
        }

        .price-row {
            display: flex;
            flex-direction: column;
            width: 110px;
            justify-content: center;
            align-items: center;


        }

        .price-row del {
            color: #999;
            font-size: 12px;
        }



        .arrow-btn {
            display: block;
            font-size: 20px;
            color: #2b80ff;
            margin: auto auto;
            border: 2px solid blue;
            width: 50px;
            height: 50px;
            padding-top: 7px;
            border-radius: 50%;
        }
    </style>

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

    <main>
        <section class="vihicle-section">
            <div class="vihicle-container">
                <!-- 🔵 上方分類選單 -->
                <div class="vehicel-search">
                    <div class="top-menu">
                        <button class="active">熱門優惠</button>
                        <button>熱銷車款</button>
                        <button>超激優惠</button>
                        <button>N7限時優惠</button>
                        <button>電車供應</button>
                        <button>限時推薦</button>
                        <span class="filter-bar">
                            年份 ｜ 月租費 ↓
                        </span>
                    </div>

                    <!-- 🔵 篩選條件（右上角） -->

                </div>
                <!-- 🔵 車輛列表 -->
                <div class="card-list">
                    <c:forEach var="plan" items="${rentalPlans}">
                        <!-- 🟡 一台車 -->
                        <div class="car-card">

                            <div class="car-header-container">
                                <div class="car-header">🏆 全球熱銷 實力派車款 🏆

                                </div>
                                <img src="${plan.image_url}" alt="TOYOTA ALTIS">
                                <div class="car-body">
                                    <div class="tag">${plan.promotion}
                                    </div>

                                    <span
                                        class="car-meta">${plan.year}</span><span>年｜</span></span>${plan.region}</span>
                                    <div class="car-name">${plan.model}</div>
                                </div>

                            </div>

                            <div class="price-info">

                                <div class="price-row">
                                    <div>優惠日費</div>
                                    <div style="color: #d32f2f;"><span>NT$</span><span>${plan.daily_Price}</span>
                                    </div>
                                </div>
                                <div class="price-row">
                                    <div>里程費</div>
                                    <div>NT$</span><span>${plan.km_Fee}</div>
                                </div>
                                <div class="arrow-btn">
                                    <a href="/rental/detail?rentalPlanId=${plan.id}"
                                        style="text-decoration: none;">→</a>
                                </div>
                            </div>
                        </div>
                    </c:forEach>


                </div>

                <!-- 分頁按鈕 -->
                <nav>
                    <ul class="pagination justify-content-center">
                        <c:if test="${currentPage > 1}">
                            <li class="page-item">
                                <a class="page-link" href="?page=${currentPage - 1}">上一頁</a>
                            </li>
                        </c:if>

                        <c:forEach var="i" begin="1" end="${totalPages}">
                            <li class="page-item ${i == currentPage ? 'active' : ''}">
                                <a class="page-link" href="?page=${i}">${i}</a>
                            </li>
                        </c:forEach>

                        <c:if test="${currentPage < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="?page=${currentPage + 1}">下一頁</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
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


</body>

</html>