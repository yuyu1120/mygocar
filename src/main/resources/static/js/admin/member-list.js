
                const tbody = document.getElementById('memberTbody');

                function rowHtml(m) {
                    return '<tr>'
                        + '<td>' + m.account + '</td>'
                        + '<td>' + m.name + '</td>'
                        + '<td>' + m.email + '</td>'
                        + '<td>' + m.phone + '</td>'
                        + '<td>' + m.role + '</td>'
                        + '<td>'
                        + '<button class="btn btn-sm btn-warning" '
                        + 'data-bs-toggle="modal" '
                        + 'data-bs-target="#editMemberModal" '
                        + 'data-id="' + m.id + '" '
                        + 'data-account="' + m.account + '" '
                        + 'data-name="' + m.name + '" '
                        + 'data-email="' + m.email + '" '
                        + 'data-phone="' + m.phone + '" '
                        + 'data-role="' + m.role + '">'
                        + '編輯'
                        + '</button>'
                        // 刪除連結
                        + '<a href="/admin/delete-member?id=' + m.id + '" '
                        + 'class="btn btn-sm btn-danger" '
                        + 'onclick="return confirm(\'確定要刪除嗎？\')">'
                        + '刪除'
                        + '</a>'
                        + '</td>'
                        + '</tr>';
                }

                async function doSearch(field, keyword) {
                    const res = await fetch('/admin/members/search', {
                        method: 'POST',
                        headers: { 'Content-Type': 'application/json' },
                        body: JSON.stringify({ field, keyword })
                    });
                    const list = await res.json();

                    // 後端回傳 List<Member> -> JSON
                    tbody.innerHTML = list.map(rowHtml).join('');
                }

                // 綁你的搜尋表單
                document.getElementById('searchForm').addEventListener('submit', (e) => {
                    e.preventDefault();
                    const field = document.getElementById('field').value;
                    const keyword = document.getElementById('keyword').value.trim();
                    doSearch(field, keyword);
                });

                document.getElementById("btnTest").addEventListener("click", () => {
                    const field = document.getElementById("field").value;
                    const keywordInput = document.getElementById("keyword");

                    switch (field) {
                        case "account":
                            keywordInput.value = "testAccount123";
                            break;
                        case "name":
                            keywordInput.value = "測試姓名";
                            break;
                        case "email":
                            keywordInput.value = "test@example.com";
                            break;
                        case "phone":
                            keywordInput.value = "0912345678";
                            break;
                        default:
                            keywordInput.value = "";
                    }
                });



                // 綁定新增會員按鈕，打開 Modal
                document.getElementById("btnAdd").addEventListener("click", () => {
                    const modal = new bootstrap.Modal(document.getElementById("addMemberModal"));
                    modal.show();
                });

                // 測試按鈕：自動塞值
                document.getElementById("btnTest").addEventListener("click", () => {
                    document.getElementById("addaccount").value = "test123";
                    document.getElementById("addname").value = "小明";
                    document.getElementById("addemail").value = "test@example.com";
                    document.getElementById("addphone").value = "0912345678";
                    document.getElementById("addrole").value = "user";
                });

                // 儲存：用 fetch 傳 JSON 給後端
                document.getElementById("addMemberForm").addEventListener("submit", (e) => {
                    e.preventDefault();

                    const payload = {
                        account: document.getElementById("addaccount").value,
                        name: document.getElementById("addname").value,
                        email: document.getElementById("addemail").value,
                        phone: document.getElementById("addphone").value,
                        role: document.getElementById("addrole").value,
                    };

                    fetch("/admin/add-member", {
                        method: "POST",
                        headers: { "Content-Type": "application/json" },
                        body: JSON.stringify(payload),
                    })
                        .then(res => res.json())
                        .then(data => {
                            alert("新增成功！");
                            location.reload(); // 刷新頁面顯示新資料
                        })
                        .catch(err => console.error(err));
                });







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
          