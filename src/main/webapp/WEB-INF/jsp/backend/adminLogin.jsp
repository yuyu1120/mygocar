<%@ page contentType="text/html; charset=UTF-8" %>
<html>
<head>
    <title>後台登入</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="d-flex justify-content-center align-items-center vh-100 bg-light">
    <div class="card shadow p-4" style="width:350px;">
        <h3 class="text-center mb-4">管理員登入</h3>
        <form action="adminLogin" method="post">
            <div class="mb-3">
                <label class="form-label">帳號</label>
                <input type="text" class="form-control" name="username" required>
            </div>
            <div class="mb-3">
                <label class="form-label">密碼</label>
                <input type="password" class="form-control" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">登入</button>
        </form>
        <p class="text-danger mt-3">${errorMessage}</p>
    </div>
</body>
</html>
