<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page import="java.util.*, com.example.model.Vehicle, com.example.model.CartItem" %>
<%@ page import="com.example.strategy.*" %>
<%@ page import="java.sql.*, com.example.utils.DBUtil" %>

<%
    // 假設這些變數已在其他地方初始化
    boolean isLoggedIn = session.getAttribute("username") != null;
    String username = isLoggedIn ? (String) session.getAttribute("username") : "";
    List<CartItem> cart = (List<CartItem>) session.getAttribute("cart");

    String vid = request.getParameter("vid");
    String location = (String)session.getAttribute("location");
    String startDate = request.getParameter("startDate");
    String endDate = request.getParameter("endDate");
    String startTime = request.getParameter("startTime");
    String endTime = request.getParameter("endTime"); 

    
    System.out.println("結帳頁面cart：" + cart);
    if(cart==null){
       cart = new ArrayList<>();
    }

    int total = 0;
    if(cart!=null){
        for(CartItem item:cart){
            total+=item.getSubtotal();
        }
        // System.out.println(total);
    }
    

    // 從 request 或 session 取得當前步驟
    int currentStep = 4; // 預設第一步
    String stepParam = request.getParameter("step");
    if (stepParam != null) {
        try {
            currentStep = Integer.parseInt(stepParam);
        } catch (NumberFormatException e) {
            currentStep = 1;
        }
    }
%>


<!DOCTYPE html>
<html lang="zh-Hant">
<head>
    <meta charset="UTF-8" />
    <title>付款方式</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.7/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link href="${pageContext.request.contextPath}/css/nav-order-step.css" rel="stylesheet"/>
    <style>
        .v-line{
            height:6vh;
            width:.1vw;
            border-width:0;
            color:#000;
            background-color:#000;
        }
    </style>
</head>

<body class="container py-4">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">MYCAR</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>

            <!-- 狀態步驟條 -->
            <div class="container my-4">
                <div class="progress-container">
                    <div class="step <%= currentStep > 1 ? "completed" : (currentStep == 1 ? "active" : "") %>">
                        <div class="step-label">加選配件</div>
                        <div class="circle"></div>
                    </div>
                    <div class="line"></div>
                    <div class="step <%= currentStep > 2 ? "completed" : (currentStep == 2 ? "active" : "") %>">
                        <div class="step-label">駕駛資訊</div>
                        <div class="circle"></div>
                    </div>
                    <div class="line"></div>
                    <div class="step <%= currentStep > 3 ? "completed" : (currentStep == 3 ? "active" : "") %>">
                        <div class="step-label">金額明細</div>
                        <div class="circle"></div>
                    </div>
                    <div class="line"></div>
                    <div class="step <%= currentStep == 4 ? "active" : "" %>">
                        <div class="step-label">付款方式</div>
                        <div class="circle"></div>
                    </div>
                </div>
            </div>

            <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">首頁</a></li>
                    <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/search/rental_search.jsp">租車</a></li>
                    <li class="nav-item">
                        <a class="nav-link" href="<%= isLoggedIn ? "account.jsp" : "../login.jsp" %>">
                            <%= isLoggedIn ? username : "登入" %>
                        </a>
                    </li>
                    <% if (isLoggedIn) { %>
                    <li class="nav-item"><a class="nav-link" href="../login.jsp?action=logout">登出</a></li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
    

    <!-- ---- 內容區域 ---- -->
    <div class="grid-container" style="max-width: 90%; padding-top: 80px;">
        <div class="row" >
            <div class="col-md-8">
                <h2>金額明細</h2>
                <%
                    if (cart.size() == 0) {
                %>
                    <p>目前購物車是空的。</p>
                <%
                    } else {
                        for (CartItem v : cart) {
                %>
                    <div class="vehicle-item">
                        <div class="vehicle-name"><%= v.getVehicle().getVehicleName() %></div>
                        <div style="width: 50px;"> <img src="<%= v.getVehicle().getVehicleImage() %>" style="height:80px;" /></div>
                        <div>品牌：<%= v.getVehicle().getVehicleBrand() %></div>
                        <div>租期：<%= startDate %> <%= startTime %> ~ <%= endDate %> <%= endTime %></div>
                        <div>取車地點|還車地點：<%= location %></div>
                        <div>月租：NT$ <%= v.getVehicle().getMonthPrice() %></div>
                    </div>
                <%
                        }
                    }
                %>
            </div>
            <div class="col-md-4">

                <h2>訂單總計</h2>
                <div class="total">總金額：NT$ <%= total %></div>

                    <button class="btn btn-success btn-lg" onclick="checkout()" id="checkoutBtn">
                        <i class="fas fa-credit-card"></i> Line Pay 結帳
                    </button>
                    <a href="${pageContext.request.contextPath}/search/rental_search.jsp" class="btn btn-outline-primary">
                        <i class="fas fa-shopping-bag"></i> 繼續購物
                    </a>
                    <button class="btn btn-outline-danger" onclick="clearCart()">
                        <i class="fas fa-trash"></i> 清空購物車
                    </button>
            
            </div>

        </div>
 

    </div>

    <script>
        // 結帳
        function checkout() {
            const checkoutBtn = document.getElementById('checkoutBtn');

            if (confirm('確定要使用 Line Pay 結帳嗎？')) {
                // 顯示載入中狀態
                checkoutBtn.disabled = true;
                checkoutBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> 處理中...';
                
                // 導向結帳頁面
                window.location.href = 'checkout';
            }
        }

       


        // 顯示訊息
        function showMessage(message, type) {
            const messageArea = document.getElementById('messageArea');
            const alertDiv = document.createElement('div');
            alertDiv.className = 'alert alert-' + type + ' alert-dismissible fade show';

            let icon = 'exclamation-circle';
            if (type === 'success') {
                icon = 'check-circle';
            } else if (type === 'warning') {
                icon = 'exclamation-triangle';
            }

            alertDiv.innerHTML = '<i class="fas fa-' + icon + '"></i> ' +
                                message +
                                '<button type="button" class="btn-close" data-bs-dismiss="alert"></button>';

            messageArea.appendChild(alertDiv);

            setTimeout(function() {
                if (alertDiv.parentNode) {
                    alertDiv.remove();
                }
            }, 3000);
        }
    </script>
</body>
</html>
