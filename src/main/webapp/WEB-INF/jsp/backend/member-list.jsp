<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Document</title>

            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"
                integrity="sha384-LN+7fdVzj6u52u30Kp6M/trliBMCMKTyK833zpbD+pXdCLuTusPj697FH4R/5mcr"
                crossorigin="anonymous">

            <link rel="stylesheet" href="/css/admin/member-list.css">
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
                crossorigin="anonymous">
                </script>

            <!-- AdminLTE & Bootstrap -->
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free/css/all.min.css">
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/css/adminlte.min.css">

            <!-- Chart.js -->
            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

        </head>

        <body>
            <section class="member-list-container">

                <!-- 側邊欄 -->
                <aside class=" sidebar main-sidebar sidebar-dark-primary elevation-4">
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
                                    <a href="/admin/dashboard" class="nav-link active"><i
                                            class="nav-icon fas fa-tachometer-alt"></i>
                                        <p>儀表板</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/admin/member" class="nav-link"><i class="nav-icon fas fa-users"></i>
                                        <p>會員管理</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/admin/vehicle-manage" class="nav-link"><i class="nav-icon fas fa-car"></i>
                                        <p>車輛管理</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/admin/order-manage" class="nav-link"><i
                                            class="nav-icon fas fa-receipt"></i>
                                        <p>訂單管理</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/admin/transaction-manage" class="nav-link"><i
                                            class="nav-icon fas fa-credit-card"></i>
                                        <p>交易管理</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/admin/promotion" class="nav-link"><i class="nav-icon fas fa-tags"></i>
                                        <p>優惠活動</p>
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a href="/admin/logout" class="nav-link"><i
                                            class="nav-icon fas fa-sign-out-alt"></i>
                                        <p>登出</p>
                                    </a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </aside>


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
                            <button id="btnTest" class="btn btn-sm btn-info" type="button">
                                測試
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
                        <tbody id="memberTbody">
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



                    <!-- 新增會員 Modal -->
                    <div class="modal fade" id="addMemberModal" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <form id="addMemberForm">
                                    <div class="modal-header">
                                        <h5 class="modal-title">新增會員</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                    </div>

                                    <div class="modal-body">
                                        <div class="mb-3">
                                            <label>帳號</label>
                                            <input type="text" id="addaccount" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label>姓名</label>
                                            <input type="text" id="addname" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label>Email</label>
                                            <input type="email" id="addemail" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label>電話</label>
                                            <input type="text" id="addphone" class="form-control">
                                        </div>
                                        <div class="mb-3">
                                            <label>身分</label>
                                            <select id="addrole" class="form-control">
                                                <option value="user">user</option>
                                                <option value="admin">admin</option>
                                            </select>
                                        </div>
                                    </div>

                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary"
                                            data-bs-dismiss="modal">取消</button>
                                        <button type="button" class="btn btn-info" id="btnTest">測試</button>
                                        <button type="submit" class="btn btn-primary">儲存</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>


                </div>
            </section>

            <!-- JS -->
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/admin-lte@3.2/dist/js/adminlte.min.js"></script>

            <script src="/js/admin/member-list.js"></script>

        </body>

        </html>