<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>租車後台 - 儀表板</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- AdminLTE -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">

    <!-- Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <style>
        .chart-container {
            margin-top: 30px;
        }
    </style>
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
                    <a href="#" class="d-block">您好，${adminUser}</a>
                </div>

            </div>

            <!-- 選單 -->
            <nav class="mt-2">
                <ul class="nav nav-pills nav-sidebar flex-column" role="menu">
                    <li class="nav-item">
                        <a href="/admin/dashboard" class="nav-link active"><i class="nav-icon fas fa-tachometer-alt"></i><p>儀表板</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/member" class="nav-link"><i class="nav-icon fas fa-users"></i><p>會員管理</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/vehicle-manage" class="nav-link"><i class="nav-icon fas fa-car"></i><p>車輛管理</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/order-manage" class="nav-link"><i class="nav-icon fas fa-receipt"></i><p>訂單管理</p></a>
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
        <section class="content-header">
            <div class="container-fluid">
                <h1>儀表板</h1>
                <p>快速總覽系統狀況與數據</p>
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <!-- 原本四個卡片 -->
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-info">
                            <div class="inner"><h3>${numMembers}</h3><p>會員總數</p></div>
                            <div class="icon"><i class="fas fa-users"></i></div>
                            <a href="/admin/member" class="small-box-footer">更多資訊 <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-success">
                            <div class="inner"><h3>${numVehicles}</h3><p>可租車輛</p></div>
                            <div class="icon"><i class="fas fa-car-side"></i></div>
                            <a href="/admin/vehicle-manage" class="small-box-footer">管理車輛 <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-warning">
                            <div class="inner"><h3>${numOrders}</h3><p>近7天訂單</p></div>
                            <div class="icon"><i class="fas fa-clipboard-list"></i></div>
                            <a href="/admin/order-manage" class="small-box-footer">查看訂單 <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3>
                                    <fmt:formatNumber value="${totalAmount}" type="currency" pattern="NT$ #,##0" />
                                </h3>
                            <p>近7天營收</p></div>
                            <div class="icon"><i class="fas fa-dollar-sign"></i></div>
                            <a href="/admin/order-manage" class="small-box-footer">查看訂單 <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                </div>

                
                <div class="row chart-container">
                    <!-- 左邊：近7天訂單表格 -->
                    <div class="col-md-7">
                        <div class="card card-success">
                            <div class="card-header border-transparent">
                                <h3 class="card-title">近7天訂單</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <div class="table-responsive">
                                    <table class="table m-0">
                                        <thead>
                                            <tr>
                                                <th>訂單建立時間</th>
                                                <th>訂單ID</th>
                                                <th>車輛</th>
                                                <th>狀態</th>
                                                <th>金額</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="o" items="${orders}">
                                                <tr>
                                                    <td><fmt:formatDate value="${o.createAt}" pattern="yyyy/MM/dd HH:mm:ss" timeZone="Asia/Taipei" /></td>
                                                    <td>${o.orderId}</td>
                                                    <td>${o.vehicleId}</td>
                                                    <td><span class="badge badge-success">${o.status}</span></td>
                                                    <td>
                                                        <fmt:formatNumber value="${o.totalPrice}" type="currency" pattern="NT$ #,##0" />
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="card-footer clearfix">
                                <a href="order-manage" class="btn btn-sm btn-secondary float-right">查看所有訂單</a>
                            </div>
                        </div>
                    </div>

                    <!-- 右邊：訂單地區分布圖 -->
                    <div class="col-md-5">
                        <div class="card card-danger">
                            <div class="card-header">
                                <h3 class="card-title">訂單地區分布圖</h3>
                                <div class="card-tools">
                                    <button type="button" class="btn btn-tool" data-card-widget="collapse">
                                        <i class="fas fa-minus"></i>
                                    </button>
                                </div>
                            </div>
                            <div class="card-body">
                                <canvas id="donutChart" style="min-height: 250px; height: 250px; max-height: 250px; max-width: 100%; display: block;"></canvas>
                            </div>
                        </div>
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

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    document.addEventListener("DOMContentLoaded", function() {
        // 從後端傳來的 orderStats
        const stats = JSON.parse('${orderStatsJson}'); 

        // 取出 labels 和 data
        const labels = stats.map(s => s.location);
        const data = stats.map(s => s.count);

        const ctx = document.getElementById('donutChart').getContext('2d');
        new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: labels,
                datasets: [{
                    data: data,
                    backgroundColor: [
                        '#f56954', '#00a65a', '#f39c12',
                        '#00c0ef', '#3c8dbc', '#d2d6de'
                    ]
                }]
            },
            options: {
                maintainAspectRatio: false,
                responsive: true
            }
        });
    });
</script>



</body>
</html>
