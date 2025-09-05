<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-TW">

<head>
    <meta charset="UTF-8">
    <title>租車確認頁面</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 900px;
            margin: 40px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            padding: 30px;
        }

        h2 {
            border-left: 5px solid #2b80ff;
            padding-left: 10px;
            color: #2b80ff;
        }

        .section {
            margin-bottom: 30px;
        }

        .car-info {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .car-info img {
            width: 180px;
            height: auto;
            border-radius: 10px;
        }

        .info-table,
        .order-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .info-table td,
        .order-table td {
            padding: 8px 5px;
        }

        .info-table td:first-child,
        .order-table td:first-child {
            font-weight: bold;
            width: 150px;
            color: #444;
        }

        .order-total {
            font-size: 20px;
            text-align: right;
            margin-top: 15px;
            color: #d43f00;
            font-weight: bold;
        }

        .coupon-section {
            margin-top: 20px;
        }

        .coupon-section input {
            padding: 10px;
            width: 60%;
            margin-right: 10px;
        }

        .coupon-section button {
            padding: 10px 20px;
            background-color: #2b80ff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .submit-btn {
            text-align: center;
            margin-top: 30px;
        }

        .submit-btn button {
            padding: 15px 40px;
            font-size: 18px;
            background-color: #2b80ff;
            color: white;
            border: none;
            border-radius: 8px;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <div class="container">

        <!-- 租車資訊 -->
        <div class="section">
            <h2>租車資訊</h2>
            <div class="car-info">
                <img src="https://via.placeholder.com/180x100?text=Hyundai+Sonata" alt="車輛圖片">
                <table class="info-table">
                    <tr>
                        <td>車型：</td>
                        <td>Hyundai Sonata</td>
                    </tr>
                    <tr>
                        <td>乘客人數：</td>
                        <td>5人</td>
                    </tr>
                    <tr>
                        <td>年份：</td>
                        <td>2020</td>
                    </tr>
                    <tr>
                        <td>價格：</td>
                        <td>¥1900 / 小時</td>
                    </tr>
                </table>
            </div>
        </div>

        <!-- 租車時間 -->
        <div class="section">
            <h2>租車時間</h2>
            <table class="info-table">
                <tr>
                    <td>取車地點：</td>
                    <td>東京車站 博千店</td>
                </tr>
                <tr>
                    <td>取車時間：</td>
                    <td>2025-06-27 09:00</td>
                </tr>
                <tr>
                    <td>還車地點：</td>
                    <td>名古屋車站 北千店</td>
                </tr>
                <tr>
                    <td>還車時間：</td>
                    <td>2025-06-28 15:00</td>
                </tr>
                <tr>
                    <td>總時數：</td>
                    <td>30 小時</td>
                </tr>
            </table>
        </div>

        <!-- 訂單明細 -->
        <div class="section">
            <h2>訂單明細</h2>
            <table class="order-table">
                <tr>
                    <td>租借人姓名：</td>
                    <td>山田花子</td>
                </tr>
                <tr>
                    <td>聯絡電話：</td>
                    <td>090-1234-6789</td>
                </tr>
                <tr>
                    <td>Email：</td>
                    <td>yamada@example.com</td>
                </tr>
                <tr>
                    <td>租車時段：</td>
                    <td>06/27：09:00–21:00<br>06/28：09:00–15:00</td>
                </tr>
                <tr>
                    <td>基本租金：</td>
                    <td>¥1900 x 30 小時 = ¥57,000</td>
                </tr>
                <tr>
                    <td>兒童座椅：</td>
                    <td>¥1,100 x 1 = ¥1,100</td>
                </tr>
                <tr>
                    <td>代駕服務：</td>
                    <td>¥1,000 x 18 小時 = ¥18,000</td>
                </tr>
                <tr>
                    <td>乘客人數：</td>
                    <td>2人 + 兒童1人</td>
                </tr>
            </table>
            <div class="order-total">合計總額：¥76,100（約 NT$15,742）</div>
        </div>

        <!-- 優惠券 -->
        <div class="coupon-section">
            <h2>優惠券</h2>
            <input type="text" placeholder="輸入優惠券代碼">
            <button>套用優惠</button>
        </div>

        <!-- 完成預約 -->
        <div class="submit-btn">
            <button>完成預約</button>
        </div>

    </div>

</body>

</html>