<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>付款失敗</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <!-- 導航列 -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-danger">
        <div class="container">
            <a class="navbar-brand" href="${pageContext.request.contextPath}/search/rental_search.jsp">
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
                    <a class="nav-link" href="${pageContext.request.contextPath}/cart">
                        <i class="fas fa-shopping-cart"></i> 返回結帳頁面
                    </a>
                    <a class="nav-link" href="${pageContext.request.contextPath}/login.jsp?action=logout">
                        <i class="fas fa-sign-out-alt"></i> 登出
                    </a>
                <% } %>
            </div>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">

                <!-- 失敗訊息卡片 -->
                <div class="card border-danger">
                    <div class="card-header bg-danger text-white text-center">
                        <h3 class="mb-0">
                            <i class="fas fa-times-circle fa-2x mb-3"></i><br>
                            付款失敗
                        </h3>
                    </div>
                    <div class="card-body text-center p-5">

                        <div class="alert alert-danger mb-4">
                            <h5 class="alert-heading">
                                <i class="fas fa-exclamation-triangle"></i> 付款未完成
                            </h5>
                            <p class="mb-0">
                                <%
                                    String errorMessage = (String) request.getAttribute("errorMessage");
                                    String message = (String) request.getAttribute("message");

                                    if (errorMessage != null) {
                                        out.print(errorMessage);
                                    } else if (message != null) {
                                        out.print(message);
                                    } else {
                                        out.print("付款過程中發生問題，請稍後再試或選擇其他付款方式。");
                                    }
                                %>
                            </p>
                        </div>

                        <!-- 可能的原因 -->
                        <div class="mb-4">
                            <h6 class="text-muted mb-3">
                                <i class="fas fa-question-circle"></i> 可能的原因：
                            </h6>
                            <div class="row text-start">
                                <div class="col-md-6">
                                    <ul class="list-unstyled">
                                        <li class="mb-2">
                                            <i class="fas fa-chevron-right text-muted me-2"></i>
                                            取消了付款操作
                                        </li>
                                        <li class="mb-2">
                                            <i class="fas fa-chevron-right text-muted me-2"></i>
                                            網路連線不穩定
                                        </li>
                                    </ul>
                                </div>
                                <div class="col-md-6">
                                    <ul class="list-unstyled">
                                        <li class="mb-2">
                                            <i class="fas fa-chevron-right text-muted me-2"></i>
                                            Line Pay 服務暫時無法使用
                                        </li>
                                        <li class="mb-2">
                                            <i class="fas fa-chevron-right text-muted me-2"></i>
                                            系統處理錯誤
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!-- 操作按鈕 -->
                        <div class="d-grid gap-2 d-md-flex justify-content-center">
                            <a href="cart" class="btn btn-primary btn-lg">
                                <i class="fas fa-arrow-left"></i> 返回購物車
                            </a>
                            <a href="prod.jsp" class="btn btn-outline-secondary btn-lg">
                                <i class="fas fa-shopping-bag"></i> 繼續購物
                            </a>
                        </div>

                    </div>
                </div>

                <!-- 幫助資訊 -->
                <div class="card mt-4">
                    <div class="card-header">
                        <h6 class="mb-0"><i class="fas fa-lightbulb"></i> 建議解決方案</h6>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <h6><i class="fas fa-redo text-primary"></i> 重新嘗試</h6>
                                <p class="text-muted small">
                                    返回購物車重新進行結帳，確保網路連線穩定。
                                </p>
                            </div>
                            <div class="col-md-6">
                                <h6><i class="fas fa-headset text-info"></i> 聯繫客服</h6>
                                <p class="text-muted small">
                                    如問題持續發生，請聯繫客服人員協助處理。
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
