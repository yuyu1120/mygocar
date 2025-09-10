<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>MYGOCAR後台 - 租車租借車輛管理</title>

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
                        <a href="/admin/vehicle-manage" class="nav-link active"><i class="nav-icon fas fa-car"></i><p>車輛管理</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/order-manage" class="nav-link"><i class="nav-icon fas fa-receipt"></i><p>訂單管理</p></a>
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
    
    <!-- 主內容 -->
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <h1>車輛管理</h1>
                <button class="btn btn-primary" data-toggle="modal" data-target="#addVehicleModal">
                    <i class="fas fa-plus"></i> 新增車輛
                </button>
                <input type="text" id="searchInput" class="form-control mt-2" placeholder="搜尋車輛 (名稱/品牌/編號)">
            </div>
        </section>

        <section class="content">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header"><h3 class="card-title">所有車輛</h3></div>
                    <div class="card-body">
                        <table class="table table-bordered table-hover" id="vehicleTable">
                            <thead>
                            <tr>
                                <th>車輛編號</th>
                                <th>名稱</th>
                                <th>品牌</th>
                                <th>地點</th>
                                <th>出廠年份</th>
                                <th>顏色</th>
                                <th>價格(月租)</th>
                                <th>價格(日租)</th>
                                <th>價格(公里)</th>
                                <th>數量</th>
                                <th>描述</th>
                                <th>圖片</th>
                                <th>操作</th>
                            </tr>

                            </thead>
                            <tbody>
                                <c:forEach items="${vehicles}" var="v">
                                    <tr data-id="${v.vehicleId}">
                                        <td>${v.vehicleId}</td>
                                        <td class="editable" data-field="vehicleName">${v.vehicleName}</td>
                                        <td class="editable" data-field="vehicleBrand">${v.vehicleBrand}</td>
                                        <td class="editable" data-field="vehicleLocation">${v.vehicleLocation}</td>
                                        <td class="editable" data-field="vehicleYear">${v.vehicleYear}</td>
                                        <td class="editable" data-field="vehicleColor">${v.vehicleColor}</td>
                                        <td class="editable" data-field="monthPrice">${v.monthPrice}</td>
                                        <td class="editable" data-field="dayPrice">${v.dayPrice}</td>
                                        <td class="editable" data-field="hourPrice">${v.hourPrice}</td>
                                        <td class="editable" data-field="quantity">${v.quantity}</td>
                                        <td class="editable" data-field="vehicleDescription">${v.vehicleDescription}</td>
                                        <td>
                                            <img src="/img/cars/${v.vehicleImage}" alt="圖片" style="width:80px; height:auto;">
                                            <%-- <br>
                                            <button class="btn btn-sm btn-info change-photo-btn">更換圖片</button> --%>
                                        </td>
                                        <td>
                                            <button class="btn btn-sm btn-primary edit-btn"><i class="fas fa-edit"></i> 編輯</button>
                                            <button class="btn btn-sm btn-success save-btn d-none"><i class="fas fa-save"></i> 儲存</button>
                                            <button class="btn btn-sm btn-secondary cancel-btn d-none"><i class="fas fa-times"></i> 取消</button>
                                            <button class="btn btn-sm btn-danger delete-btn"><i class="fas fa-trash"></i> 刪除</button>
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

<!-- 新增車輛 Modal -->
<div class="modal fade" id="addVehicleModal" tabindex="-1">
  <div class="modal-dialog">
    <form id="addVehicleForm" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">新增車輛</h5>
        <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
      </div>
      <div class="modal-body">
        <div class="form-group">
            <label>車輛編號</label>
            <input type="text" name="vehicleId" class="form-control" required>
        </div>
        <div class="form-group">
            <label>名稱</label>
            <input type="text" name="vehicleName" class="form-control" required>
        </div>
        <div class="form-group">
            <label>品牌</label>
            <input type="text" name="vehicleBrand" class="form-control" required>
        </div>
        <div class="form-group">
            <label>地點</label>
            <input type="text" name="vehicleLocation" class="form-control" required>
        </div>
        <div class="form-group">
            <label>價格(月租)</label>
            <input type="number" name="monthPrice" class="form-control" required>
        </div>
        <div class="form-group">
            <label>價格(日租)</label>
            <input type="number" name="dayPrice" class="form-control" required>
        </div>
        <div class="form-group">
            <label>價格(公里)</label>
            <input type="number" name="hourPrice" class="form-control" required>
        </div>
        <div class="form-group">
            <label>描述</label>
            <textarea name="vehicleDescription" class="form-control"></textarea>
        </div>
        <div class="form-group">
            <label>出廠年份</label>
            <input type="text" name="vehicleYear" class="form-control">
        </div>
        <div class="form-group">
            <label>照片連結</label>
            <input type="text" name="vehicleImage" class="form-control">
        </div>
        <div class="form-group">
            <label>顏色</label>
            <input type="text" name="vehicleColor" class="form-control">
        </div>
        <div class="form-group">
            <label>數量</label>
            <input type="number" name="quantity" class="form-control" required>
        </div>
        <div class="form-group">
            <label>狀態</label>
            <select name="status" class="form-control">
                <option value="可租借">可租借</option>
                <option value="維修中">維修中</option>
            </select>
        </div>
    </div>

      <div class="modal-footer">
        <button type="submit" class="btn btn-primary">新增</button>
        <button type="button" class="btn btn-secondary" data-dismiss="modal">取消</button>
      </div>
    </form>
  </div>
</div>

<!-- JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>

<script>
    document.addEventListener('DOMContentLoaded', function() {

    // 查詢 (過濾表格)
    document.getElementById('searchInput').addEventListener('keyup', function() {
        const keyword = this.value.toLowerCase();
        document.querySelectorAll('#vehicleTable tbody tr').forEach(row => {
            row.style.display = row.textContent.toLowerCase().includes(keyword) ? '' : 'none';
        });
    });

    // 編輯
    document.querySelectorAll('.edit-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const row = this.closest('tr');
            row.querySelectorAll('.editable').forEach(td => {
                const text = td.textContent.trim();
                td.innerHTML = `<input type="text" class="form-control form-control-sm" value="\${text}">`;
            });
            row.querySelector('.edit-btn').classList.add('d-none');
            row.querySelector('.delete-btn').classList.add('d-none');
            row.querySelector('.save-btn').classList.remove('d-none');
            row.querySelector('.cancel-btn').classList.remove('d-none');
        });
    });

    // 取消
    document.querySelectorAll('.cancel-btn').forEach(btn => {
        btn.addEventListener('click', () => location.reload());
    });

    // 儲存更新
    document.querySelectorAll('.save-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const row = this.closest('tr');
            const id = row.dataset.id;
            let payload = { vehicleId: id };
            row.querySelectorAll('.editable').forEach(td => {
                const field = td.dataset.field;
                const value = td.querySelector('input').value;
                payload[field] = value;
            });

            fetch(`/admin/updateVehicle`, {
                method: 'POST',
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(payload)
            })
            .then(resp => resp.text())  // <-- 改成 text()
            .then(msg => {
                alert(msg);             // <-- 顯示後端回傳訊息 (更新成功/失敗)
                if (msg.includes("成功")) {
                    location.reload();
                }
            })
            .catch(err => alert("更新失敗：" + err));
        });
    });


    // 刪除
    document.querySelectorAll('.delete-btn').forEach(btn => {
        btn.addEventListener('click', function() {
            const id = this.closest('tr').dataset.id;
            if(confirm(`確定刪除車輛 \${id}？`)) {
                fetch(`/admin/deleteVehicle/\${id}`, { method: 'DELETE' })
                .then(resp => resp.ok ? location.reload() : alert("刪除失敗"));
            }
        });
    });

    // 新增
    document.getElementById('addVehicleForm').addEventListener('submit', function(e) {
        e.preventDefault();
        const formData = Object.fromEntries(new FormData(this));
        fetch(`/admin/addVehicle`, {
            method: 'POST',
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(formData)
        })
        .then(resp => resp.ok ? location.reload() : alert("新增失敗"));
    });

});
</script>


</body>
</html>
