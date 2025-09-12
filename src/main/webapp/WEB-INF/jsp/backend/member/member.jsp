<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<!DOCTYPE html>
<html lang="zh-TW">
<head>
    <meta charset="UTF-8">
    <title>MYGOCAR後台 - 會員管理</title>

    <!-- AdminLTE & Bootstrap -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
                crossorigin="anonymous">

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
                crossorigin="anonymous">
            </script>

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
                        <a href="/admin/dashboard" class="nav-link"><i class="nav-icon fas fa-tachometer-alt"></i><p>儀表板</p></a>
                    </li>
                    <li class="nav-item">
                        <a href="/admin/member" class="nav-link active"><i class="nav-icon fas fa-users"></i><p>會員管理</p></a>
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
        <!-- 頁面標題 -->
        <section class="content-header">
            <div class="container-fluid">
                <h1>會員管理</h1>
                <p>此頁可查看所有會員資料。</p>
            </div>
        </section>

        <section class="member-list-container" style="margin:30px">
                
                <div class="content main">
                    <!-- 主要內容 -->

                    <!-- <h1>會員資料管理列表</h1> -->

                    <!-- 工具列 -->
                    <div class="d-flex align-items-center justify-content-between mb-3 gap-2">

                        <form id="searchForm" class="d-flex align-items-center gap-2">
                            <label class="me-1">關鍵字搜尋：</label>
                            <select id="field" class="form-select form-select-sm" style="width:140px;">
                                <option value="account">帳號</option>
                                <option value="name">姓名</option>
                                <option value="email">Email</option>
                                <option value="phone">電話</option>
                            </select>

                            <input id="keyword" type="text" class="form-control form-control-sm" placeholder="輸入關鍵字…"
                                style="width:220px;">

                            <button class="btn btn-sm btn-success" type="submit">
                                <i class="bi bi-search"></i> 搜尋
                            </button>
                            <button class="btn btn-sm btn-outline-secondary" type="button" id="btnClear">
                                清除
                            </button>
                        </form>


                        <button id="btnAdd" class="btn btn-sm btn-primary">
                            <i class="bi bi-person-plus"></i> 新增會員
                        </button>
                    </div>


                    <table class="table table-striped table-bordered">
                        <thead class="table-light">
                            <tr>
                                <th>帳號</th>
                                <th>姓名</th>
                                <th>Email</th>
                                <th>電話</th>
                                <th>身分</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="m" items="${members}">
                                <tr>
                                    <td>${m.account}</td>
                                    <td>${m.name}</td>
                                    <td>${m.email}</td>
                                    <td>${m.phone}</td>
                                    <td>${m.role}</td>
                                    <td>
                                        <button class="btn btn-sm btn-warning" data-bs-toggle="modal"
                                            data-bs-target="#editMemberModal" data-id="${m.id}"
                                            data-account="${m.account}" data-name="${m.name}" data-email="${m.email}"
                                            data-phone="${m.phone}" data-role="${m.role}">
                                            編輯
                                        </button>
                                        <a href="${pageContext.request.contextPath}/admin/delete-member?id=${m.id}"
                                            class="btn btn-sm btn-danger" onclick="return confirm('確定要刪除嗎？')">刪除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <!-- Modal 彈跳視窗 -->
                    <div class="modal fade" id="editMemberModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form id="editMemberForm">
                                    <div class="modal-header">
                                        <h5 class="modal-title">編輯會員</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" id="memberId" name="id">

                                        <div class="mb-3">
                                            <label>帳號</label>
                                            <input type="text" id="account" name="account" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label>姓名</label>
                                            <input type="text" id="name" name="name" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label>Email</label>
                                            <input type="email" id="email" name="email" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label>電話</label>
                                            <input type="text" id="phone" name="phone" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label>身分</label>
                                            <input type="text" id="role" name="role" class="form-control">
                                        </div>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">取消</button>
                                        <button type="submit" class="btn btn-primary">保存</button>
                                    </div>
                                </form>
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

                    document.getElementById('btnClear').addEventListener('click', () => {
                        console.log("哈哈");
                        document.getElementById('keyword').value = '';
                        document.getElementById('keyword').focus();
                    });
                    // 當 Modal 打開時，把按鈕的 data 帶到表單
                    var editModal = document.getElementById('editMemberModal');
                    editModal.addEventListener('show.bs.modal', function (event) {
                        var button = event.relatedTarget;
                        document.getElementById('memberId').value = button.getAttribute('data-id');
                        document.getElementById('account').value = button.getAttribute('data-account');
                        document.getElementById('name').value = button.getAttribute('data-name');
                        document.getElementById('email').value = button.getAttribute('data-email');
                        document.getElementById('phone').value = button.getAttribute('data-phone');
                        document.getElementById('role').value = button.getAttribute('data-role');
                    });


                    document.getElementById('editMemberForm').addEventListener('submit', function (e) {
                        e.preventDefault();


                        const formData = {
                            id: document.getElementById('memberId').value,
                            account: document.getElementById('account').value,
                            name: document.getElementById('name').value,
                            email: document.getElementById('email').value,
                            phone: document.getElementById('phone').value,
                            role: document.getElementById('role').value
                        };
                        console.log("有進入哈哈 ");
                        fetch('/admin/update-member', {
                            method: 'POST',
                            headers: { 'Content-Type': 'application/json' },
                            body: JSON.stringify(formData)
                        })

                            .then(data => {
                                alert(data.msg || "更新成功");
                                location.reload(); // 重新整理頁面
                            });
                    });
    </script>

</body>
</html>
