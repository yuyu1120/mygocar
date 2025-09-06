<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>MYGOCAR後台 - 交易訂單管理</title>

    <!-- AdminLTE & Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<div class="wrapper">

    <!-- 側邊欄 -->
    <aside class="main-sidebar sidebar-dark-primary elevation-4">
        <!-- Logo -->
        <a href="#" class="brand-link">
            <i class="fas fa-car brand-image img-circle elevation-3" style="opacity: .8"></i>
            <span class="brand-text font-weight-light">MYGOCAR後台</span>
        </a>

        <!-- Sidebar -->
        <div class="sidebar">
            <!-- 使用者面板 -->
            <div class="user-panel mt-3 pb-3 mb-3 d-flex">
                <div class="info">
                    <a href="#" class="d-block">您好，Admin</a>
                </div>
            </div>

            <!-- 選單 -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" role="menu">
                    <li class="nav-item">
                        <a href="/admin/dashboard" class="nav-link"><i class="nav-icon fas fa-tachometer-alt"></i><p>儀表板</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/member" class="nav-link"><i class="nav-icon fas fa-users"></i><p>會員管理</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/vehicle" class="nav-link"><i class="nav-icon fas fa-car"></i><p>車輛管理</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/order-manage" class="nav-link"><i class="nav-icon fas fa-receipt"></i><p>訂單管理</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/transaction-manage" class="nav-link active"><i class="nav-icon fas fa-credit-card"></i><p>交易管理</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/promotion" class="nav-link"><i class="nav-icon fas fa-tags"></i><p>優惠活動</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/logout" class="nav-link"><i class="nav-icon fas fa-sign-out-alt"></i><p>登出</p></a>
                    </li>
                </ul>
            </nav>
        </div>
    </aside>

    <!-- 右側內容區 -->
    <div class="content-wrapper">
        <!-- 頁面標題 -->
        <section class="content-header">
            <div class="container-fluid">
                <h1>交易管理</h1>
                <p>此頁可查看所有交易紀錄。</p>
            </div>
        </section>

        <!-- 主內容 -->
        <section class="content">
            <div class="container-fluid">
                <!-- 你可以在這裡塞表格或其他內容 -->
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">所有交易紀錄</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-hover">
    <thead>
    <tr>
        <th>時間戳</th>
        <th>交易ID</th>
        <th>訂單ID</th>
        <th>金額</th>
        <th>狀態</th>
        <th>付款方式</th>
        <th>操作</th> <!-- 新增操作欄 -->
    </tr>
    </thead>
    <tbody>

        <c:forEach items="${orders}" var="order">
            <tr>
                <td>${order.createAt}</td>
                <td>${order.linepayTransactionId}</td>
                <td>${order.orderId}</td>
                <td>${order.totalPrice}</td>
                <td>${order.status}</td>
                <td>linepay</td>
                <td>
                    <a href="editTransaction.jsp?orderId=${order.orderId}" class="btn btn-sm btn-primary">
                        <i class="fas fa-edit"></i> 編輯
                    </a>
                    <button onclick="confirmDelete(${order.orderId})" class="btn btn-sm btn-danger">
                    <i class="fas fa-trash"></i> 刪除
                    </button>
                </td>
            </tr>
        </c:forEach>

    </tbody>
</table>
                    </div>
                </div>
            </div>
        </section>
    </div>

</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>
</body>
</html>
