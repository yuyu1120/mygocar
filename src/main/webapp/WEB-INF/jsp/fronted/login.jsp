<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.mygocar.utils.DBUtil" %>

<%
// page範圍的全域變數
String message = "";
String messageType = "";
String loggedInUser = (String) session.getAttribute("username");

if("POST".equals(request.getMethod())){
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    //判斷有無登入成功
    Boolean loginSuccess = false;
    if(username!=null && password!=null){
    
        //嘗試連線
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        try{
            // 取得資料庫連線
            conn = DBUtil.getConnection();

            // 使用 MySQL SHA2 函數驗證密碼
            String sql = "SELECT id, username, email FROM member WHERE username = ? AND password = SHA2(?, 256)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username.trim());
            pstmt.setString(2, password);

            rs = pstmt.executeQuery();

            //組合資料集
            if (rs.next()) {
                // 登入成功
                session.setAttribute("userId", rs.getInt("id"));
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("userEmail", rs.getString("email"));
                session.setAttribute("loginTime", new java.util.Date().toString());

                loggedInUser = rs.getString("username");
                message = "登入成功！歡迎 " + loggedInUser;
                messageType = "success";
            } else {
                // 登入失敗
                message = "帳號或密碼錯誤！";
                messageType = "danger";
            }

        }catch(SQLException e){
            message = "資料庫連線錯誤：" + e.getMessage();
                            messageType = "danger";
                            e.printStackTrace();
        }finally{
            // 關閉資源
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
                
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }else {
        message = "帳號和密碼不可為空值！";
        messageType = "warning";
    }
}


// 處理登出
if ("logout".equals(request.getParameter("action"))) {
    session.invalidate();
    loggedInUser = null;
    message = "已成功登出！";
    messageType = "info";
    // response.sendRedirect("loginDB.jsp");
}

%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
    crossorigin="anonymous">
    <title>登入頁面</title>
</head>
<body>
    

    <div class="container mt-5">
        <div class = "row">
            <div class="col-md-6">
                <div class="card">
                    <div class = "card-header">登入表單</div>
                
                    <div class = "card-body">

                    <!-- 顯示訊息 -->
                    <%  if(!message.isEmpty()){ %>
                        <div class="alert alert-<%= messageType %> alert-dismissible fade show" role="alert">
                        <%= message %>
                        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                        </div>
                    <% } %>

                        <form method="post">
                            <div class="mb-3">
                                <label for="exampleInputEmail1" class="form-label">帳號</label>
                                <input type="text" class="form-control" id="exampleInputEmail1" name="username">
                            </div>
                            <div class="mb-3">
                                <label for="exampleInputPassword1" class="form-label">密碼</label>
                                <input type="password" class="form-control" id="exampleInputPassword1" name="password">
                            </div>
                            <button type="submit" class="btn btn-primary">Submit</button>
                        </form>
                        <div class="mt-3">
                            測試帳號：emmatest1 <br>
                            測試密碼：testpwd
                        </div>
                    </div>
                </div>
            </div>
            

            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">session的資訊</div>

                    <div class="card-body">
                        <% if(loggedInUser!=null){ %>

                            <h5>歡迎回來，<%= loggedInUser %></h5>
                            <p>登入時間： <%= session.getAttribute("loginTime") %></p>
                            <p>user_id： <%= session.getAttribute("userId") %></p>
                            <p>userEmail： <%= session.getAttribute("userEmail") %></p>
                            <p>sessionID： <%= session.getId() %></p>
                            <p><a href="login.jsp?action=logout" class="btn btn-warning">登出</a></p>

                        <% }else{ %>
                            <p>sessionID： <%= session.getId() %></p>
                        <% } %>
                    </div>
                
                </div>
            </div>
        
        </div>
    </div>

    <script>
    if (window.location.search.includes("action=logout")) {
        alert("您已成功登出，將為您返回首頁！");
        history.replaceState(null, "", window.location.pathname);
        setTimeout(() => {
        window.location.href = "login.jsp";   //跳轉頁面
        }, 2000);
    }
    </script>

    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
                crossorigin="anonymous">
    </script>
</body>
</html>