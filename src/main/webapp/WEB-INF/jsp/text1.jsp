<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!doctype html>
<html lang="zh-Hant">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>車款列表</title>
    <!-- Bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* 小標籤（像官網那種藍色膠囊） */
        .chip {
            display: inline-block;
            padding: .25rem .6rem;
            border-radius: 999px;
            background: #e9f2ff;
            color: #0d6efd;
            font-weight: 600;
            font-size: .85rem;
        }

        /* 卡片淡陰影與分隔線 */
        .car-card {
            border: 1px solid #eef1f5;
            border-radius: 12px;
            box-shadow: 0 4px 14px rgba(0, 0, 0, .04);
        }

        .car-divider {
            border-top: 1px solid #eef1f5;
        }

        .price {
            color: #0d6efd;
            font-weight: 800;
        }

        .meta i {
            opacity: .7;
            margin-right: .25rem;
        }

        .thumb {
            width: 140px;
            height: 84px;
            object-fit: cover;
            border-radius: 10px;
        }

        @media (max-width: 576px) {
            .thumb {
                width: 100%;
                height: 160px;
                margin-bottom: .75rem;
            }
        }
    </style>
</head>

<body class="bg-light">

    <div class="container py-4">

        <!-- 篩選列：只有「年分」與「區域」兩條 -->
        <div class="card mb-4">
            <div class="card-body">
                <div class="row g-3 align-items-end">
                    <div class="col-12 col-md-6">
                        <label class="form-label fw-semibold">年分 (Year)</label>
                        <div class="d-flex gap-2 flex-wrap">
                            <select id="yearSelect" class="form-select w-auto">
                                <option value="">全部</option>
                                <option>2024</option>
                                <option>2023</option>
                                <option>2022</option>
                                <option>2021</option>
                            </select>
                            <!-- 已選顯示（可選） -->
                            <span id="yearChip" class="chip d-none"></span>
                        </div>
                    </div>

                    <div class="col-12 col-md-6">
                        <label class="form-label fw-semibold">區域 (Region)</label>
                        <div class="d-flex gap-2 flex-wrap">
                            <select id="regionSelect" class="form-select w-auto">
                                <option value="">全部</option>
                                <option>台北</option>
                                <option>桃園</option>
                                <option>台中</option>
                                <option>高雄</option>
                            </select>
                            <span id="regionChip" class="chip d-none"></span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 車款卡片（示範兩張） -->
        <div class="car-card bg-white p-3 mb-3">
            <div class="row g-3 align-items-center">
                <div class="col-12 col-sm-auto">
                    <img class="thumb" src="https://picsum.photos/300/180?random=1" alt="car">
                </div>
                <div class="col">
                    <h4 class="mb-1 fw-bold">TOYOTA - YARIS 1.5</h4>
                    <div class="d-flex gap-2 mb-2 flex-wrap">
                        <span class="chip">小型車</span>
                        <span class="chip">五人座</span>
                        <span class="chip">豐田</span>
                    </div>
                    <div class="meta small text-secondary d-flex gap-4 flex-wrap">
                        <span><i class="bi bi-people"></i>5 人座</span>
                        <span><i class="bi bi-suitcase"></i>1 大 + 2 小</span>
                        <span><i class="bi bi-currency-dollar"></i>里程 $2.9 / km</span>
                    </div>
                </div>
                <div class="col-12 col-sm-auto text-sm-end">
                    <div class="price h4 mb-2">NT$1,780 <small class="text-secondary fs-6">/ 日起</small></div>
                    <button class="btn btn-outline-primary btn-sm">可預約 24hr 後</button>
                </div>
            </div>
            <div class="car-divider my-3"></div>
            <div class="small text-secondary">
                • 車型名稱加註＊者為進口車型。<br>
                • 照片顏色與配備僅供參考，實際取車為準。
            </div>
        </div>

        <div class="car-card bg-white p-3 mb-3">
            <div class="row g-3 align-items-center">
                <div class="col-12 col-sm-auto">
                    <img class="thumb" src="https://picsum.photos/300/180?random=2" alt="car">
                </div>
                <div class="col">
                    <h4 class="mb-1 fw-bold">TOYOTA - NEW VIOS 1.5</h4>
                    <div class="d-flex gap-2 mb-2 flex-wrap">
                        <span class="chip">小型車</span>
                        <span class="chip">五人座</span>
                        <span class="chip">豐田</span>
                    </div>
                    <div class="meta small text-secondary d-flex gap-4 flex-wrap">
                        <span><i class="bi bi-people"></i>5 人座</span>
                        <span><i class="bi bi-suitcase"></i>2 大 + 2 小</span>
                        <span><i class="bi bi-currency-dollar"></i>里程 $2.9 / km</span>
                    </div>
                </div>
                <div class="col-12 col-sm-auto text-sm-end">
                    <div class="price h4 mb-2">NT$1,880 <small class="text-secondary fs-6">/ 日起</small></div>
                    <button class="btn btn-outline-primary btn-sm">可預約 24hr 後</button>
                </div>
            </div>
        </div>

    </div>

    <!-- Bootstrap Icons（上面用了 bi-people / bi-suitcase …） -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <script>
        // 簡單示範：把選到的 年分 / 區域 顯示成藍色膠囊
        const yearSel = document.getElementById('yearSelect');
        const regionSel = document.getElementById('regionSelect');
        const yearChip = document.getElementById('yearChip');
        const regionChip = document.getElementById('regionChip');

        function showChip(sel, chip, label) {
            if (sel.value) {
                chip.textContent = label + '：' + sel.value;
                chip.classList.remove('d-none');
            } else {
                chip.classList.add('d-none');
            }
        }
        yearSel.addEventListener('change', () => showChip(yearSel, yearChip, '年分'));
        regionSel.addEventListener('change', () => showChip(regionSel, regionChip, '區域'));
    </script>
</body>

</html>