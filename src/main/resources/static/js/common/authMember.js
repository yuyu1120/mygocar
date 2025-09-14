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

//監聽按下登入的事件
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
            alert("登入成功");
            location.reload();
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
    }else {
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