<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-TW">

<head>
    <meta charset="UTF-8">
    <title>租車加選配件</title>
    <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f1f5f9;
        }

        /* 頁面流程列 */
        .step-progress-bar {
            background-color: white;
            display: flex;
            justify-content: space-around;
            padding: 12px 0;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .step-progress-bar .step {
            color: #555;
            font-weight: bold;
        }

        .step-progress-bar .step.active {
            color: #2b80ff;
            border-bottom: 2px solid #2b80ff;
            padding-bottom: 5px;
        }

        /* 主體內容 */
        .main-content {
            display: flex;
            justify-content: space-between;
            gap: 30px;
            max-width: 1100px;
            margin: 30px auto;
            padding: 20px;
            background: white;
            border-radius: 10px;
        }

        /* 左欄 */
        .left-panel {
            width: 65%;
        }

        .car-info {
            background: #f9fafb;
            border: 1px solid #ccc;
            border-radius: 10px;
            padding: 15px;
            margin-bottom: 25px;
        }

        .car-info h3 {
            margin: 0;
        }

        .addon-section {
            margin-bottom: 30px;
        }

        .addon-section h3 {
            color: #2b80ff;
            border-left: 5px solid #2b80ff;
            padding-left: 10px;
        }

        .addon-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            border-bottom: 1px solid #eee;
            padding: 10px 0;
        }

        .addon-control button {
            width: 30px;
            height: 30px;
            font-size: 16px;
            margin: 0 5px;
        }

        .car-details {
            background: #f9fafb;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 8px;
            margin-bottom: 30px;
        }

        .car-details h3 {
            color: #2b80ff;
            margin-bottom: 10px;
        }

        .car-details ul {
            list-style: none;
            padding-left: 0;
            line-height: 1.8;
        }

        .next-step {
            text-align: center;
            margin: 30px 0;
        }

        .btn-next {
            background-color: #2563eb;
            color: white;
            border: none;
            padding: 15px 40px;
            font-size: 18px;
            border-radius: 8px;
            cursor: pointer;
        }

        .line-support {
            text-align: center;
            margin-bottom: 30px;
        }

        .btn-line {
            display: inline-block;
            background-color: #06c755;
            color: white;
            text-decoration: none;
            padding: 12px 24px;
            font-size: 16px;
            border-radius: 6px;
            margin-top: 10px;
        }

        /* 右欄 */
        .right-panel {
            width: 30%;
        }

        .order-summary {
            background: #f8fafc;
            border: 1px solid #ccc;
            border-radius: 8px;
            padding: 20px;
        }

        .order-summary h3 {
            color: #2b80ff;
            margin-top: 0;
        }

        .summary-item {
            display: flex;
            justify-content: space-between;
            margin: 8px 0;
        }

        .summary-total {
            margin-top: 15px;
            font-weight: bold;
            font-size: 18px;
            display: flex;
            justify-content: space-between;
            color: #c53030;
        }
    </style>
</head>

<body>

    <!-- 頁面導覽列 -->
    <div class="step-progress-bar">
        <div class="step active">加選配件/指定地點</div>
        <div class="step">驗證資料</div>
        <div class="step">金額明細</div>
        <div class="step">付款方式</div>
    </div>

    <!-- 主體內容 -->
    <div class="main-content">

        <!-- 左欄 -->
        <div class="left-panel">
            <!-- 車輛資訊 -->
            <div class="car-info">
                <h3>U6/URX 限時優惠</h3>
                <p>5人座｜2大+0小</p>
                <p>取還車：台北建北站 → 台北建北站</p>
                <p>時間：2025/08/17 13:00 ~ 2025/08/18 13:00（共1日0時0分）</p>
            </div>

            <!-- 加選配件 -->
            <div class="addon-section">
                <h3>加選配件</h3>

                <div class="addon-item">
                    <span>GPS（NT$50/日）</span>
                    <div class="addon-control">
                        <button>-</button> <span>0</span> <button>+</button>
                    </div>
                </div>

                <div class="addon-item">
                    <span>安全座椅（NT$100/日）</span>
                    <div class="addon-control">
                        <button>-</button> <span>0</span> <button>+</button>
                    </div>
                </div>

                <div class="addon-item">
                    <span>增高墊（NT$50/日）</span>
                    <div class="addon-control">
                        <button>-</button> <span>0</span> <button>+</button>
                    </div>
                </div>

                <div class="addon-item">
                    <span>行車紀錄器（NT$100/日）</span>
                    <div class="addon-control">
                        <button>-</button> <span>0</span> <button>+</button>
                    </div>
                </div>

                <div class="addon-item">
                    <span>活氧殺菌清淨機（NT$50/日）</span>
                    <div class="addon-control">
                        <button>-</button> <span>0</span> <button>+</button>
                    </div>
                </div>
            </div>

            <!-- 車輛詳細資訊 -->
            <div class="car-details">
                <h3>車輛詳細資訊</h3>
                <ul>
                    <li>品牌：LUXGEN</li>
                    <li>型號：U6/URX</li>
                    <li>排氣量：1800cc</li>
                    <li>車門數：5門</li>
                    <li>變速系統：CVT</li>
                    <li>行李箱容量：約2大2小</li>
                </ul>
            </div>

            <!-- 下一步按鈕 -->
            <div class="next-step">
                <button class="btn-next">下一步</button>
            </div>

            <!-- LINE 詢問 -->
            <div class="line-support">
                <p>若有任何問題，歡迎加 LINE 詢問。</p>
                <a href="https://line.me/R/ti/p/@yourlineid" class="btn-line" target="_blank">
                    <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/4/41/LINE_logo.svg/1024px-LINE_logo.svg.png"
                        style="height:20px; vertical-align:middle;">
                    LINE @ 點我詢問
                </a>
            </div>
        </div>

        <!-- 右欄：訂單金額 -->
        <div class="right-panel">
            <div class="order-summary">
                <h3>訂單金額</h3>
                <div class="summary-item">
                    <span>車型方案</span>
                    <span>NT$1,920</span>
                </div>
                <div class="summary-item">
                    <span>額外費用</span>
                    <span>NT$500</span>
                </div>
                <div class="summary-total">
                    <span>總金額</span>
                    <span>NT$2,420</span>
                </div>
            </div>
        </div>
    </div>

</body>

</html>