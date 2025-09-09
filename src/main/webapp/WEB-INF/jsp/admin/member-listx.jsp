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

            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-ndDqU0Gzau9qJ1lfW4pNLlhNTkCfHzAVBReH9diLvGRem5+R9g2FzA8ZGN954O5Q"
                crossorigin="anonymous">
                </script>

            <style>
                .member-list-container {
                    display: grid;
                    grid-template-areas:
                        "sidebar    content"
                    ;

                    grid-template-columns: 300px 900px;
                    grid-template-rows: 900px;

                    justify-content: center;

                    align-content: center;


                }

                .sidebar {
                    grid-area: sidebar;
                    background-color: blue;


                }

                .content {
                    grid-area: content;
                    background-color: rgb(176, 210, 26);
                }

                /* 主內容區 */
                .main {
                    flex: 1;
                    padding: 40px;
                    background-color: #fff;
                }

                .main h1 {
                    color: #2f4050;
                    margin-bottom: 30px;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                    background-color: white;
                    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                }

                th,
                td {
                    padding: 12px 16px;
                    border-bottom: 1px solid #ddd;
                    text-align: left;
                }

                th {
                    background-color: #f4f4f4;
                    color: #333;
                }

                .edit-btn {
                    background-color: #4CAF50;
                    color: white;
                    border: none;
                    padding: 6px 12px;
                    margin-right: 5px;
                    cursor: pointer;
                }

                .delete-btn {
                    background-color: #e74c3c;
                    color: white;
                    border: none;
                    padding: 6px 12px;
                    cursor: pointer;
                }

                .edit-btn:hover,
                .delete-btn:hover {
                    opacity: 0.9;
                }
            </style>
        </head>

        <body>
            <section class="member-list-container">
                <div class="sidebar">你好
                </div>
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


                </div>


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
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">取消</button>
                                    <button type="submit" class="btn btn-primary">保存</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </section>

            <script>
                // 送出搜尋
                // document.getElementById('searchForm').addEventListener('submit', async (e) => {
                //     e.preventDefault();
                //     const field = document.getElementById('field').value;
                //     const keyword = document.getElementById('keyword').value.trim();

                //     // 後端建議：GET /admin/members?field=account&keyword=a123
                //     const url = `/admin/members?field=${encodeURIComponent(field)}&keyword=${encodeURIComponent(keyword)}`;
                //     try {
                //         const res = await fetch(url, { headers: { 'Accept': 'application/json' } });
                //         const json = await res.json();       // 後端請回傳 JSON 陣列
                //         renderTable(json);
                //     } catch (err) {
                //         console.error(err);
                //         alert('搜尋失敗');
                //     }
                // });


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

                // 表單送出用 fetch 呼叫後端
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