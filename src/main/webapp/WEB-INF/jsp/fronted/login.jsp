<%@ page contentType="text/html; charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
// page範圍的全域變數
String message = "";
String messageType = "";
String loggedInUser = (String) session.getAttribute("username");

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

                        <form method="post" action="/login">
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
                            測試帳號：emma1234 <br>
                            測試密碼：Qq1234567
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
                            <p><a href="/logout" class="btn btn-warning">登出</a></p>

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