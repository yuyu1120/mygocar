<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>付款成功</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <!-- 導航列 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-success">
        <div class="container">
            <a class="navbar-brand" href="/index">
                <i class="fas fa-store"></i> MYCAR
            </a>
            <div class="navbar-nav ms-auto">
                <%
                    String loggedInUser = (String) session.getAttribute("username");
                    if (loggedInUser != null) {
                %>
                    <span class="navbar-text me-3">
                        <i class="fas fa-user"></i> 歡迎，<%= loggedInUser %>
                    </span>
                    <a class="nav-link" href="/search">
                        <i class="fas fa-shopping-bag"></i> 回到搜尋租車
                    </a>
                    <a class="nav-link" href="/logout">
                        <i class="fas fa-sign-out-alt"></i> 登出
                    </a>
                <% } %>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <!-- 成功訊息卡片 -->
                <div class="card border-success">
                    <div class="card-header bg-success text-white text-center">
                        <h3 class="mb-0">
                            <i class="fas fa-check-circle fa-2x mb-3"></i><br>
                            付款成功！
                        </h3>
                    </div>
                    <div class="card-body text-center p-5">

                        <div class="alert alert-success mb-4">
                            <h5 class="alert-heading">
                                <i class="fas fa-thumbs-up"></i> 感謝您的購買！
                            </h5>
                            <p class="mb-0">您的訂單已成功完成付款，我們將盡快為您處理。</p>
                        </div>

                        <!-- 訂單資訊 -->
                        <div class="row mb-4">
                            <div class="col-md-6">
                                <div class="bg-light p-3 rounded">
                                    <h6 class="text-muted mb-2">
                                        <i class="fas fa-receipt"></i> 訂單編號
                                    </h6>
                                    <strong class="text-primary">
                                        <%= request.getAttribute("orderId") != null ?
                                            request.getAttribute("orderId") : "N/A" %>
                                    </strong>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="bg-light p-3 rounded">
                                    <h6 class="text-muted mb-2">
                                        <i class="fas fa-credit-card"></i> 交易編號
                                    </h6>
                                    <strong class="text-success">
                                        <%= request.getAttribute("transactionId") != null ?
                                            request.getAttribute("transactionId") : "N/A" %>
                                    </strong>
                                </div>
                            </div>
                        </div>

                        <!-- 付款時間 -->
                        <div class="mb-4">
                            <div class="bg-light p-3 rounded">
                                <h6 class="text-muted mb-2">
                                    <i class="fas fa-clock"></i> 付款時間
                                </h6>
                                <strong><%= new java.util.Date() %></strong>
                            </div>
                        </div>

                        <!-- 操作按鈕 -->
                        <div class="d-grid gap-2 d-md-flex justify-content-center">
                            <a href="/search" class="btn btn-primary btn-lg">
                                <i class="fas fa-shopping-bag"></i> 回到搜尋租車
                            </a>
                            <button class="btn btn-outline-secondary btn-lg" onclick="window.print()">
                                <i class="fas fa-print"></i> 列印收據
                            </button>
                        </div>

                    </div>
                </div>

                

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 自動清除購物車圖示（如果有的話） -->
    <script>
        // 通知其他頁面購物車已清空
        if (typeof updateCartCount === 'function') {
            updateCartCount();
        }

        // 5秒後自動隱藏成功訊息
        setTimeout(function() {
            const alert = document.querySelector('.alert-success');
            if (alert) {
                alert.style.transition = 'opacity 0.5s';
                alert.style.opacity = '0';
            }
        }, 5000);
    </script>
</body>
</html>
