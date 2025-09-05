<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr" crossorigin="anonymous">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous">
        </script>
    <style>
        body {
            background-color: blanchedalmond;
        }

        .member-section {
            padding: 4em 0;
        }

        .member-container {
            display: grid;
            grid-template-areas:
                "sidebar ship content";
            grid-template-columns: 300px 275px 625px;
            justify-content: center;
            align-content: center;
            height: 80vh;


        }

        .member-sidebar {
            grid-area: sidebar;
            background-color: rgb(13, 205, 90);
            display: flex;
            justify-content: center;
            height: 500px;
            position: relative;
        }

        .avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid rgb(7, 226, 229);
            display: block;
            margin-left: auto;
            margin-right: auto;
            position: absolute;
            top: -80px;
            right: 75px;

        }

        h3 {
            margin-top: 100px;
        }


        .member-card {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;


        }

        .member-card button {
            height: 50px;
            width: 250px;
            border-radius: 15px;



        }

        .member-ship {
            grid-area: ship;
            background-color: white;

            height: 500px;
        }

        .member-ship img {
            margin-left: 60px;
        }


        .member-content {
            grid-area: content;
            background-color: white;
            height: 500px;
        }

        .btn-save {

            display: flex;
            height: 50px;
            margin-left: auto !important;
            padding-right: 20px;
            gap: 10px;
        }

        .inputEdit {
            border-radius: 8px !important;
            border: 2px solid rgb(183, 226, 235) !important;


        }

        .inputRelative {
            position: relative;
            ;
        }

        .btn-absolute {
            position: absolute;
            right: 185px;
            ;
        }

        .hide {
            display: none;
        }
    </style>


</head>

<body>
    <input type="date">
    <section class="member-section">
        <div class="member-container">
            <div class="member-sidebar">
                <div class="member-card">
                    <img src="image/xx.jpg" class="avatar" alt="女帝圖片">
                    <h3>Empress</h3>
                    <button type="button" class="btn btn-outline-primary" disabled>會員資料</button>
                    <button type="button" class="btn btn-outline-primary" disabled>我的訂單</button>
                    <button type="button" class="btn btn-outline-primary" disabled>我的最愛</button>
                    <button type="button" class="btn btn-outline-primary" disabled>訂單紀錄</button>
                    <button type="button" class="btn btn-outline-primary" disabled>登出</button>
                </div>
            </div>

            <div class="member-ship ">


                <img src="image/card.gif" class="mt-3 " alt="女帝圖片">




            </div>

            <div class="member-content ">
                <form id="personalInformationForm">
                    <div class="personal-information mt-3 mb-3 ps-4">
                        <div class="input-group ">
                            <h2 style="color: blue; font-size:35px;">個人資料</h2>
                            <button id="infEdit" type="button" class=" border-0 "
                                style="  margin-left: auto; padding-right: 20px ; background: transparent;"
                                value="edit">
                                <img src="image/icons8-edit-50.png" alt="logo" width="30px" height="30px">
                                <span style="color: blue;">編輯</span>
                            </button>

                            <div id="infSave" class="btn-save hide">
                                <button class="btn" style="width:  70px;" value="cancel">取消</button>


                                <button class="btn "
                                    style="width:70px; background-color: rgb(56, 56, 241); color:white;"
                                    value="save">儲存</button>
                            </div>

                        </div>
                        <div class="mb-1" style=" font-size:25px;">
                            <span style="letter-spacing: 2.0em; color: green;">姓名</span>
                            <input id="editName" type="text" name="name" th:value="${user.name}" class="border-0"
                                style="background-color: transparent;" disabled>
                        </div>
                        <div class="mb-1" style=" font-size:25px;">
                            <span style="letter-spacing: 2.0em; color: green;">性別</span>
                            <input id="editGender" type="text" name="gender" th:value="${user.gender}" class="border-0"
                                style="background-color: transparent;" disabled>
                        </div>
                        <div class="mb-1" style=" font-size:25px;">
                            <span style="letter-spacing: 2.0em; color: green;">生日</span>
                            <input id="editBirthday" type="text" name="birthday" th:value="${user.birthday}"
                                class="border-0" style="width:280px ;background-color: transparent;" disabled>
                        </div>
                    </div>
                </form>
                <form id="contactInformationForm">
                    <div class="contact-information mb-3 ps-4">
                        <div class="input-group ">
                            <h2 style="color: blue; font-size:35px;">聯絡方式</h2>
                            <button id="conEdit" type="button" class=" border-0 "
                                style="  margin-left: auto; padding-right: 20px ; background: transparent;"
                                value="edit">
                                <img src="image/icons8-edit-50.png" alt="logo" width="30px" height="30px">
                                <span style="color: blue;">編輯</span>
                            </button>

                            <div id="conSave" class="btn-save hide">
                                <button class="btn" style="width:  70px;" value="cancel">取消</button>


                                <button class="btn "
                                    style="width:70px; background-color: rgb(56, 56, 241); color:white;"
                                    value="save">儲存</button>
                            </div>
                        </div>

                        <div class="mb-1" style=" font-size:25px;">
                            <span style=" color: green;">手機號碼</span>
                            <input id="editPhone" type="text" name="phone" th:value="${user.phone}"
                                class="border-0 ms-5" style="background-color: transparent;" disabled>
                        </div>
                        <div class="mb-1" style=" font-size:25px;">
                            <span style=" color: green;">電子信箱</span>
                            <input id="editEmail" type="text" name="email" th:value="${user.email}"
                                class="border-0 ms-5" style="background-color: transparent;" disabled>
                        </div>
                        <div class="mb-1" style=" font-size:25px;">
                            <span style=" color: green;">聯絡地址</span>
                            <input id="editAddress" type="text" name="address" th:value="${user.address}"
                                class="border-0 ms-5" style="background-color: transparent;" disabled>
                        </div>
                    </div>
                </form>
                <form id="securitySettingsForm">
                    <div class="security-settings ">
                        <div class="input-group">
                            <h2 class="ps-4" style="color: blue; font-size:35px;">安全設定</h2>
                            <div id="secSave" class="btn-save hide">
                                <button class="btn" style="width:  70px;" value="cancel">取消</button>


                                <button class="btn "
                                    style="width:70px; background-color: rgb(56, 56, 241); color:white;" value=save>儲存</button>
                            </div>
                        </div>
                        <div id="oldPassword" class="ps-4">
                            <span style="letter-spacing: 2.0em; color: green  ;font-size:25px;">密碼</span>
                            <button  style="letter-spacing: 0.25em; color: blue  ;
                    font-size:25px; background-color: transparent; border: 0;" value="editPassword">修改密碼</button>
                        </div>
                        <div id="newPassword" class="ps-4 hide" style="background-color:white;">
                            <!-- 舊密碼輸入 -->
                            <div class="mb-1 inputRelative" style=" font-size:25px;">
                                <div style="padding-left: 155px;font-size: 18px;">請輸入舊密碼
                                </div>
                                <div class="input-group">
                                    <label style=" color: green;">原始號碼</label>

                                    <input id="editOldPassword" type="password" name="editOldPassword"
                                        class=" ms-5 inputEdit" style="background-color: transparent;">

                                    <button type="button" onclick="togglePassword()" class="border-0 btn-absolute "
                                        style="background:none">
                                        <img id="oldPasswordimg" src="image/icons8-closed-eye-24.png" alt="logo"
                                            width="25px" height="25px">
                                    </button>

                                </div>
                            </div>


                            <!-- 新密碼輸入 -->
                            <div class="mb-1 inputRelative" style=" font-size:25px;">
                                <div style="padding-left: 155px;font-size: 18px;">請輸入新密碼
                                </div>
                                <div class="input-group">
                                    <label style=" color: green;">新建號碼</label>

                                    <input id="editNewPassword" type="password" name="editNewPassword"
                                        class=" ms-5 inputEdit" style="background-color: transparent;">

                                    <button type="button" onclick="togglePassword1()" class="border-0 btn-absolute "
                                        style="background:none">
                                        <img id="newPasswordimg" src="image/icons8-closed-eye-24.png" alt="logo"
                                            width="25px" height="25px">
                                    </button>

                                </div>
                            </div>

                            <!-- 新密碼確認輸入 -->
                            <div class="mb-1 inputRelative" style=" font-size:25px;">
                                <div style="padding-left: 155px;font-size: 18px;">請輸入新密碼確認
                                </div>
                                <div class="input-group">
                                    <label style=" color: green;">密碼確認</label>

                                    <input id="editNewPassword2" type="password" name="editNewPassword2"
                                        class=" ms-5 inputEdit" style="background-color: transparent;">

                                    <button type="button" onclick="togglePassword2()" class="border-0 btn-absolute "
                                        style="background:none">
                                        <img id="newPasswordimg2" src="image/icons8-closed-eye-24.png" alt="logo"
                                            width="25px" height="25px">
                                    </button>

                                </div>
                            </div>

                            <div style="height: 30px;"></div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>


    優惠卷
    客服紀錄
    前往訂車


    <script>
        let clickbutton = null;
        let clickbutton2 = null;
        let clickbutton3 = null;




        function togglePassword() {
            const input = document.getElementById("editOldPassword");
            const img = document.getElementById("oldPasswordimg");
            if (input.type === "password") {
                input.type = "text";//顯示
                img.src = "image/icons8-eye-24.png";
            }
            else {
                input.type = "password";
                img.src = "image/icons8-closed-eye-24.png";
            }

        }
        function togglePassword1() {
            const input = document.getElementById("editNewPassword");
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
        function togglePassword2() {
            const input = document.getElementById("editNewPassword2");
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


        document.querySelectorAll("#personalInformationForm button").forEach(btn => {
            btn.addEventListener("click", function () {
                inputs = document.querySelectorAll("#personalInformationForm input");
                clickbutton = this.value;
                console.log(clickbutton);
                if (clickbutton === "edit") {
                    document.getElementById("infSave").classList.remove("hide");
                    document.getElementById("infEdit").classList.add("hide");
                    document.getElementById("editName").setAttribute("placeholder", "姓名");
                    document.getElementById("editBirthday").setAttribute("placeholder", "生日");
                    document.getElementById("editGender").setAttribute("placeholder", "性別");
                    document.getElementById("editBirthday").type = "date";

                    inputs.forEach(input => {
                        // input.removeAttribute("disabled");
                        input.disabled = false;
                        input.classList.add("inputEdit");

                    })
                }
                else {
                    document.getElementById("infSave").classList.add("hide");
                    document.getElementById("infEdit").classList.remove("hide");
                    document.getElementById("editName").setAttribute("placeholder", "");
                    document.getElementById("editBirthday").setAttribute("placeholder", "");
                    document.getElementById("editGender").setAttribute("placeholder", "");
                    document.getElementById("editBirthday").type = "text";
                    inputs.forEach(input => {
                        input.disabled = true;
                        input.classList.remove("inputEdit");
                    })
                }
            });
        });

        document.getElementById("personalInformationForm").addEventListener("submit", function (e) {

            e.preventDefault();

            if (clickbutton === "save") {
                inputs = document.querySelectorAll("#personalInformationForm input");
                inputs.forEach(input => {
                    input.disabled = false;

                })

                const form = document.getElementById("personalInformationForm");
                const formData = new FormData(form);
                // for (let [key, value] of formData.entries()) {
                //     console.log(`${key} = ${value}`);

                // }

                fetch("/infSave", {
                    method: "post",
                    body: formData
                })

                inputs.forEach(input => {
                    input.disabled = false;

                })

            }

        });

        document.querySelectorAll("#contactInformationForm button").forEach(btn => {
            btn.addEventListener("click", function () {
                inputs = document.querySelectorAll("#contactInformationForm input");
                clickbutton2 = this.value;

                console.log(clickbutton2);
                if (clickbutton2 === "edit") {

                    document.getElementById("conSave").classList.remove("hide");
                    document.getElementById("conEdit").classList.add("hide");
                    document.getElementById("editPhone").setAttribute("placeholder", "手機");
                    document.getElementById("editEmail").setAttribute("placeholder", "信箱");
                    document.getElementById("editAddress").setAttribute("placeholder", "地址");


                    inputs.forEach(input => {
                        // input.removeAttribute("disabled");

                        input.disabled = false;
                        input.classList.add("inputEdit");

                    })
                }
                else {
                    document.getElementById("conSave").classList.add("hide");
                    document.getElementById("conEdit").classList.remove("hide");
                    document.getElementById("editPhone").setAttribute("placeholder", "");
                    document.getElementById("editEmail").setAttribute("placeholder", "");
                    document.getElementById("editAddress").setAttribute("placeholder", "");

                    inputs.forEach(input => {
                        input.disabled = true;
                        input.classList.remove("inputEdit");
                    })
                }
            });
        });

        document.getElementById("contactInformationForm").addEventListener("submit", function (e) {

            e.preventDefault();

            if (clickbutton2 === "save") {
                inputs = document.querySelectorAll("#contactInformationForm input");
                inputs.forEach(input => {
                    input.disabled = false;

                })

                const form = document.getElementById("contactInformationForm");
                const formData = new FormData(form);
                for (let [key, value] of formData.entries()) {
                    console.log(`${key} = ${value}`);

                }

                fetch("/conSave", {
                    method: "post",
                    body: formData
                })

                inputs.forEach(input => {
                    input.disabled = false;

                })

            }

        });

        document.getElementById("oldPassword").addEventListener("click", function (e) {
            document.getElementById("oldPassword").classList.add("hide");
            document.getElementById("newPassword").classList.remove("hide");
            document.getElementById("secSave").classList.remove("hide");

        })

       


        document.querySelectorAll("#securitySettingsForm button").forEach(btn => {
            btn.addEventListener("click", function () {


                clickbutton3=this.value;
                console.log(clickbutton3);
                if (clickbutton3 === "cancel" || clickbutton3 ==="save") {
                    
                    document.getElementById("oldPassword").classList.remove("hide");
                    document.getElementById("newPassword").classList.add("hide");
                    document.getElementById("secSave").classList.add("hide");
                }
                else if(clickbutton3==="editPassword"){
                    
                    document.getElementById("oldPassword").classList.remove("hide");
                    document.getElementById("newPassword").classList.add("hide");
                    document.getElementById("secSave").classList.add("hide");
                }
            });
        });

        document.getElementById("securitySettingsForm").addEventListener("submit", function (e) {

            e.preventDefault();
            console.log("哈哈哈1230");
            if (clickbutton3 === "save") {
                
                console.log("哈哈sdsds哈1230");
                const form = document.getElementById("securitySettingsForm");
                const formData = new FormData(form);
                for (let [key, value] of formData.entries()) {
                    console.log(`${key} = ${value}`);

                }

                fetch("/secSave", {
                    method: "post",
                    body: formData
                })
                .then(response => response.text())
                .then(data => {
                    console.log(data);
                    
                })

            
            }

        });

    </script>
</body>

</html>