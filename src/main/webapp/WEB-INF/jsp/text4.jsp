<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="zh-TW">

<head>
    <meta charset="UTF-8">
    <title>車輛租賃列表</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f4f6fa;
            margin: 0;
            padding: 0;
        }

        /* -------- 上方分類選單 -------- */
        .top-menu {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            background: white;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.05);
            gap: 10px;
        }

        .top-menu button {
            background-color: #fff;
            border: 1px solid #ccc;
            padding: 8px 16px;
            border-radius: 20px;
            cursor: pointer;
            font-size: 14px;
            transition: all 0.3s ease;
        }

        .top-menu button:hover,
        .top-menu button.active {
            background-color: #2b80ff;
            color: white;
            border-color: #2b80ff;
        }

        .filter-bar {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 10px 40px;
            font-size: 14px;
            color: #666;
        }

        /* -------- 車輛卡片容器 -------- */
        .card-container {
            display: flex;
            gap: 20px;
            flex-wrap: wrap;
            justify-content: center;
            padding: 30px;
        }

        .car-card {
            background: white;
            border-radius: 12px;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            width: 300px;
            overflow: hidden;
        }

        .car-header {
            background: linear-gradient(to right, #4fa3f4, #2b80ff);
            color: white;
            text-align: center;
            padding: 5px;
            font-weight: bold;
            font-size: 14px;
        }

        .car-card img {
            width: 100%;
            height: 160px;
            object-fit: cover;
        }

        .car-body {
            padding: 15px;
        }

        .car-meta {
            color: #777;
            font-size: 13px;
        }

        .car-name {
            font-weight: bold;
            font-size: 18px;
            margin-top: 5px;
        }

        .car-id {
            font-size: 12px;
            color: #999;
        }

        .tag {
            display: inline-block;
            background: #ffa726;
            color: white;
            font-size: 12px;
            padding: 3px 6px;
            border-radius: 4px;
            margin: 8px 0;
        }

        .price-info {
            background: #f1f3f5;
            border-radius: 8px;
            padding: 10px;
            margin-top: 10px;
        }

        .price-row {
            display: flex;
            justify-content: space-between;
            font-size: 14px;
            margin: 4px 0;
        }

        .price-row del {
            color: #999;
            font-size: 12px;
        }

        .subscribe-box {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
        }

        .subscribe-box .month {
            background: #2b80ff;
            color: white;
            padding: 4px 12px;
            border-radius: 20px;
            font-size: 14px;
        }

        .arrow-btn {
            font-size: 20px;
            color: #2b80ff;
            cursor: pointer;
        }
    </style>
</head>

<body>

    <!-- 🔵 上方分類選單 -->
    <div class="top-menu">
        <button class="active">熱門優惠</button>
        <button>熱銷車款</button>
        <button>超激優惠</button>
        <button>N7限時優惠</button>
        <button>電車供應</button>
        <button>限時推薦</button>
    </div>

    <!-- 🔵 篩選條件（右上角） -->
    <div class="filter-bar">
        年份 ｜ 月租費 ↓
    </div>

    <!-- 🔵 車輛列表 -->
    <div class="card-container">

        <!-- 🟡 一台車 -->
        <div class="car-card">
            <div class="car-header">🏆 全球熱銷 實力派車款 🏆</div>
            <img src="https://via.placeholder.com/300x160?text=TOYOTA+ALTIS" alt="TOYOTA ALTIS">
            <div class="car-body">
                <div class="car-meta">2021年｜不限</div>
                <div class="car-name">TOYOTA ALTIS</div>
                <div class="car-id">#1800940101</div>

                <span class="tag">超激優惠</span>

                <div class="price-info">
                    <div class="price-row">
                        <span>基本月費</span>
                        <span><del>NT$14,800</del></span>
                    </div>
                    <div class="price-row">
                        <span>優惠月費</span>
                        <span style="color: #d32f2f;">NT$9,800</span>
                    </div>
                    <div class="price-row">
                        <span>里程費</span>
                        <span>NT$2.8</span>
                    </div>
                </div>

                <div class="subscribe-box">
                    <div class="month">3 個月</div>
                    <div class="arrow-btn">→</div>
                </div>
            </div>
        </div>

        <!-- ⬇️ 複製 car-card 填更多車輛 -->

    </div>

</body>

</html>