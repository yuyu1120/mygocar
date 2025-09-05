<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
                crossorigin="anonymous">

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
                crossorigin="anonymous">
                </script>


            <style>
                input[type="password"]::-ms-reveal,
                input[type="password"]::-ms-clear,
                input[type="password"]::-webkit-credentials-auto-fill-button,
                input[type="password"]::-webkit-clear-button {
                    display: none;
                }

                body {
                    background-color: blanchedalmond;
                }



                .bodyClose {}

                .modal-background {
                    display: none;
                    /* 預設不顯示 */
                    position: fixed;
                    top: 0;
                    left: 0;
                    right: 0;
                    bottom: 0;
                    background-color: rgba(0, 0, 0, 0.5);
                    /* 半透明黑色 */
                    justify-content: center;
                    align-items: center;
                }

                /* 中間白色彈窗 */
                .modal-content {
                    background: white;
                    padding: 20px;
                    border-radius: 10px;
                    width: 600px;
                    text-align: center;
                }

                /* authCSS */
                .auth-section {
                    padding: 7em 0;
                }

                #auth-container {
                    display: grid;
                    grid-template-areas:
                        "sidebar content";
                    grid-template-columns: 200px 500px;
                    justify-content: center;
                    align-content: center;
                    height: 50vh;


                }

                .auth-sidebar {
                    grid-area: sidebar;
                    background-color: rgb(4, 117, 79);
                    display: flex;
                    justify-content: flex-end;

                    align-items: center;
                    height: 500px;
                }

                .auth-card {
                    display: flex;

                    flex-direction: column;
                    gap: 30px;



                }

                #login {


                    width: 130px;
                    text-align: center;
                    border-bottom-left-radius: 30px;
                    border-top-left-radius: 30px;


                }

                #sign {


                    width: 130px;
                    text-align: center;
                    border-bottom-left-radius: 30px;
                    border-top-left-radius: 30px;


                }

                .auth-content {
                    grid-area: content;
                    background-color: white;
                    height: 500px;
                }

                #login-content {}

                #sign-content {
                    /* display: none;  */
                }


                /* 三個圓點與線條 */
                .step-dots {
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    gap: 40px;
                    /* 圓點間距 */
                    position: relative;
                }



                .step-dots .dot {
                    width: 20px;
                    height: 20px;
                    border-radius: 50%;
                    background: #dee2e6;
                    z-index: 1;
                }

                .step {
                    display: flex;
                    flex-direction: column;
                    align-items: center;
                    position: relative;
                }

                /* 線條 */
                .dotLine {
                    position: absolute;
                    top: 10px;
                    /* 與圓心對齊 */
                    width: 100px;
                    height: 2px;
                    background: #dee2e6;
                    /* 預設灰色 */
                    z-index: 0;
                }

                .active {
                    background-color: green !important;
                }

                .sys-font {
                    color: #9ca3af;

                }

                .step-font {
                    font-weight: bold;
                }

                .left {
                    left: -70px;
                }

                dd .line {
                    border-top: 2px solid black;

                }

                .emailBtn {
                    border: 2px solid #ccc;
                    width: 60px;
                    height: 60px;
                    border-radius: 3px
                }

                .btn-absolute {
                    position: absolute;
                    left: 0px;
                    top: 8px;
                }

                .auth-content input {
                    background-color: transparent;

                }

                .auth-content input:focus {
                    outline: none;
                    box-shadow: none;

                }

                .btn-absolute1 {
                    position: absolute;
                    right: 5px;
                    top: 0px;
                }

                .inputRelative {
                    position: relative;

                }

                .hide {
                    display: none;
                }

                .backgroudshow {
                    background-color: white;
                }

                .colorwhite {
                    color: white;
                }
            </style>


        </head>

        <body>
            <button id="showLoginForm" onclick="showLoginForm()">登入</button>


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
                                    style=" font-size: 25px;background-color: transparent; "
                                    onclick="switchTab('sign-content')">SIGN
                                    UP</button>
                            </div>
                        </div>
                    </div>
                    <div class="auth-content">
                        <div id="login-content" class="auth-sections hide  ">
                            <div class="text-center mb-5 mt-4">
                                <!-- <img src="your-logo.png" alt="logo" width="100"> -->
                                <h5>Bling Bling 有禮</h5>
                            </div>
                            <form id="loginForm">
                                <!-- 帳號輸入 -->
                                <div class="mx-auto mt-2 mb-3 w-75">
                                    <div class="input-group">
                                        <label for="account">
                                            <img src="image/icons8-male-user-60.png" alt="logo" width="50px">
                                        </label>
                                        <input type="text" id="account"
                                            class="form-control border-0 border-bottom border-dark border-2 rounded-0 "
                                            name="account" placeholder="帳號">
                                    </div>
                                </div>

                                <!-- 密碼輸入 -->
                                <div class="mx-auto mb-5 w-75">
                                    <div class="input-group">
                                        <label for="password">
                                            <img src="image/icons8-password-50.png" alt="logo" width="50px">
                                        </label>
                                        <input id="password" type="password"
                                            class="form-control border-0 border-bottom border-dark border-2 rounded-0 "
                                            name="password" placeholder="密碼">
                                        <button type="button" onclick="togglePassword1()"
                                            class="border-0 border-bottom border-dark border-2" style="background:none">
                                            <img id="passwordimg" src="image/icons8-closed-eye-24.png" alt="logo"
                                                width="25px" height="25px">
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
                                <h5>Bling Bling 有禮</h5>
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
                                        <input type="text" id="current-account" class=" rounded border p-1"
                                            style="width: 300px;" name="account" placeholder="請輸入帳號">
                                    </div>
                                </div>

                                <div class="mx-auto mb-3 w-75" style="padding-left:10px;">
                                    <div class="input-group">
                                        <label for="email">
                                            <img src="image/icons8-email-48.png" alt="logo" width="50px">
                                        </label>
                                        <input type="text" id="current-email" class=" rounded border p-1"
                                            style="width: 300px;" name="email" placeholder="請輸入信箱">
                                    </div>
                                </div>
                                <div style="display: flex;" class="mt-4">
                                    <!-- 註冊按鈕 -->
                                    <div class=" mt-3  ">
                                        <button type="submit" class="btn btn-success "
                                            style="width:  100px; margin-left: 115px;"
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
                                <h5>Bling Bling 有禮</h5>
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
                                        <button type="submit" class="btn btn-success "
                                            style="width:  100px; margin-left: 115px;"
                                            onclick="switchTab('login-content')">取消</button>
                                    </div>
                                    <div class=" mt-3  ">
                                        <button type="submit" class="btn btn-success "
                                            style="width:  100px; margin-left: 60px;" id="currentEmailCode2">確認</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <div id="newPassword-content" class="auth-sections ">
                            <div class="text-center mb-5 mt-5">
                                <!-- <img src="your-logo.png" alt="logo" width="100"> -->
                                <h5>Bling Bling 有禮</h5>
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
                                        <input type="password" id="newPassword" class=" rounded border p-1"
                                            style="width: 300px;" name="password" placeholder="請輸入新密碼">
                                        <button type="button" onclick="togglePassword4()" class="border-0 btn-absolute "
                                            style="background:none; left: 305px;">
                                            <img id="newPasswordimg" src="image/icons8-closed-eye-24.png" alt="logo"
                                                width="25px" height="25px">
                                        </button>

                                    </div>
                                </div>


                                <div class="mx-auto mb-3 w-75" style="padding-left:60px; position:relative;">
                                    <div class="input-group inputRelative">

                                        <input type="password" id="newPassword2" class=" rounded border p-1"
                                            style="width: 300px; height: 45px; " placeholder="請確認密碼">
                                        <button type="button" onclick="togglePassword5() "
                                            class=" border-0 btn-absolute " style=" background:none; left:255px;">
                                            <img id="newPasswordimg2" src="image/icons8-closed-eye-24.png" alt="logo"
                                                width="25px" height="25px">
                                        </button>
                                    </div>
                                </div>



                                <div style="display: flex;" class="mt-4">
                                    <!-- 註冊按鈕 -->
                                    <div class=" mt-3  ">
                                        <button type="submit" class="btn btn-success "
                                            style="width:  100px; margin-left: 115px;"
                                            onclick="switchTab('login-content')">取消</button>
                                    </div>
                                    <div class=" mt-3  ">
                                        <button type="submit" class="btn btn-success"
                                            style="width:  100px; margin-left: 60px;"
                                            id="editnewcurrentpassword">修改</button>
                                    </div>
                                </div>
                            </form>
                        </div>


                        <div id="sign-content" class="auth-sections hide">
                            <div class="text-center mb-3 mt-4">
                                <!-- <img src="your-logo.png" alt="logo" width="100"> -->
                                <h5>Bling Bling 有禮</h5>
                            </div>
                            <form id="signForm">
                                <!-- 帳號輸入 -->
                                <div class="mx-auto mb-3 w-75">

                                    <div id="react-account" class="text-end ">&nbsp;
                                    </div>

                                    <div class="input-group ">
                                        <label id="enterAccount">
                                            <img src="image/icons8-male-user-60.png" alt="logo" width="20px"
                                                height="20px">
                                        </label>
                                        <input type="text" class=" rounded border p-1"
                                            style="height: 25px; width: 350px;" name="account" id="signAccount"
                                            placeholder="  帳號">
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
                                        <input type="text" class=" rounded border p-1"
                                            style="height: 25px;  width: 350px;" id="signPhone" name="phone"
                                            placeholder="  手機">
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
                                        <input type="email" class=" rounded border p-1"
                                            style="height: 25px; width: 350px;" id="signEmail" name="email"
                                            placeholder="  信箱">
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
                                            <img src="image/icons8-password-50.png" alt="logo" width="20px"
                                                height="20px">
                                        </label>
                                        <input type="password" class=" rounded border p-1"
                                            style="height: 25px;  width: 350px;" id="signPassword" name="password"
                                            placeholder="  密碼">

                                        <button type="button" onclick="togglePassword2()"
                                            class="border-0 btn-absolute1 " style="background:none">
                                            <img id="signPasswordImg" src="image/icons8-closed-eye-24.png" alt="logo"
                                                width="20px" height="20px">
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

                                        <input type="password" class=" rounded border p-1 "
                                            style=" height: 25px;  width: 350px;" id="signPassword2"
                                            name="signPassword2" placeholder="  密碼確認">
                                        <button type="button" onclick="togglePassword3()" class="border-0 btn-absolute1"
                                            style="background:none">
                                            <img id="signPasswordImg2" src="image/icons8-closed-eye-24.png" alt="logo"
                                                width="20px" height="20px">
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






            <section>

                <div id="myModal" class="modal-background">
                    <div class="modal-content">

                        <h2 style="text-align: center;">歡迎加入 XHealth 會員！</h2>

                        <form th:action="@{/add}" method="post">

                            <!-- 使用者帳號 + 電子郵件 同一行 -->
                            <div style="display: flex; gap: 10px; margin-bottom: 10px;">
                                <div style="flex: 1;">
                                    <label>使用者帳號（必填）</label><br>
                                    <input type="text" name="account" required style="width: 100%;">
                                    <span id="msg" style="color:red"></span>
                                </div>
                                <div style="flex: 1;">
                                    <label>電子郵件信箱（必填）</label><br>
                                    <input type="email" name="email" required style="width: 100%;">
                                </div>
                            </div>

                            <!-- 姓名 + 生日 同一行 -->
                            <div style="display: flex; gap: 10px; margin-bottom: 10px;">
                                <div style="flex: 1;">
                                    <label>姓名</label><br>
                                    <input type="text" name="name" style="width: 100%;">
                                </div>
                                <div style="flex: 1;">
                                    <label>生日</label><br>
                                    <input type="date" name="birthday" style="width: 100%;">
                                </div>
                            </div>

                            <!-- 密碼 單獨一行 -->
                            <div style="margin-bottom: 10px;">
                                <label>密碼（必填）</label><br>
                                <input type="password" name="password" required style="width: 100%;">
                                <input type="checkbox" onclick="togglePassword()"> 顯示密碼
                                <span id="errorText" style="color:red"></span>
                            </div>

                            <!-- 電話 單獨一行 -->
                            <div style="margin-bottom: 10px;">
                                <label>電話</label><br>
                                <input type="text" name="telephone" style="width: 100%;">
                            </div>

                            <!-- 地址 單獨一行 -->
                            <div style="margin-bottom: 10px;">
                                <label>地址</label><br>
                                <input type="text" name="address" style="width: 100%;">
                            </div>

                            <!-- 性別選項 -->
                            <div style="margin-bottom: 10px;">
                                <label>性別</label><br>
                                <input type="radio" name="gender" value="女"> 女
                                <input type="radio" name="gender" value="男"> 男
                            </div>

                            <!-- 送出按鈕 -->
                            <div style="text-align: center;">
                                <button type="submit">提交</button>
                                <button type="button" onclick="hideLoginForm()">取消</button>
                            </div>

                        </form>

            </section>






            <script src="/js/app.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
                crossorigin="anonymous">
                </script>
            <script>

                //  顯示登入頁面 
                document.addEventListener("click", function (e) {

                    if (!document.getElementById('auth-container').contains(e.target) && !document.getElementById('showLoginForm').contains(e.target)) { document.getElementById('auth-section').style.display = 'none'; }

                })
                function showLoginForm() {

                    document.getElementById('auth-section').style.display = 'flex';


                }
                function hideLoginForm() {
                    document.getElementById('auth-section').style.display = 'none';
                }
                async function switchTab(id) {



                    document.querySelectorAll(".auth-sections").forEach(btn => btn.classList.add("hide"));

                    document.getElementById(id).classList.remove("hide");
                    if (id === "login-content") {
                        document.getElementById("login").classList.add("backgroudshow");
                        document.getElementById("sign").classList.remove("backgroudshow");
                        document.getElementById("loginbtn").classList.remove("colorwhite");
                        document.getElementById("signbtn").classList.add("colorwhite");
                    }
                    else if (id === "sign-content") {
                        document.getElementById("login").classList.remove("backgroudshow");
                        document.getElementById("sign").classList.add("backgroudshow");
                        document.getElementById("loginbtn").classList.add("colorwhite");
                        document.getElementById("signbtn").classList.remove("colorwhite");
                    }

                    else {
                        console.log("有進入");
                    }



                }
                function toggleLogin() {
                    document.getElementById("login-content").classList.remove("hide")
                    document.getElementById("sign-content").classList.add("hide")
                    document.getElementById("login").classList.add("backgroudshow")
                    document.getElementById("sign").classList.remove("backgroudshow")
                    document.getElementById("loginbtn").classList.remove("colorwhite")
                    document.getElementById("signbtn").classList.add("colorwhite")
                }
                function toggleSign() {
                    document.getElementById("login-content").classList.add("hide")
                    document.getElementById("sign-content").classList.remove("hide")
                    document.getElementById("login").classList.remove("backgroudshow")
                    document.getElementById("sign").classList.add("backgroudshow")
                    document.getElementById("loginbtn").classList.add("colorwhite")
                    document.getElementById("signbtn").classList.remove("colorwhite")


                }
                function togglePassword1() {
                    const input = document.getElementById("password");
                    const img = document.getElementById("passwordimg");
                    if (input.type === "password") {
                        input.type = "text";//顯示
                        img.src = "image/icons8-eye-24.png";
                    }
                    else {
                        input.type = "password";
                        img.src = "image/icons8-closed-eye-24.png";
                    }

                }
                function togglePassword2() {
                    const input = document.getElementById("signPassword");
                    const img = document.getElementById("signPasswordImg");
                    if (input.type === "password") {
                        input.type = "text";//顯示
                        img.src = "image/icons8-eye-24.png";
                    }
                    else {
                        input.type = "password";
                        img.src = "image/icons8-closed-eye-24.png";
                    }

                }
                function togglePassword3() {
                    const input = document.getElementById("signPassword2");
                    const img = document.getElementById("signPasswordImg2");
                    if (input.type === "password") {
                        input.type = "text";//顯示
                        img.src = "image/icons8-eye-24.png";
                    }
                    else {
                        input.type = "password";
                        img.src = "image/icons8-closed-eye-24.png";
                    }

                }
                function togglePassword4() {
                    const input = document.getElementById("newPassword");
                    const img = document.getElementById("newPasswordimg");
                    if (input.type === "password") {
                        input.type = "text";//顯示
                        img.src = "image/icons8-eye-24.png";
                    }
                    else {
                        input.type = "password";
                        img.src = "image/icons8-closed-eye-24.png";
                    }

                }
                function togglePassword5() {
                    const input = document.getElementById("newPassword2");
                    const img = document.getElementById("newPasswordimg2");
                    if (input.type === "password") {
                        input.type = "text";//顯示
                        img.src = "image/icons8-eye-24.png";
                    }
                    else {
                        input.type = "password";
                        img.src = "image/icons8-closed-eye-24.png";
                    }

                }

                document.getElementById("enterAccount").addEventListener('click', () => {
                    const a = document.getElementById("signAccount");
                    const p = document.getElementById("signPhone");
                    const e = document.getElementById("signEmail");
                    const pw = document.getElementById("signPassword");
                    const pw2 = document.getElementById("signPassword2");;


                    // 設定預設值
                    a.value = 'ab@1';            // 帳號：太短又含 @（不符 8~16 只限英數）
                    pw.value = 'abcdefg';         // 密碼：只有小寫而且太短，沒大寫/數字
                    e.value = 'test@example.com';   // 信箱：格式錯誤（有兩個 @）
                    p.value = '09aa';                // 手機：先留空
                    pw2.value = 'aa132';

                    // 定義觸發 input 事件的方法
                    const fire = (el) => {
                        el.dispatchEvent(new Event('input', { bubbles: true }));
                    };

                    // 逐一觸發，確保監聽器能抓到更新
                    [a, p, e, pw, pw2].forEach(fire);

                    const input = document.getElementById("signPassword");
                    const img = document.getElementById("signPasswordImg");
                    if (input.type === "password") {
                        input.type = "text";//顯示
                        img.src = "image/icons8-eye-24.png";
                    }
                    else {
                        input.type = "password";
                        img.src = "image/icons8-closed-eye-24.png";
                    }

                    const inputs = document.getElementById("signPassword2");
                    const imgs = document.getElementById("signPasswordImg2");
                    if (inputs.type === "password") {
                        inputs.type = "text";//顯示
                        imgs.src = "image/icons8-eye-24.png";
                    }
                    else {
                        inputs.type = "password";
                        imgs.src = "image/icons8-closed-eye-24.png";
                    }

                }
                );


                document.getElementById("enterPhone").addEventListener('click', () => {
                    const a = document.getElementById("signAccount");
                    const p = document.getElementById("signPhone");
                    const e = document.getElementById("signEmail");
                    const pw = document.getElementById("signPassword");
                    const pw2 = document.getElementById("signPassword2");;


                    // 設定預設值
                    a.value = '';            // 帳號：太短又含 @（不符 8~16 只限英數）
                    pw.value = '';         // 密碼：只有小寫而且太短，沒大寫/數字
                    e.value = '';   // 信箱：格式錯誤（有兩個 @）
                    p.value = '';                // 手機：先留空
                    pw2.value = '';

                    // 定義觸發 input 事件的方法
                    const fire = (el) => {
                        el.dispatchEvent(new Event('input', { bubbles: true }));
                    };

                    // 逐一觸發，確保監聽器能抓到更新
                    [a, p, e, pw, pw2].forEach(fire);


                }
                );


                document.getElementById("enterEmail").addEventListener('click', () => {
                    const a = document.getElementById("signAccount");
                    const p = document.getElementById("signPhone");
                    const e = document.getElementById("signEmail");
                    const pw = document.getElementById("signPassword");
                    const pw2 = document.getElementById("signPassword2");;


                    // 設定預設值
                    a.value = 'A999999';            // 帳號：太短又含 @（不符 8~16 只限英數）
                    pw.value = '';         // 密碼：只有小寫而且太短，沒大寫/數字
                    e.value = '';   // 信箱：格式錯誤（有兩個 @）
                    p.value = '0933211258';                // 手機：先留空
                    pw2.value = '';

                    // 定義觸發 input 事件的方法
                    const fire = (el) => {
                        el.dispatchEvent(new Event('input', { bubbles: true }));
                    };

                    // 逐一觸發，確保監聽器能抓到更新
                    [a, p, e, pw, pw2].forEach(fire);


                }
                );

                document.getElementById("emailPassword").addEventListener('click', () => {
                    const a = document.getElementById("signAccount");
                    const p = document.getElementById("signPhone");
                    const e = document.getElementById("signEmail");
                    const pw = document.getElementById("signPassword");
                    const pw2 = document.getElementById("signPassword2");;


                    // 設定預設值
                    a.value = 'user12345';
                    p.value = '0912345678';
                    e.value = 'user123@text.com';
                    pw.value = 'Abc12345678';
                    pw2.value = 'Abc12345678';

                    // 定義觸發 input 事件的方法
                    const fire = (el) => {
                        el.dispatchEvent(new Event('input', { bubbles: true }));
                    };

                    // 逐一觸發，確保監聽器能抓到更新
                    [a, p, e, pw, pw2].forEach(fire);


                }
                );


                document.getElementById("loginForm").addEventListener("submit", function (e) {

                    e.preventDefault();


                    const account = document.getElementById("account").value.trim();
                    const password = document.getElementById("password").value.trim();
                    console.log(document.getElementById("account").value.trim());


                    let text = "";
                    if (account === "") {
                        text += "請輸入帳號";
                    }
                    if (password === "") {
                        if (text !== "") {
                            text += "與密碼";
                        }
                        else {

                            text += "請輸入密碼";
                        }
                    }

                    if (text !== "") {
                        document.getElementById("account").value = "";
                        document.getElementById("password").value = "";

                        alert(text);
                        return;
                    }
                    const form = document.getElementById("loginForm");
                    const formData = new FormData(form);

                    fetch("/login", {
                        method: "post",
                        body: formData
                    })

                        .then(response => response.text())
                        .then(data => {
                            if (data === "登入成功") {
                                window.location.href = "/x";

                            } else {
                                alert(data);
                            }
                        })
                    document.getElementById("account").value = "";
                    document.getElementById("password").value = "";
                });

                document.getElementById("signForm").addEventListener("submit", async function (e) {

                    e.preventDefault();


                    const account = document.getElementById("signAccount").value.trim();
                    const phone = document.getElementById("signPhone").value.trim();
                    const email = document.getElementById("signEmail").value.trim();
                    const password = document.getElementById("signPassword").value.trim();
                    const password2 = document.getElementById("signPassword2").value.trim();

                    const payload = {
                        account: document.getElementById("signAccount").value.trim(),
                        phone: document.getElementById("signPhone").value.trim(),
                        email: document.getElementById("signEmail").value.trim(),
                        password: document.getElementById("signPassword").value.trim(),
                        password2: document.getElementById("signPassword2").value.trim()
                    }


                    let accounts = [];

                    const res = await fetch("/loginImmediate");

                    accounts = await res.json();


                    let text = "";
                    let text1 = "";


                    // 1) 先判斷是否沒輸入
                    if (account === '') {
                        text += '請輸入帳號';
                    }

                    // 2) 已輸入 → 判斷是否已存在
                    else if (accounts.includes(account)) {

                        text1 += '帳號已存在，請換一個';


                    }
                    else {
                        const ok = /^[A-Za-z0-9]{8,16}$/.test(account); // 8~16 英數字
                        if (!ok)
                            text1 += '帳號需為 8~16 位英數字';

                    }



                    // 2. 手機驗證
                    if (phone === "") {
                        if (text) {
                            text += "、手機";  // text 已有東西 → 接上
                        } else {
                            text += "請輸入手機";
                        }
                    } else {
                        const ok = /^09\d{8}$/.test(phone);
                        if (!ok) {
                            if (text1) {
                                text1 += "、手機格式錯誤";  // 如果已經有錯誤，接上
                            } else {
                                text1 += "請輸入正確的手機格式 (09開頭共10碼)";
                            }
                        }
                    }


                    // 3. 信箱驗證
                    if (email === "") {
                        if (text) {
                            text += "、信箱";
                        } else {
                            text += "請輸入信箱";
                        }
                    } else {
                        const ok = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
                        if (!ok) {
                            if (text1) {
                                text1 += "、信箱格式錯誤";
                            } else {
                                text1 += "請輸入正確的信箱格式";
                            }
                        }
                    }

                    // 4. 密碼驗證
                    if (password === "") {
                        if (text) {
                            text += "、密碼";
                        } else {
                            text += "請輸入密碼";
                        }
                    } else {
                        const ok = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{9,}$/.test(password);
                        if (!ok) {
                            if (text1) {
                                text1 += "、密碼需包含大小寫英文與數字，至少9碼";
                            } else {
                                text1 += "密碼需包含大小寫英文與數字，至少9碼";
                            }
                        }
                    }
                    // 5. 確認密碼驗證
                    if (password2 === "") {
                        if (text) {
                            text += "、確認密碼";
                        } else {
                            text += "請輸入確認密碼";
                        }
                    } else if (password2 !== password) {
                        if (text1) {
                            text1 += "、密碼不一致";
                        } else {
                            text1 += "兩次輸入的密碼不一致";
                        }
                    }


                    let textall = text + "\n" + text1
                    if (text || text1) {

                        alert(textall);
                        return;
                    }

                    fetch("/sign", {
                        method: "post",
                        headers: {
                            "Content-Type": "application/json"
                        },
                        body: JSON.stringify(payload)
                    })
                        .then(res => res.json())
                        .then(data => {
                            if (data.msg === "註冊成功") {

                                document.getElementById("login-content").classList.remove("hide");
                                document.getElementById("sign-content").classList.add("hide");
                                document.getElementById("login").classList.add("backgroudshow");
                                document.getElementById("sign").classList.remove("backgroudshow");
                                document.getElementById("loginbtn").classList.remove("colorwhite");
                                document.getElementById("signbtn").classList.add("colorwhite");
                                alert("註冊成功");

                            }
                        })

                    // .then(response => response.text())
                    // .then(data => {
                    //     console.log("有進入2");
                    //     console.log(data);
                    //     alert(data);
                    // })

                    document.getElementById("signAccount").value = "";
                    document.getElementById("signPhone").value = "";
                    document.getElementById("signEmail").value = "";
                    document.getElementById("signPassword").value = "";
                    document.getElementById("signPassword2").value = ""
                });

                document.getElementById("currentAccount").addEventListener("click", function (e) {

                    e.preventDefault();
                    console.log("哈哈吃吃");
                    console.log(e.target.id);
                    console.log("哈哈");
                    if (e.target.id === "currentAccountEmail") {
                        let text = "";

                        const payload = {
                            account: document.getElementById("current-account").value.trim(),
                            email: document.getElementById("current-email").value.trim()

                        }

                        if (!payload.account) {


                            text += "請輸入帳號";
                        }

                        if (!payload.email) {

                            if (text) {
                                text += "、信箱";

                            }
                            else {
                                text += "請輸入信箱";
                            }


                        }
                        if (text) {
                            alert(text);
                            return;
                        }
                        console.log("有進入哈哈哈");
                        console.log(payload);
                        fetch("/currentContent", {
                            method: "post",
                            headers: {
                                "Content-Type": "application/json"
                            },
                            body: JSON.stringify(payload)
                        })
                            .then(res => res.json())
                            .then(data => {
                                console.log(data);

                                if (data.success) {
                                    switchTab("email-content");
                                    alert(data.msg);

                                }
                                else {
                                    alert(data.msg)
                                }
                            })

                    }
                });





                const inputs = document.querySelectorAll('.emailBtn');
                // 綁定每格事件
                inputs.forEach((input, idx) => {

                    // 輸入：只留數字一碼，滿一碼跳下一格
                    input.addEventListener("input", () => {

                        if (input.value.length === 1 && idx < inputs.length - 1) {

                            inputs[idx + 1].focus();

                        }
                    });

                    // Backspace：本格空 → 跳回上一格

                });

                // 綁定按鈕點擊事件
                document.getElementById("currentEmailCode").addEventListener("click", (e) => {
                    // 把所有輸入框變成陣列

                    e.preventDefault();



                    if (e.target.id === "currentEmailCode2") {

                        const inputs = Array.from(document.querySelectorAll(".emailBtn"));



                        // 檢查是否每個輸入框都有值
                        const allFilled = inputs.every(inp => inp.value !== "");

                        if (!allFilled) {
                            alert("請輸入完整的驗證密碼");
                            return; // 中止，不往下執行
                        }

                        // 把六個數字組合成一個字串
                        const code = inputs.map(inp => inp.value).join("");

                        // 建立 JSON
                        const payload = { code: code };

                        console.log("準備傳給後端:", payload);

                        // 用 fetch 傳給後端 (假設後端 API 是 /verify)
                        fetch("/verifyCode", {
                            method: "POST",
                            headers: { "Content-Type": "application/json" },
                            body: JSON.stringify(payload)
                        })
                            .then(res => res.json())
                            .then(data => {
                                console.log("後端回覆:", data);
                                if (data.success) {
                                    alert(data.msg)
                                    switchTab('newPassword-content');


                                }

                                else {
                                    alert(data.msg);
                                }
                            })
                            .catch(err => console.error("錯誤:", err));


                    }
                });






                document.getElementById("editNewPassword").addEventListener("click", async (e) => {

                    e.preventDefault();




                    if (e.target.id === "editnewcurrentpassword") {

                        const pwdRe = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$/; // 至少8碼 含大小寫與數字


                        const pwd = document.getElementById("newPassword").value.trim();
                        const pwd2 = document.getElementById("newPassword2").value.trim();


                        const payload = {
                            password: pwd,
                            password2: pwd2
                        }

                        console.log(payload);

                        if (!pwdRe.test(pwd)) {
                            alert('密碼需至少 8 碼，且包含大小寫字母與數字');
                            return;
                        }
                        if (pwd !== pwd2) {
                            alert('兩次輸入的密碼不一致');
                            return;
                        }

                        fetch("/resetPassword", {
                            method: "POST",
                            headers: { "Content-Type": "application/json" },
                            body: JSON.stringify(payload)
                        })
                            .then(res => res.json())
                            .then(data => {

                                if (data.success) {
                                    alert("修改成功");
                                    switchTab('login-content');
                                }
                            })
                            .catch(err => {
                                console.error("錯誤:", err);
                            });





                    }

                })



            </script>

            <!-- React & ReactDOM（CDN），以及 Babel 讓瀏覽器可跑 JSX -->
            <script src="https://unpkg.com/react@18/umd/react.development.js"></script>
            <script src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
            <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

            <script type="text/babel">
                    (() => {

                        // 驗證規則（依 inputId 決定）
                        function validate(field, value, extra = {}) {

                            console.log("哈哈4你好");
                            if (!value.trim()) {
                                ;
                                return { ok: null, msg: '' };
                            }
                            if (field === 'signAccount') {

                                // 1. 判斷是否重複
                                if (extra.account && extra.account.includes(value)) {
                                    return { ok: false, msg: '帳號已存在，請換一個' };
                                }

                                // 2. 判斷格式是否正確 (8~16 英數字)
                                const ok = /^[A-Za-z0-9]{8,16}$/.test(value);
                                if (!ok) {
                                    return { ok: false, msg: '格式不正確：需為 8~16 位英數字' };
                                }

                                // 3. 格式正確且不重複
                                return { ok: true, msg: '格式正確，可以使用' };
                            }



                            if (field === 'signPhone') {
                                const ok = /^09\d{8}$/.test(value);
                                return { ok, msg: ok ? '格式正確' : '需為 09 開頭共 10 碼' };
                            }

                            if (field === 'signEmail') {
                                const ok = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(value);
                                return { ok, msg: ok ? '格式正確' : '信箱格式錯誤' };
                            }

                            // 判斷密碼 (至少1大寫 + 1小寫 + 1數字，長度 >= 9)
                            if (field === 'signPassword') {
                                const ok = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{9,}$/.test(value);
                                return { ok, msg: ok ? '格式正確' : '需含大小寫字母、數字，至少9碼' };
                            }

                            // 判斷確認密碼 (需與密碼一致)
                            if (field === 'signPassword2') {
                                // 這裡需要拿到原本的密碼，所以要從 action.extra 帶進來
                                const password = extra?.password ?? '';
                                console.log(password + "這是密碼");
                                console.log(value + "這是確認密馬");
                                const ok = value === password;
                                return { ok, msg: ok ? '密碼一致' : '與密碼不符' };
                            }
                            return { ok: null, msg: '' };
                        }

                        const requiredMsg = {
                            signAccount: '請輸入帳號',
                            signPhone: '請輸入手機',
                            signEmail: '請輸入信箱',
                            signPassword: '請輸入密碼',
                            signPassword2: '請再次輸入密碼',
                        };
                        // reducer：集中管理 value / valid / msg
                        function reducer(state, action) {
                            switch (action.type) {
                                case 'SET': {
                                    const v = String(action.value ?? '');
                                    console.log("哈哈3你好");
                                    const extra = action.extra || {};
                                    const r = validate(action.field, v, extra);
                                    // 如果還沒輸入過（第一次觸發）

                                    if (!state.touched) {

                                        return {
                                            ...state,
                                            value: v,
                                            touched: true,
                                            valid: r.ok, // 第一次空白 → 不顯示錯誤
                                            msg: r.msg,
                                            extra: {
                                                ...state.extra,
                                                ...action.extra
                                            }
                                        };
                                    }

                                    // 已經輸入過之後
                                    if (v.trim().length === 0) {

                                        return {

                                            ...state,
                                            value: v,
                                            valid: false,
                                            msg: requiredMsg[action.field] ?? '請輸入內容',
                                            extra: {
                                                ...state.extra,
                                                ...action.extra
                                            }
                                        };
                                    }
                                    console.log("哈哈XXX3");
                                    // 格式驗證（用 validate）

                                    return {

                                        ...state,
                                        value: v,
                                        valid: r.ok,
                                        msg: r.msg,
                                        extra: {
                                            ...state.extra,
                                            ...action.extra
                                        }
                                    };
                                }

                                default:
                                    return state;
                            }
                        }
                        // 綁定某個 input 的自訂 Hook
                        function useInputBinding(inputId) {

                            const [state, dispatch] = React.useReducer(reducer, {
                                value: '',
                                valid: false, // null=未輸入, true=通過, false=不通過
                                touched: false,
                                msg: '',
                                extra: {
                                    password: "",
                                    account: []
                                }
                            });
                            const accountsRef = React.useRef([]);
                            const [accounts, setAccounts] = React.useState([]);

                            console.log("哈哈5你好");

                            React.useEffect(() => {
                                fetch("/loginImmediate")
                                    .then(res => res.json())
                                    .then(data => {

                                        setAccounts(data);
                                    })
                            }, []);

                            React.useEffect(() => {
                                accountsRef.current = accounts;
                            }, [accounts]);
                            console.log("哈哈6你好");

                            React.useEffect(() => {
                                console.log("哈哈5 你好", accounts);
                                const el = document.getElementById(inputId);
                                if (!el) return;

                                // 🟢 綁定事件
                                const onInput = (e) => {

                                    if (inputId === 'signPassword2') {
                                        const pwd = document.getElementById("signPassword")?.value ?? '';
                                        dispatch({
                                            type: 'SET',
                                            field: inputId,
                                            value: e.target.value,
                                            extra: { password: pwd, account: accountsRef.current }
                                        });
                                    } else {
                                        console.log(accounts, "在dispath裡");
                                        dispatch({ type: 'SET', field: inputId, value: e.target.value, extra: { account: accountsRef.current } });
                                    }
                                };
                                console.log("測試有無近來abc123");
                                el.addEventListener('input', onInput);
                                return () =>

                                    el.removeEventListener('input', onInput);

                            }, [inputId], accounts);

                            return state;
                        }


                        // 🟢 Component：顯示綁定值
                        function Preview({ inputId }) {
                            console.log("哈哈2" + "你好");

                            const { value, valid, touched, msg } = useInputBinding(inputId);

                            // 一開始空值：回傳不換行空白，避免版面高度跳動
                            if (!value.trim() && !touched) {
                                console.log("哈哈4");
                                return <span style={{ fontSize: '12px', color: '#666' }}>&nbsp;</span>;
                            }

                            console.log("哈哈99");
                            // 顯示 ✅ / ❌ 與訊息
                            const icon = valid ? '✅' : '❌';
                            const color = valid ? '#0a7' : '#d33';

                            return (

                                <span style={{ fontSize: '12px', color, marginLeft: '8px' }}>
                                    {icon} {msg}
                                </span>
                            );

                        }
                        // 🟢 掛載帳號
                        const mountAcc = document.getElementById("react-account");
                        if (mountAcc) {
                            console.log("哈哈1" + "你好");
                            ;
                            ReactDOM.createRoot(mountAcc).render(
                                <Preview inputId="signAccount" />
                            );
                        }

                        // 🟢 掛載手機
                        const mountPh = document.getElementById("react-phone");
                        if (mountPh) {
                            ReactDOM.createRoot(mountPh).render(
                                <Preview inputId="signPhone" />
                            );
                        }

                        const mountEm = document.getElementById("react-email");
                        if (mountEm) {
                            ReactDOM.createRoot(mountEm).render(
                                <Preview inputId="signEmail" />
                            );
                        }

                        const mountPa = document.getElementById("react-password");
                        if (mountPa) {
                            ReactDOM.createRoot(mountPa).render(
                                <Preview inputId="signPassword" />
                            );
                        }

                        const mountPa2 = document.getElementById("react-password2");
                        if (mountPa2) {
                            ReactDOM.createRoot(mountPa2).render(
                                <Preview inputId="signPassword2" />
                            );
                        }
                    }
                    )();
            </script>
        </body>

        </html>