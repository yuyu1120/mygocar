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
                body {
                    background-color: cornsilk;
                }

                .steps {
                    display: flex;
                    justify-content: center;
                    margin: 20px 0;
                }

                .step {
                    flex: 1;
                    text-align: center;
                    padding: 10px;
                    border-bottom: 3px solid #ccc;
                    font-weight: bold;
                    color: #666;
                    margin-top: 50px;
                }

                .step.active {
                    border-color: #007bff;
                    color: #007bff;
                }






                .order-container {
                    display: grid;
                    grid-template-areas:
                        "head       head"
                        "search    search"
                        "sidebar  content";
                    grid-template-columns: 300px 800px;
                    grid-template-rows: 70px 130px 900px;
                    justify-content: center;

                    align-content: center;


                }

                .search-head {
                    grid-area: head;
                    background-color: blue;
                    text-align: center;
                    line-height: 65px;
                    font-size: 28px;
                    font-weight: 700;
                    color: white;
                    border-top-left-radius: 5px;
                    border-top-right-radius: 5px;
                }

                .search {
                    display: flex;
                    grid-area: search;
                    background-color: #6ab0f7;
                    padding-top: 15px;
                    ;
                }


                .search .adress {

                    width: 175px;
                    height: 50px;
                    border-radius: 8px;

                    color: red;
                }

                .fontsize {
                    font-size: 24px;
                    font-weight: bold;
                }

                .inputsearch {
                    width: 70px;
                    border-radius: 8px;
                    border: none;
                    outline: none;
                    background-color: transparent;
                }

                .red-day {
                    color: red !important;
                }

                #dateBtn {
                    margin: 25px;
                    width: 200px;
                    height: 50px;
                    margin-top: 35px;
                    border-radius: 8px;
                    background-color: #007bff;
                    color: white;
                    font-weight: 600;
                }

                .sidebar {
                    grid-area: sidebar;
                    background-color: #e3f2fd;
                    position: relative;
                }

                :root {
                    --track-h: 10px;
                    --thumb: 24px;
                    --blue: #0d6efd;
                    --blue-200: #9fd0ff;
                    --gray: #e9ecef;
                }

                .active {
                    pointer-events: none !important;
                }

                #priceSlider {
                    position: relative;
                    height: var(--thumb);
                    display: flex;
                    align-items: center;
                    padding: 0 6px;
                    border-radius: 999px;
                    background: #f1f5f9;
                    box-shadow: inset 0 0 0 1px #e2e8f0;

                }

                #sidebar-search .fontsize {

                    font-size: 24px;
                    font-weight: bold;
                }

                #sidebar-search button {

                    margin-left: 130px;
                    border: 0;
                    background-color: transparent;
                    color: red;
                }

                .form-check {
                    display: flex;
                    width: 150px;
                    height: 50px;
                    align-items: center;
                    gap: 8px;
                }

                .form-check-inupt {
                    width: 20px;
                    height: 20px;
                }

                .form-check-label {
                    height: 50px;
                    padding-top: 8px;
                    font-size: 24px;
                    font-weight: bold;


                }

                .price-io {
                    display: flex;
                    gap: 6px;
                    align-items: center;
                }

                .price-io .box {
                    width: 120px;
                    height: 46px;
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    border-radius: 10px;
                    background: #f8fafc;
                    border: 1px solid #e2e8f0;
                    font-weight: 600;


                }

                .price-io .to {
                    color: #94a3b8;
                    font-weight: 600
                }








                /* 填色軌 */
                .slider .track {
                    position: absolute;
                    left: 6px;
                    right: 6px;
                    height: var(--track-h);
                    background: linear-gradient(90deg, #cfe8ff, #7ab8ff);
                    border-radius: 999px;

                }

                #fill {
                    pointer-events: none;

                }

                .slider input[type=range] {
                    -webkit-appearance: none;
                    appearance: none;
                    position: absolute;
                    left: 0;
                    right: 0;
                    width: 100%;
                    height: var(--thumb);
                    background: transparent;
                    pointer-events: auto;
                    margin: 0;
                    outline: none;



                }



                /* 原生軌道隱形 */
                .slider input[type=range]::-webkit-slider-runnable-track {
                    height: var(--track-h);
                    background: transparent
                }

                .slider input[type=range]::-moz-range-track {
                    height: var(--track-h);
                    background: transparent
                }

                /* 拇指 */
                .slider input[type=range]::-webkit-slider-thumb {
                    -webkit-appearance: none;
                    appearance: none;
                    width: var(--thumb);
                    height: var(--thumb);
                    border-radius: 50%;
                    background: #fff;
                    border: 3px solid var(--blue);
                    box-shadow: 0 2px 8px rgba(13, 110, 253, .25);
                }

                .slider input[type=range]::-moz-range-thumb {
                    width: var(--thumb);
                    height: var(--thumb);
                    border-radius: 50%;
                    background: #fff;
                    border: 3px solid var(--blue);
                    box-shadow: 0 2px 8px rgba(13, 110, 253, .25);
                }

                /* 灰色底軌 */
                .slider::before {
                    content: "";
                    position: absolute;
                    left: 6px;
                    right: 6px;
                    height: var(--track-h);
                    background: #e9eef5;
                    border-radius: 999px;
                }

                /* 藍色區段遮罩：用 track 寬度/位置控制 */
                .track {
                    background: linear-gradient(90deg, #46a4ff, #0d6efd)
                }

                .content {
                    grid-area: content;
                    background-color: #9be6fb;

                }

                .features {
                    display: flex;
                }

                .feat {

                    background: transparent;
                    border: 1px solid #eef2f7;
                    border-radius: 5px;
                    width: 85px;
                    text-align: center
                }

                .feat .ico {
                    font-size: 28px;
                    line-height: 1;
                }

                .feat .name {
                    margin-top: 8px;
                    font-weight: 700;
                }

                .feat .desc {

                    color: #64748b;
                    font-size: 10px;
                    text-align: left;
                    padding-left: 18px;
                    padding-right: 5px;
                }



                .note-box {
                    background: transparent;
                    border-radius: 12px;
                    border: 1px solid #e5e7eb;
                    padding: 16px 20px;
                    max-width: 800px;
                    margin: auto;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
                }

                .note-box ul {
                    margin: 0;
                    padding-left: 20px;
                    line-height: 1.6;
                    color: #374151;
                }

                .note-box li {
                    margin-bottom: 6px;
                }


                /* 內容 */

                .car-card {
                    border: 1px solid #eef1f5;
                    border-radius: 12px;
                    box-shadow: 0 4px 14px rgba(0, 0, 0, .04);
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
            </style>


        </head>

        <body>
            <section>
                <div class="steps">
                    <div class="step active">1. 日租選車</div>
                    <div class="step">2. 日租選配</div>
                    <div class="step">3. 結帳明細</div>
                </div>
            </section>

            <section class="order-section">
                <div class="order-container">
                    <div class="search-head">
                        <div
                            style="background-color: blue; height: 70px;border-top-left-radius: 5px;border-top-right-radius: 5px;">
                            日租車
                        </div>
                    </div>
                    <div class="search">

                        <div class="ms-4 ">
                            <div class="fontsize">取車地點</div>
                            <input class="adress" value=""></input>
                        </div>
                        <div class="ms-4 ">
                            <div class="fontsize">還車地點</div>
                            <input class="adress" value=""></input>
                        </div>

                        <div class="ms-3">
                            <div class="fontsize">取車日期</div>
                            <div style="display:flex; ">
                                <div style="display:flex; border: 2px solid black; border-radius: 8px;">
                                    <img src="image/rent/icons8-date.png" alt="logo" width="48px">
                                    <input class="inputsearch " type="text" id="pickupDate" placeholder="選擇取車日期">
                                </div>
                                <div class="ms-1" style="display:flex;  border: 2px solid black; border-radius: 8px; ">
                                    <img src="image/rent/icons8-time.png" alt="logo" width="48px">
                                    <select class="inputsearch " id="returnTimeSelect" placeholder="選擇取車日期"></select>
                                </div>
                            </div>
                        </div>
                        <div class="ms-3">
                            <div class="fontsize">還車日期</div>
                            <div style="display:flex; ">
                                <div style="display:flex; border: 2px solid black; border-radius: 8px;">
                                    <img src="image/rent/icons8-date.png" alt="logo" width="48px">
                                    <input class="inputsearch " type="text" id="pickdownDate"
                                        placeholder="選擇取車日期"></input>
                                </div>
                                <div class="ms-1" style="display:flex;  border: 2px solid black; border-radius: 8px; ">
                                    <img src="image/rent/icons8-time.png" alt="logo" width="48px">
                                    <input class="inputsearch " type="text" placeholder="選擇取車日期"></input>
                                </div>
                            </div>
                        </div>
                        <button type="submit" id="dateBtn">
                            我想租車
                        </button>




                    </div>
                    <div class="sidebar">
                        <div id="sidebar-search" class="mt-3 ms-3">
                            <div style="display: flex; ">
                                <div class="fontsize ms-3">品牌</div>
                                <button class="clear-button fontsize" onclick="clearFilters()">清除</button>
                            </div>
                            <div class="form-check">
                                <input class="form-check-inupt" type="radio" name="brand" value="Toyota">
                                <label class="form-check-label" for="check1">豐田</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-inupt" type="radio" name="brand" value="Nissan">
                                <label class="form-check-label" for="check1">日產</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-inupt" type="radio" name="brand" value="Mitsubishi">
                                <label class="form-check-label" for="check1">三菱</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-inupt" type="radio" name="brand" value="Volkswagen">
                                <label class="form-check-label" for="check1">福斯</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-inupt" type="radio" name="brand" value="Mitsubishi">
                                <label class="form-check-label" for="check1">特斯拉</label>
                            </div>
                        </div>
                        <div id="sidebar-price" class="mt-3 ">
                            <div class="fontsize ms-3">日租金</div>
                            <div class="price-io ms-3">
                                <div id="minBox" class="box">0</div>
                                <div class="to">至</div>
                                <div id="maxBox" class="box">5,000+</div>
                            </div>

                            <!-- 雙滑桿 -->
                            <div class="range-wrap mt-2">
                                <div class="slider" id="priceSlider">
                                    <div class="track" id="fill"></div>

                                    <input id="minRange" class="active" style=" position: absolute;" type="range"
                                        min="0" max="5000" value="0" step="50" />

                                    <input id="maxRange" class="active" style=" position: absolute;" type="range"
                                        min="0" max="5000" value="5000" step="50" />

                                </div>
                            </div>
                        </div>
                        <div class="mt-4">
                            <!-- 特色列（圖示＋名稱＋文字） -->
                            <div class="features">
                                <div class="feat">
                                    <div class="ico">🤝</div>
                                    <div class="name">安心免責</div>
                                    <ul class="desc">
                                        <li>第三責任＋乘客險</li>
                                        <li>事故自負額減免方案</li>
                                    </ul>
                                </div>
                                <div class="feat">
                                    <div class="ico">🧾</div>
                                    <div class="name">甲租乙還</div>
                                    <ul class="desc">
                                        <li>跨站取還更彈性</li>
                                        <li>可能酌收跨站費用</li>
                                    </ul>
                                </div>
                                <div class="feat">
                                    <div class="ico">⛽</div>
                                    <div class="name">加油費用</div>
                                    <ul class="desc">
                                        <li>滿油取還</li>
                                        <li>未滿油依表補差</li>
                                    </ul>
                                </div>
                                <div class="feat">
                                    <div class="ico">🔌</div>
                                    <div class="name">充電教學</div>
                                    <ul class="desc">
                                        <li>電車站點指引</li>
                                        <li>支援多種槍頭</li>
                                    </ul>
                                </div>
                            </div>
                            <div class="note-box">
                                <ul>
                                    <li>車型名稱加註＊者為進口車型。</li>
                                    <li>各車型照片之顏色、內裝配備等僅供參考，實際租用車輛依現場取車為準。</li>
                                    <li>不指定車型：將依調度提供同等級車輛，後續將有專人與您聯繫相關事宜。</li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="content">
                        <div class="car-card bg-white p-2 mb-3" style="height: 150px;">
                            <div class="row g-3 align-items-center">
                                <div class="col-12 col-sm-auto">
                                    <img class="thumb" src="https://picsum.photos/300/180?random=2" alt="car">
                                </div>
                                <div class="col">
                                    <div style="padding-top:8px ; font-size: 24px; font-weight: 700;">2022年/北區</div>
                                    <h4 class="mb-1 " style="font-size: 24px; font-weight: 700;">TOYOTA </h4>
                                    <div>

                                        <span
                                            style="margin-top: 8px; background-color: #a0c5ea; display: block; text-align: center; width: 50px; color: #025cbd; border-radius: 8px;">豐田</span>
                                    </div>
                                    <div class="meta small text-secondary d-flex gap-4 flex-wrap mt-1">
                                        <span>
                                            <img src="image/rent/icons8-male-48.png" width="20px">
                                            <span style="color: black;">5 人座</span>
                                        </span>
                                        <span>
                                            <img src="image/rent/icons8-bag-50.png" width="20px">
                                            <span style="color: black;">2 大 + 2 小</span>
                                        </span>
                                        <span>
                                            <img src="image/rent/icons8-speed-50.png" width="20px">
                                            <span style="color: black;">里程 $2.9 / km</span>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-auto text-sm-end">
                                    <div class="price h4 mb-2">NT$1,880 <small class="text-secondary fs-6">/ 日起</small>
                                    </div>
                                    <button
                                        style="background-color: #46a4ff; width: 150px; height: 40px; border-radius: 8px;border: 0; margin-top:5px ;">立即預約</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>




            </section>

            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
            <!-- JS -->
            <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

            <script>
                const tomorrow = new Date();
                tomorrow.setDate(tomorrow.getDate() + 1); // 明天

                const maxSelectableDate = new Date(tomorrow.getTime() + 89 * 24 * 60 * 60 * 1000); // 明天起 + 89 天 = 共 90 天

                const maxVisibleDate = new Date();
                maxVisibleDate.setFullYear(maxVisibleDate.getFullYear() + 1); // 明年的今天（只顯示用）

                const displayMonth = new Date();
                displayMonth.setMonth(displayMonth.getMonth() - 1);


                flatpickr("#pickupDate", {
                    dateFormat: "m/d",
                    defaultDate: displayMonth,
                    minDate: new Date(),          // 顯示從今天起（含今天）
                    maxDate: maxVisibleDate,      // 顯示到明年的今天
                    enable: [
                        {
                            from: tomorrow,
                            to: maxSelectableDate     // 只有明天~90天內能選
                        }
                    ],
                    showMonths: 3,
                    onDayCreate: function (dobj, dStr, fp, dayElem) {
                        const date = dayElem.dateObj;
                        const day = date.getDay(); // 0=日, 6=六
                        if (date >= tomorrow && date <= maxSelectableDate) {
                            // 加紅字：週六週日
                            if (day === 0 || day === 6) {
                                console.log("有進入")
                                dayElem.classList.add("red-day");
                            }

                            // 自訂紅字：國定假日
                            const holidayList = [
                                "2025-09-17", // 中秋
                                "2025-10-10", // 雙十
                                "2025-12-25"  // 聖誕
                            ];

                            // 用 getFullYear 方式組字串（避免時區錯誤）
                            const dateStr = date.getFullYear() + '-' +
                                String(date.getMonth() + 1).padStart(2, '0') + '-' +
                                String(date.getDate()).padStart(2, '0');

                            console.log("處理日期", dateStr); // ← debug 確認

                            if (holidayList.includes(dateStr)) {
                                dayElem.classList.add("red-day");
                            }
                        }
                    }
                });
                // ✅ 將日期格式化成 "m/d"（例如 "9/1"）
                const tomorrowStr = "0" + (tomorrow.getMonth() + 1) + "/0" + tomorrow.getDate();

                // ✅ 設定 input 初始值（讓畫面上預設就有 m/d）
                document.getElementById("pickupDate").value = tomorrowStr;


                //時間
                const select = document.getElementById("returnTimeSelect");
                const startHour = 8;
                const endHour = 20;

                for (let hour = startHour; hour <= endHour; hour++) {
                    for (let min = 0; min <= 30; min += 30) {

                        // 補 0 變成 2 位數
                        let hh = (hour < 10 ? "0" + hour : "" + hour);
                        let mm = (min === 0 ? "00" : "" + min);

                        let time = hh + ":" + mm;

                        let option = document.createElement("option");
                        option.value = time;
                        option.textContent = time;
                        select.appendChild(option);
                    }
                }
            </script>

            <script>
                function clearFilters() {
                    // 找出所有 name 為 "brand" 的 radio input，並取消勾選
                    const radios = document.querySelectorAll('input[name="brand"]');
                    radios.forEach(radio => {
                        radio.checked = false;
                    });
                }
            </script>


            <script>
                const minR = document.getElementById('minRange');
                const maxR = document.getElementById('maxRange');
                const fill = document.getElementById('fill');
                const minBox = document.getElementById('minBox');
                const maxBox = document.getElementById('maxBox');
                const slider = document.getElementById('priceSlider');

                const STEP = 50;      // 每格 50
                const GAP = 0;       // 允許最小間距（可改成 100 之類避免交疊）

                function fmt(n, max) {
                    const s = Number(n).toLocaleString('zh-TW');
                    return (Number(n) >= max) ? (s + '+') : s;
                }
                function update() {
                    let min = parseInt(minR.value, 10);
                    let max = parseInt(maxR.value, 10);
                    if (max - min < GAP) {
                        if (this === minR) min = max - GAP, minR.value = min;
                        else max = min + GAP, maxR.value = max;
                    }
                    // 更新顯示
                    const minVal = parseInt(minR.min, 10);
                    const maxVal = parseInt(minR.max, 10);
                    minBox.textContent = fmt(min, maxVal);
                    maxBox.textContent = fmt(max, maxVal);

                    // 依百分比設定填色條 left/width
                    const left = ((min - minVal) / (maxVal - minVal)) * 100;
                    const right = ((max - minVal) / (maxVal - minVal)) * 100;
                    fill.style.left = "calc(" + left + "% + 6px)";
                    fill.style.right = "calc(" + (100 - right) + "% + 6px)";
                }






                let isDragging = false;

                // 1️⃣ 按下滑軌後開始追蹤
                slider.addEventListener('mousedown', function (e) {
                    isDragging = true;
                    handleMove(e);
                });

                // 2️⃣ 滑鼠移動時，只要正在拖曳就持續更新
                document.addEventListener('mousemove', function (e) {
                    if (isDragging) {
                        handleMove(e);
                    }
                });

                // 3️⃣ 放開滑鼠時結束拖曳
                document.addEventListener('mouseup', function () {
                    isDragging = false;
                })

                function handleMove(e) {
                    minR.addEventListener('input', update);
                    maxR.addEventListener('input', update);

                    const sliderRect = slider.getBoundingClientRect(); // 整個滑軌的範圍
                    const clickX = e.clientX - sliderRect.left;         // 點擊位置相對滑軌的偏移
                    const sliderWidth = sliderRect.width;               // 滑軌總寬
                    const percent = clickX / sliderWidth;
                    // 對應的數值（假設範圍是 0 ~ 5000）
                    const min = 0;
                    const max = 5000;
                    const value = Math.round(min + (max - min) * percent);

                    const minX = Number(minR.value);
                    const maxX = Number(maxR.value);
                    const distanceToMin = Math.abs(minX - value);
                    const distanceToMax = Math.abs(value - maxX);


                    if (distanceToMin < distanceToMax) {

                        // 靠近 min → 更新 minRange
                        minR.value = value;


                    } else {

                        maxR.value = value;

                        // 靠近 max → 更新 maxRange
                    }
                    update();

                }


                // 啟動時先算一次
                update.call(minR);



            </script>



        </body>

        </html>