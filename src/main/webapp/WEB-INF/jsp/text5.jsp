<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<!DOCTYPE html>
<html lang="zh-TW">

<head>
    <meta charset="UTF-8">
    <title>租車詳細資訊</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f5f5f5;
            margin: 0;
            padding: 20px;
        }

        .container {
            max-width: 1000px;
            margin: auto;
            background: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .top {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .top img {
            width: 300px;
            border-radius: 8px;
        }

        .info {
            flex: 1;
        }

        .info h2 {
            margin-top: 0;
        }

        .info .meta {
            color: #777;
            margin: 5px 0;
        }

        .info .price {
            margin: 10px 0;
            font-size: 18px;
            color: #d32f2f;
        }

        .info .actions {
            margin-top: 15px;
        }

        .info .actions button {
            margin-right: 10px;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-primary {
            background: #2b80ff;
            color: white;
        }

        .btn-secondary {
            background: #eee;
        }

        .rating {
            text-align: right;
            font-size: 14px;
            color: #666;
        }

        .section {
            margin-top: 40px;
        }

        .section h3 {
            border-left: 5px solid #2b80ff;
            padding-left: 10px;
        }

        ul.notice {
            padding-left: 20px;
            line-height: 1.7;
        }

        .tabs {
            margin-top: 10px;
        }

        .tabs button {
            padding: 6px 12px;
            border: 1px solid #ccc;
            background: #eee;
            cursor: pointer;
        }

        .tabs button.active {
            background: #2b80ff;
            color: white;
        }

        .tab-content {
            margin-top: 10px;
        }

        .recommend {
            display: flex;
            gap: 15px;
            margin-top: 10px;
        }

        .recommend div {
            flex: 1;
            background: #f2f6ff;
            padding: 10px;
            border-radius: 6px;
        }

        .car-recommend {
            padding: 40px;
            background-color: #f9f9f9;
        }

        .car-recommend h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        .car-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            /* 三欄 */
            gap: 20px;
        }

        .car-card {
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease;
        }

        .car-card:hover {
            transform: translateY(-5px);
        }

        .car-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .car-name {
            font-weight: bold;
            font-size: 18px;
            margin: 10px 0 5px;
        }

        .car-price {
            color: #666;
            margin-bottom: 15px;
        }
    </style>
</head>

<body>
    <div class="container">
        <div class="top">
            <img src="https://picsum.photos/300/300?12" alt="車輛圖片">
            <div class="info">
                <div class="rating">
                    ⭐ 4.8 / 5<br>
                    成交次數：38 筆
                </div>
                <h2>TOYOTA ALTIS</h2>
                <div class="meta">地區：台北市</div>
                <div class="meta">年份：2021 年</div>
                <div class="price">日費 NT$388｜里程費 NT$2.8/km</div>
                <div class="actions">
                    <button class="btn-secondary">⭐ 收藏</button>
                    <button class="btn-secondary">🔗 複製連結</button>
                    <button class="btn-primary">立即預約</button>
                </div>
            </div>
        </div>

        <div class="section">
            <h3>📌 訂閱須知（日租）</h3>
            <ul class="notice">
                <li>日租費用不含保險與配件。</li>
                <li>訂單成立後請準時取車，逾時需額外計費。</li>
                <li>里程費每公里 NT$2.8。</li>
                <li>取消訂單請於 24 小時前完成。</li>
                <li>車輛皆為定期保養與清潔。</li>
            </ul>
        </div>

        <div class="section">
            <h3>📖 詳細資訊 / 評論</h3>
            <div class="tabs">
                <button class="active" onclick="switchTab('tab1')">詳細資訊</button>
                <button onclick="switchTab('tab2')">所有評論</button>
            </div>
            <div class="tab-content">
                <div id="tab1" class="tab-pane">
                    <p>配備：ABS、倒車雷達、藍牙音響、USB 插孔、安全氣囊、恆溫空調。</p>
                </div>
                <div id="tab2" class="tab-pane" style="display:none">
                    <p>⭐️⭐️⭐️⭐️⭐️：「車況很好，交車快」</p>
                    <p>⭐️⭐️⭐️⭐️：「價錢合理，推薦！」</p>
                </div>
            </div>
        </div>

        

        <section class="car-recommend">
            <h3>🚘 推薦車輛</h3>
            <div class="car-grid">
                <div class="car-card">
                    <img src="https://picsum.photos/300/300?3" alt="Toyota Altis">
                    <p class="car-name">TOYOTA ALTIS</p>
                    <p class="car-price">NT$980 / 日</p>
                </div>

                <div class="car-card">
                    <img src="https://picsum.photos/300/300?5" alt="Honda Fit">
                    <p class="car-name">HONDA FIT</p>
                    <p class="car-price">NT$880 / 日</p>
                </div>

                <div class="car-card">
                    <img src="https://picsum.photos/300/300?6" alt="Tesla Model 3">
                    <p class="car-name">TESLA MODEL 3</p>
                    <p class="car-price">NT$1,980 / 日</p>
                </div>
            </div>
        </section>

    </div>

    <script>
        function switchTab(id) {
            document.querySelectorAll(".tabs button").forEach(btn => btn.classList.remove("active"));
            document.querySelectorAll(".tab-pane").forEach(pane => pane.style.display = "none");
            event.target.classList.add("active");
            document.getElementById(id).style.display = "block";
        }
    </script>
</body>

</html>