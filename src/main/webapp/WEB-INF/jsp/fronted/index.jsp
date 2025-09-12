<%@ page contentType="text/html; charset=UTF-8" language="java" %>
  <%@ taglib prefix="c" uri="jakarta.tags.core" %>
    <%@ page session="true" %>

      <!DOCTYPE html>
      <html lang="zh-Hant">

      <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>MyGoCar租車</title>
        <link rel="stylesheet" href="/css/resetcss.css">
        <link rel="stylesheet" href="/css/index.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
        <link rel="icon" href="img/favicon.ico" type="image/x-icon">
        <script src="${pageContext.request.contextPath}/js/index.js"></script>
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
            <div class="hero-text">
              <h1>
                MyGoCar! 優惠租車<br>
                <span class="highlight">預約・搜尋 GO!GO!</span>
              </h1>
              <img src="/img/bannerpic1.png" class="event" alt="活動圖">
            </div>

            <div class="hero-image">
              <img src="/img/bannerbk.jpg" class="bg" alt="背景插圖">
              <img src="/img/bannerpic.png" class="car" alt="主視覺車子">
            </div>
          </section>

          <!-- 搜尋框 -->
          <section class="search-box">
            <form id="searchForm" action="/daily-rental" method="get">

              <!-- Tabs -->
              <div class="search-tabs">
                <button type="button" class="tab active" data-tab="daily">🚗 日租</button>
                <button type="button" class="tab" data-tab="subscribe">📅 訂閱</button>
              </div>

              <!-- 共用：地點 -->
              <div class="search-field">
                <i class="fas fa-map-marker-alt"></i>
                <input type="text" name="location" placeholder="輸入地點" value="${param.location}">
              </div>

              <!-- 日租模式 -->
              <div class="search-field date-field daily-field">
                <i class="fas fa-calendar-alt"></i>
                <label for="start-date">租車日期</label>
                <input type="date" id="start-date" name="startDate" value="${param.startDate}">
              </div>

              <div class="search-field date-field daily-field">
                <i class="fas fa-calendar-alt"></i>
                <label for="end-date">還車日期</label>
                <input type="date" id="end-date" name="endDate" value="${param.endDate}">
              </div>

              <!-- 訂閱模式 -->
              <div class="search-field subscribe-field" style="display:none;">
                <i class="fas fa-calendar-alt"></i>
                <select name="months">
                  <option value="1" ${param.months=='1' ? 'selected' : '' }>1 個月</option>
                  <option value="2" ${param.months=='2' ? 'selected' : '' }>2 個月</option>
                  <option value="3" ${param.months=='3' ? 'selected' : '' }>3 個月</option>
                  <option value="4" ${param.months=='4' ? 'selected' : '' }>4 個月</option>
                  <option value="5" ${param.months=='5' ? 'selected' : '' }>5 個月</option>
                  <option value="6" ${param.months=='6' ? 'selected' : '' }>6 個月</option>
                  <option value="12" ${param.months=='12' ? 'selected' : '' }>12 個月</option>
                </select>
              </div>

              <!-- 搜尋按鈕 -->
              <div class="search-actions">
                <button type="submit" class="search-btn">🔍 搜尋</button>
              </div>
            </form>
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




        <section id="auth-section" class=" modal-background" style="display: flex;">
          <div id="auth-container">
            <div class="auth-sidebar">
              <div class="auth-card">
                <div id="login" class="backgroudshow">
                  <button id="loginbtn" type="button" class=" border-0 fw-bold "
                    style=" font-size: 25px; background-color: transparent;"
                    onclick="switchTab('login-content')">LOGIN</button>
                </div>
                <div id="sign">
                  <button id="signbtn" type="button" class=" border-0 fw-bold colorwhite"
                    style=" font-size: 25px;background-color: transparent; " onclick="switchTab('sign-content')">SIGN
                    UP</button>
                </div>
              </div>
            </div>
            <div class="auth-content">
              <div id="login-content" class="auth-sections hide  ">
                <div class="text-center mb-5 mt-4">
                  <!-- <img src="your-logo.png" alt="logo" width="100"> -->
                  <h5>MYGOCAR</h5>
                </div>
                <form id="loginForm">
                  <!-- 帳號輸入 -->
                  <div class="mx-auto mt-2 mb-3 w-75">
                    <div class="input-group">
                      <label for="account">
                        <img src="image/icons8-male-user-60.png" alt="logo" width="50px">
                      </label>
                      <input type="text" id="account"
                        class="form-control border-0 border-bottom border-dark border-2 rounded-0 " name="account"
                        placeholder="帳號">
                    </div>
                  </div>

                  <!-- 密碼輸入 -->
                  <div class="mx-auto mb-5 w-75">
                    <div class="input-group">
                      <label for="password">
                        <img src="image/icons8-password-50.png" alt="logo" width="50px">
                      </label>
                      <input id="password" type="password"
                        class="form-control border-0 border-bottom border-dark border-2 rounded-0 " name="password"
                        placeholder="密碼">
                      <button type="button" onclick="togglePassword1()"
                        class="border-0 border-bottom border-dark border-2" style="background:none">
                        <img id="passwordimg" src="image/icons8-closed-eye-24.png" alt="logo" width="25px"
                          height="25px">
                      </button>
                    </div>
                    <div class="ps-5 mt-2" style="color:blue;" onclick="switchTab('current-content')">
                      忘記密碼
                    </div>
                  </div>

                  <!-- 登入按鈕 -->
                  <div class="d-grid mb-4 w-50 mx-auto">
                    <button type="submit" class="btn btn-success">登入</button>
                  </div>
                </form>
                <!-- OR -->
                <div class="text-center mb-3 text-muted">OR</div>

                <!-- 第三方登入 -->
                <div class="d-flex justify-content-center gap-3">
                  <img src="image/icons8-fb-48.png" alt="fb" width="40px" height="40px">
                  <img src="image/icons8-google-48.png" alt="google" width="40px" height="40px">
                </div>
              </div>

              <div id="current-content" class="auth-sections hide">
                <div class="text-center mb-5 mt-5">
                  <!-- <img src="your-logo.png" alt="logo" width="100"> -->
                  <h5>MYGOCAR</h5>
                </div>

                <div class="step-dots mb-4">
                  <div class="step">
                    <div class="dot  active "></div>
                    <div class="step-font">輸入帳號</div>
                  </div>
                  <div class="step">
                    <div class="dot "></div>
                    <div class="dotLine left "></div>
                    <div class="sys-font">信箱確認</div>
                  </div>
                  <div class="step">
                    <div class="dot "></div>
                    <div class="dotLine left "></div>
                    <div class="sys-font">密碼修改</div>
                  </div>
                </div>
                <!-- 帳號確認 -->
                <form id="currentAccount">
                  <div class="mx-auto  mt-5 mb-3 w-75" style="padding-left:10px;">
                    <div class="input-group">
                      <label for="account">
                        <img src="image/icons8-male-user-60.png" alt="logo" width="50px">
                      </label>
                      <input type="text" id="current-account" class=" rounded border p-1" style="width: 300px;"
                        name="account" placeholder="請輸入帳號">
                    </div>
                  </div>

                  <div class="mx-auto mb-3 w-75" style="padding-left:10px;">
                    <div class="input-group">
                      <label for="email">
                        <img src="image/icons8-email-48.png" alt="logo" width="50px">
                      </label>
                      <input type="text" id="current-email" class=" rounded border p-1" style="width: 300px;"
                        name="email" placeholder="請輸入信箱">
                    </div>
                  </div>
                  <div style="display: flex;" class="mt-4">
                    <!-- 註冊按鈕 -->
                    <div class=" mt-3  ">
                      <button type="submit" class="btn btn-success " style="width:  100px; margin-left: 115px;"
                        onclick="switchTab('login-content')">取消</button>
                    </div>


                    <div class=" mt-3 ">
                      <button id="currentAccountEmail" type="submit" class="btn btn-success"
                        style="width:  100px; margin-left: 60px;">確認</button>
                    </div>
                  </div>
                </form>

              </div>
              <div id="email-content" class="auth-sections hide ">
                <div class="text-center mb-5 mt-5 ">
                  <!-- <img src="your-logo.png" alt="logo" width="100"> -->
                  <h5>MYGOCAR</h5>
                </div>

                <div class="step-dots mb-4">
                  <div class="step">
                    <div class="dot active "></div>
                    <div class="sys-font">輸入帳號</div>
                  </div>
                  <div class="step">
                    <div class="dot active "></div>
                    <div class="dotLine left active "></div>
                    <div class="step-font">信箱確認</div>
                  </div>
                  <div class="step">
                    <div class="dot "></div>
                    <div class="dotLine left "></div>
                    <div class="sys-font">密碼修改</div>
                  </div>
                </div>
                <!-- 新密碼輸入 -->
                <form id="currentEmailCode">
                  <div class=" mt-2 mb-3 " style="position: relative;  margin-left: 50px;">
                    <div class="mb-3">請輸入6位數驗證碼
                    </div>
                    <div style="display: flex;  ">
                      <input type="type" maxlength="1" class="emailBtn me-2">
                      <input type="type" maxlength="1" class="emailBtn me-2">
                      <input type="type" maxlength="1" class="emailBtn me-2">
                      <input type="type" maxlength="1" class="emailBtn me-2">
                      <input type="type" maxlength="1" class="emailBtn me-2">
                      <input type="type" maxlength="1" class="emailBtn">

                    </div>

                    <div class="mt-3" style="text-align: right;  margin-right: 50px;">沒有收到驗證性?重新發送
                    </div>
                  </div>

                  <div style="display: flex;" class="mt-4">
                    <!-- 註冊按鈕 -->
                    <div class=" mt-3  ">
                      <button type="submit" class="btn btn-success " style="width:  100px; margin-left: 115px;"
                        onclick="switchTab('login-content')">取消</button>
                    </div>
                    <div class=" mt-3  ">
                      <button type="submit" class="btn btn-success " style="width:  100px; margin-left: 60px;"
                        id="currentEmailCode2">確認</button>
                    </div>
                  </div>
                </form>
              </div>
              <div id="newPassword-content" class="auth-sections ">
                <div class="text-center mb-5 mt-5">
                  <!-- <img src="your-logo.png" alt="logo" width="100"> -->
                  <h5>MYGOCAR</h5>
                </div>

                <div class="step-dots mb-4">
                  <div class="step ">
                    <div class="dot active"></div>
                    <div class="sys-font">輸入帳號</div>
                  </div>
                  <div class="step">
                    <div class="dot active "></div>
                    <div class="dotLine left active "></div>
                    <div class="sys-font">信箱確認</div>
                  </div>
                  <div class="step">
                    <div class="dot active"></div>
                    <div class="dotLine left  active"></div>
                    <div class="step-font">密碼修改</div>
                  </div>
                </div>
                <form id="editNewPassword">
                  <!-- 新密碼輸入 -->
                  <div class="mx-auto  mt-5 mb-3 w-75" style="padding-left:10px; ">
                    <div class="input-group inputRelative">
                      <label for="newPassword">
                        <img src="image/icons8-password-50.png" alt="logo" width="50px">
                      </label>
                      <input type="password" id="newPassword" class=" rounded border p-1" style="width: 300px;"
                        name="password" placeholder="請輸入新密碼">
                      <button type="button" onclick="togglePassword4()" class="border-0 btn-absolute "
                        style="background:none; left: 305px;">
                        <img id="newPasswordimg" src="image/icons8-closed-eye-24.png" alt="logo" width="25px"
                          height="25px">
                      </button>

                    </div>
                  </div>


                  <div class="mx-auto mb-3 w-75" style="padding-left:60px; position:relative;">
                    <div class="input-group inputRelative">

                      <input type="password" id="newPassword2" class=" rounded border p-1"
                        style="width: 300px; height: 45px; " placeholder="請確認密碼">
                      <button type="button" onclick="togglePassword5() " class=" border-0 btn-absolute "
                        style=" background:none; left:255px;">
                        <img id="newPasswordimg2" src="image/icons8-closed-eye-24.png" alt="logo" width="25px"
                          height="25px">
                      </button>
                    </div>
                  </div>



                  <div style="display: flex;" class="mt-4">
                    <!-- 註冊按鈕 -->
                    <div class=" mt-3  ">
                      <button type="submit" class="btn btn-success " style="width:  100px; margin-left: 115px;"
                        onclick="switchTab('login-content')">取消</button>
                    </div>
                    <div class=" mt-3  ">
                      <button type="submit" class="btn btn-success" style="width:  100px; margin-left: 60px;"
                        id="editnewcurrentpassword">修改</button>
                    </div>
                  </div>
                </form>
              </div>


              <div id="sign-content" class="auth-sections hide">
                <div class="text-center mb-3 mt-4">
                  <!-- <img src="your-logo.png" alt="logo" width="100"> -->
                  <h5>MYGOCAR</h5>
                </div>
                <form id="signForm">
                  <!-- 帳號輸入 -->
                  <div class="mx-auto mb-3 w-75">

                    <div id="react-account" class="text-end ">&nbsp;
                    </div>

                    <div class="input-group ">
                      <label id="enterAccount">
                        <img src="image/icons8-male-user-60.png" alt="logo" width="20px" height="20px">
                      </label>
                      <input type="text" class=" rounded border p-1" style="height: 25px; width: 350px;" name="account"
                        id="signAccount" placeholder="  帳號">
                    </div>
                    <div class="mt-2 line">
                    </div>
                  </div>


                  <!-- 手機輸入 -->
                  <div class="mx-auto  mb-3 w-75">
                    <div id="react-phone" class="text-end ">&nbsp;
                    </div>
                    <div class="input-group ">
                      <label id="enterPhone">
                        <img src="image/icons8-phone-48.png" alt="logo" width="20px" height="20px">
                      </label>
                      <input type="text" class=" rounded border p-1" style="height: 25px;  width: 350px;" id="signPhone"
                        name="phone" placeholder="  手機">
                    </div>
                    <div class="mt-2 line">
                    </div>
                  </div>

                  <!-- 信箱輸入 -->
                  <div class="mx-auto mb-3 w-75">
                    <div id="react-email" class="text-end">&nbsp;
                    </div>
                    <div class="input-group ">
                      <label id="enterEmail">
                        <img src="image/icons8-email-48.png" alt="logo" width="20px" height="20px">
                      </label>
                      <input type="email" class=" rounded border p-1" style="height: 25px; width: 350px;" id="signEmail"
                        name="email" placeholder="  信箱">
                    </div>
                    <div class="mt-2 line">
                    </div>
                  </div>


                  <!-- 密碼輸入 -->
                  <div class="mx-auto mb-3 w-75">
                    <div id="react-password" class="text-end">&nbsp;
                    </div>
                    <div class="input-group inputRelative ">
                      <label id="emailPassword">
                        <img src="image/icons8-password-50.png" alt="logo" width="20px" height="20px">
                      </label>
                      <input type="password" class=" rounded border p-1" style="height: 25px;  width: 350px;"
                        id="signPassword" name="password" placeholder="  密碼">

                      <button type="button" onclick="togglePassword2()" class="border-0 btn-absolute1 "
                        style="background:none">
                        <img id="signPasswordImg" src="image/icons8-closed-eye-24.png" alt="logo" width="20px"
                          height="20px">
                      </button>
                    </div>
                    <div class="mt-2 line">
                    </div>
                  </div>

                  <!-- 密碼確認 -->
                  <div class="mx-auto mb-3 w-75">
                    <div id="react-password2" class="text-end">&nbsp;
                    </div>
                    <div class="input-group ps-4  inputRelative">

                      <input type="password" class=" rounded border p-1 " style=" height: 25px;  width: 350px;"
                        id="signPassword2" name="signPassword2" placeholder="  密碼確認">
                      <button type="button" onclick="togglePassword3()" class="border-0 btn-absolute1"
                        style="background:none">
                        <img id="signPasswordImg2" src="image/icons8-closed-eye-24.png" alt="logo" width="20px"
                          height="20px">
                      </button>
                    </div>

                    <div class="mt-2  line   ms-auto" style="width: 360px ;">
                    </div>
                  </div>


                  <!-- 註冊按鈕 -->
                  <div class="d-grid mb-3 w-25 mx-auto">
                    <button type="submit" class="btn btn-success">註冊</button>
                  </div>
                </form>
              </div>





            </div>


          </div>
        </section>


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

          document.addEventListener("DOMContentLoaded", function () {

            const form = document.getElementById('searchForm');
            const tabs = document.querySelectorAll('.tab');
            const dailyFields = document.querySelectorAll('.daily-field');
            const subscribeFields = document.querySelectorAll('.subscribe-field');

            tabs.forEach(tab => {
              tab.addEventListener('click', () => {
                tabs.forEach(t => t.classList.remove('active'));
                tab.classList.add('active');
                const tabType = tab.dataset.tab;

                if (tabType === 'daily') {
                  form.action = "/rental";
                  dailyFields.forEach(f => f.style.display = '');
                  subscribeFields.forEach(f => f.style.display = 'none');
                } else {
                  form.action = "/search";
                  dailyFields.forEach(f => f.style.display = 'none');
                  subscribeFields.forEach(f => f.style.display = '');
                }
              });
            });
          })
        </script>
      </body>

      </html>