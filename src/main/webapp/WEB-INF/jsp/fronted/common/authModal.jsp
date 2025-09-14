<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<script src="/js/app.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q" crossorigin="anonymous">
</script>

<section id="auth-section" class="modal-background" style="display:none;">
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
      <div id="login-content" class="auth-sections   ">
        <div class="text-center mb-5 mt-4">
          <!-- <img src="your-logo.png" alt="logo" width="100"> -->
          <h5>MYGOCAR</h5>
        </div>
        <form id="loginForm">
          <!-- 帳號輸入 -->
          <div class="mx-auto mt-2 mb-3 w-75">
            <div class="input-group">
              <label for="account">
                <img src="/image/icons8-male-user-60.png" alt="logo" width="50px">
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
                <img src="/image/icons8-password-50.png" alt="logo" width="50px">
              </label>
              <input id="password" type="password"
                class="form-control border-0 border-bottom border-dark border-2 rounded-0 " name="password"
                placeholder="密碼">
              <button type="button" onclick="togglePassword1()"
                class="border-0 border-bottom border-dark border-2" style="background:none">
                <img id="passwordimg" src="/image/icons8-closed-eye-24.png" alt="logo" width="25px" height="25px">
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
          <img src="/image/icons8-fb-48.png" alt="fb" width="40px" height="40px">
          <img src="/image/icons8-google-48.png" alt="google" width="40px" height="40px">
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
                <img src="/image/icons8-male-user-60.png" alt="logo" width="50px">
              </label>
              <input type="text" id="current-account" class=" rounded border p-1" style="width: 300px;"
                name="account" placeholder="請輸入帳號">
            </div>
          </div>

          <div class="mx-auto mb-3 w-75" style="padding-left:10px;">
            <div class="input-group">
              <label for="email">
                <img src="/image/icons8-email-48.png" alt="logo" width="50px">
              </label>
              <input type="text" id="current-email" class=" rounded border p-1" style="width: 300px;" name="email"
                placeholder="請輸入信箱">
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
      <div id="newPassword-content" class="auth-sections hide">
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
                <img src="/image/icons8-password-50.png" alt="logo" width="50px">
              </label>
              <input type="password" id="newPassword" class=" rounded border p-1" style="width: 300px;"
                name="password" placeholder="請輸入新密碼">
              <button type="button" onclick="togglePassword4()" class="border-0 btn-absolute "
                style="background:none; left: 305px;">
                <img id="newPasswordimg" src="/image/icons8-closed-eye-24.png" alt="logo" width="25px"
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
                <img id="newPasswordimg2" src="/image/icons8-closed-eye-24.png" alt="logo" width="25px"
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
                <img src="/image/icons8-male-user-60.png" alt="logo" width="20px" height="20px">
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
                <img src="/image/icons8-phone-48.png" alt="logo" width="20px" height="20px">
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
                <img src="/image/icons8-email-48.png" alt="logo" width="20px" height="20px">
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
                <img src="/image/icons8-password-50.png" alt="logo" width="20px" height="20px">
              </label>
              <input type="password" class=" rounded border p-1" style="height: 25px;  width: 350px;"
                id="signPassword" name="password" placeholder="  密碼">

              <button type="button" onclick="togglePassword2()" class="border-0 btn-absolute1 "
                style="background:none">
                <img id="signPasswordImg" src="/image/icons8-closed-eye-24.png" alt="logo" width="20px"
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
                <img id="signPasswordImg2" src="/image/icons8-closed-eye-24.png" alt="logo" width="20px"
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


<script src="/js/common/authMember.js"></script>

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