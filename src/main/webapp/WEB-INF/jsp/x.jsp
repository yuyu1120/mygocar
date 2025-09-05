<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>會員資料管理列表</title>
            <link rel="stylesheet" href="style.css">
            <style>
                * {
                    box-sizing: border-box;
                    font-family: "Microsoft JhengHei", sans-serif;
                }

                body {
                    margin: 0;
                    background-color: #f8f8f8;
                }

                .container {
                    display: flex;
                    height: 100vh;
                }

                /* 側邊欄 */
                .sidebar {
                    width: 200px;
                    background-color: #2f4050;
                    color: white;
                    padding: 20px;
                }

                .sidebar h2 {
                    font-size: 20px;
                    margin-bottom: 20px;
                }

                .sidebar ul {
                    list-style: none;
                    padding: 0;
                }

                .sidebar li {
                    margin: 10px 0;
                }

                .sidebar a {
                    color: white;
                    text-decoration: none;
                    font-size: 16px;
                }

                .sidebar a:hover {
                    text-decoration: underline;
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
            <div class="container">
                <!-- 側邊欄 -->
                <aside class="sidebar">
                    <h2>後台管理</h2>
                    <ul>
                        <li><a href="#">會員管理</a></li>
                        <li><a href="#">訂單管理</a></li>
                        <li><a href="#">車輛管理</a></li>
                        <li><a href="#">登出</a></li>
                    </ul>
                </aside>

                <!-- 主要內容 -->
                <main class="main">
                    <h1>會員資料管理列表</h1>

                    <table>
                        <thead>
                            <tr>
                                <th>帳號</th>
                                <th>姓名</th>
                                <th>Email</th>
                                <th>電話</th>
                                <th>身分</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody id="memberTable">
                            <!-- 假資料用 JS 插入 -->
                        </tbody>
                    </table>
                </main>
            </div>

            <script>
                const members = [
                    {
                        account: "user123",
                        name: "王小明",
                        email: "user123@example.com",
                        phone: "0912345678",
                        role: "user"
                    },
                    {
                        account: "admin888",
                        name: "管理員阿強",
                        email: "admin888@example.com",
                        phone: "0987654321",
                        role: "admin"
                    }
                ];

                const table = document.getElementById("memberTable");
                members.forEach(member => {
                    const row = document.createElement("tr");
                    row.innerHTML = `
        <td>${member.account}</td>
        <td>${member.name}</td>
        <td>${member.email}</td>
        <td>${member.phone}</td>
        <td>${member.role}</td>
        <td>
          <button class="edit-btn">編輯</button>
          <button class="delete-btn">刪除</button>
        </td>
      `;
                    table.appendChild(row);
                });
            </script>
        </body>

        </html>