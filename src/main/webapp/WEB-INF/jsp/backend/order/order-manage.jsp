<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>MYGOCAR後台 - 租車訂單管理</title>

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
                        <a href="/admin/vehicle-manage" class="nav-link"><i class="nav-icon fas fa-car"></i><p>車輛管理</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/order-manage" class="nav-link active"><i class="nav-icon fas fa-receipt"></i><p>訂單管理</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/transaction-manage" class="nav-link"><i class="nav-icon fas fa-credit-card"></i><p>交易管理</p></a>
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
                <h1>訂單管理</h1>
                <p>此頁可查看所有訂單紀錄。</p>
            </div>
        </section>

        <!-- 主內容 -->
        <section class="content">
            <div class="container-fluid">
                <!-- 你可以在這裡塞表格或其他內容 -->
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">所有訂單紀錄</h3>
                    </div>
                    <div class="card-body">
                        <table class="table table-bordered table-hover">
                            <thead>
                            <tr>
                                <th>時間戳</th>
                                <th>訂單ID</th>
                                <th>金額</th>
                                <th>狀態</th>
                                <th>車輛編號</th>
                                <th>取車時間</th>
                                <th>還車時間</th>
                                <th>取車地點</th>
                                <th>還車地點</th>
                                <th>操作</th> <!-- 新增操作欄 -->
                            </tr>
                            </thead>
                                <tbody>
                                    <c:forEach items="${orders}" var="order">
                                        <tr data-id="${order.orderId}">
                                            <td class="view-mode">${order.createAt}</td>
                                            <td class="view-mode">${order.orderId}</td>
                                            <td class="view-mode editable" data-field="totalPrice">${order.totalPrice}</td>
                                            <td class="view-mode editable" data-field="status">${order.status}</td>
                                            <td class="view-mode">${order.vehicleId}</td>
                                            <td class="view-mode editable" data-field="borrowDatetime">${order.borrowDatetime}</td>
                                            <td class="view-mode editable" data-field="returnDatetime">${order.returnDatetime}</td>
                                            <td class="view-mode editable" data-field="borrowLocation">${order.borrowLocation}</td>
                                            <td class="view-mode editable" data-field="returnLocation">${order.returnLocation}</td>
                                            <td>
                                                <%-- <button class="btn btn-sm btn-primary edit-btn">
                                                    <i class="fas fa-edit"></i> 編輯
                                                </button>
                                                <button class="btn btn-sm btn-success save-btn d-none">
                                                    <i class="fas fa-save"></i> 儲存
                                                </button>
                                                <button class="btn btn-sm btn-secondary cancel-btn d-none">
                                                    <i class="fas fa-times"></i> 取消
                                                </button> --%>
                                                <button class="btn btn-sm btn-danger delete-btn">
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

<script>
document.addEventListener('DOMContentLoaded', function() {

    // 編輯按鈕
    document.querySelectorAll('.edit-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const row = this.closest('tr');
            row.querySelectorAll('.editable').forEach(td => {
                const text = td.textContent.trim();
                td.innerHTML = `<input type="text" class="form-control form-control-sm" value="${text}">`;
            });
            row.querySelector('.edit-btn').classList.add('d-none');
            row.querySelector('.delete-btn').classList.add('d-none');
            row.querySelector('.save-btn').classList.remove('d-none');
            row.querySelector('.cancel-btn').classList.remove('d-none');
        });
    });

    // 取消按鈕
    document.querySelectorAll('.cancel-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const row = this.closest('tr');
            // 重新載入頁面，恢復原資料 (也可以自己存舊值還原)
            location.reload();
        });
    });

    // 儲存按鈕
    document.querySelectorAll('.save-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const row = this.closest('tr');
            const orderId = row.dataset.id;

            // 收集欄位值
            let payload = { orderId: orderId };
            row.querySelectorAll('.editable').forEach(td => {
                const field = td.dataset.field;
                const value = td.querySelector('input').value;
                payload[field] = value;
            });

            // 發送更新請求
            fetch(`/admin/updateTransaction`, {
                method: 'POST',
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload)
            })
            .then(resp => {
                if (resp.ok) {
                    return resp.json();
                } else {
                    throw new Error("更新失敗");
                }
            })
            .then(data => {
                // 更新成功 → 回復成文字模式
                row.querySelectorAll('.editable').forEach(td => {
                    const field = td.dataset.field;
                    td.textContent = payload[field];
                });
                row.querySelector('.edit-btn').classList.remove('d-none');
                row.querySelector('.delete-btn').classList.remove('d-none');
                row.querySelector('.save-btn').classList.add('d-none');
                row.querySelector('.cancel-btn').classList.add('d-none');
            })
            .catch(err => {
                alert(err);
                console.error(err);
            });
        });
    });

    // 刪除按鈕 (同之前)
    document.querySelectorAll('.delete-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const row = this.closest('tr');
            const orderId = row.dataset.id;
            console.log(row);
            console.log(orderId);
            if(confirm(`確定刪除訂單 \${orderId}？`)) {
                fetch(`/admin/deleteTransaction/\${orderId}`, { method: 'DELETE' })
                .then(resp => {
                    if (resp.ok) {
                        row.remove();
                    } else {
                        alert("刪除失敗！");
                    }
                });
            }
        });
    });

});
</script>



</body>
</html>
