<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>租車後台 - 儀表板</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- AdminLTE & Bootstrap -->
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
                            <div class="inner"><h3>128</h3><p>會員總數</p></div>
                            <div class="icon"><i class="fas fa-users"></i></div>
                            <a href="/admin/member" class="small-box-footer">更多資訊 <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-success">
                            <div class="inner"><h3>54</h3><p>可租車輛</p></div>
                            <div class="icon"><i class="fas fa-car-side"></i></div>
                            <a href="/admin/vehicle" class="small-box-footer">管理車輛 <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-warning">
                            <div class="inner"><h3>37</h3><p>進行中訂單</p></div>
                            <div class="icon"><i class="fas fa-clipboard-list"></i></div>
                            <a href="/admin/order-manage" class="small-box-footer">查看訂單 <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                    <div class="col-lg-3 col-6">
                        <div class="small-box bg-danger">
                            <div class="inner"><h3>NT$128,000</h3><p>本月營收</p></div>
                            <div class="icon"><i class="fas fa-dollar-sign"></i></div>
                            <a href="/admin/transaction-manage" class="small-box-footer">查看交易 <i class="fas fa-arrow-circle-right"></i></a>
                        </div>
                    </div>
                </div>

                <!-- 加入兩個長條圖 -->
                <div class="row chart-container">
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header"><h3 class="card-title">📈 每月訂單增幅</h3></div>
                            <div class="card-body">
                                <canvas id="orderChart"></canvas>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card">
                            <div class="card-header"><h3 class="card-title">👥 每月會員增幅</h3></div>
                            <div class="card-body">
                                <canvas id="memberChart"></canvas>
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

<script>
    // 模擬資料：你可以用 JSTL 從後端塞入
    const labels = ['1月', '2月', '3月', '4月', '5月', '6月', '7月'];
    
    const orderData = [50, 65, 70, 90, 100, 120, 150];
    const memberData = [10, 20, 25, 30, 40, 45, 60];

    const orderChart = new Chart(document.getElementById('orderChart'), {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '訂單數',
                data: orderData,
                backgroundColor: '#007bff'
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { display: false } },
            scales: {
                y: { beginAtZero: true }
            }
        }
    });

    const memberChart = new Chart(document.getElementById('memberChart'), {
        type: 'bar',
        data: {
            labels: labels,
            datasets: [{
                label: '會員數',
                data: memberData,
                backgroundColor: '#28a745'
            }]
        },
        options: {
            responsive: true,
            plugins: { legend: { display: false } },
            scales: {
                y: { beginAtZero: true }
            }
        }
    });
</script>

</body>
</html>
