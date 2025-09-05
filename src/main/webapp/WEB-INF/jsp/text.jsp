<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!doctype html>
        <html lang="zh-Hant">

        <head>
            <meta charset="utf-8" />
            <meta name="viewport" content="width=device-width, initial-scale=1" />
            <title>價格篩選 + 特色列</title>
            <style>
                body {
                    font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Noto Sans TC", sans-serif;
                    background: #f7f7f7;
                    margin: 0;
                    padding: 24px
                }

                .card {
                    background: #fff;
                    border-radius: 16px;
                    box-shadow: 0 8px 24px rgba(0, 0, 0, .06);
                    padding: 24px;
                    max-width: 820px;
                    margin: auto
                }

                /* 標題列 */
                .card h3 {
                    margin: 0 0 4px
                }

                .card .sub {
                    color: #94a3b8;
                    font-size: 14px
                }

                /* 雙滑桿容器 */
                .range-wrap {
                    margin-top: 20px
                }

                .price-io {
                    display: flex;
                    gap: 12px;
                    align-items: center;
                    margin: 10px 0 18px
                }



                .slider {
                    position: relative;
                    height: var(--thumb);
                    display: flex;
                    align-items: center;
                    padding: 0 6px;
                    border-radius: 999px;
                    background: #f1f5f9;
                    box-shadow: inset 0 0 0 1px #e2e8f0;

                }

                :root {
                    --track-h: 10px;
                    --thumb: 24px;
                    --blue: #0d6efd;
                    --blue-200: #9fd0ff;
                    --gray: #e9ecef;
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

                .active {
                    pointer-events: none !important;
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

                /* 特色列 */
                .features {
                    display: grid;
                    grid-template-columns: repeat(4, minmax(0, 1fr));
                    gap: 18px;
                    margin-top: 28px
                }

                .feat {
                    background: #fff;
                    border: 1px solid #eef2f7;
                    border-radius: 14px;
                    padding: 16px;
                    text-align: center
                }

                .feat .ico {
                    font-size: 28px;
                    line-height: 1
                }

                .feat .name {
                    margin-top: 8px;
                    font-weight: 700
                }

                .feat .desc {
                    margin: 8px 0 0;
                    color: #64748b;
                    font-size: 14px;
                    text-align: left
                }


                .note-box {
                    background: #fff;
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
            </style>
        </head>

        <body>

            <div class="card">
                <h3>顯示更多條件</h3>
                <div class="sub">日租金</div>

                <!-- 金額顯示 -->
                <div class="price-io">
                    <div id="minBox" class="box">0</div>
                    <div class="to">至</div>
                    <div id="maxBox" class="box">5,000+</div>
                </div>

                <!-- 雙滑桿 -->
                <div class="range-wrap">
                    <div class="slider" id="priceSlider">
                        <div class="track" id="fill"></div>

                        <input id="minRange" class="active" style=" position: absolute;" type="range" min="0" max="5000"
                            value="0" step="50" />

                        <input id="maxRange" class="active" style=" position: absolute;" type="range" min="0" max="5000"
                            value="5000" step="50" />

                    </div>
                </div>

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
            </div>

            <div class="note-box">
                <ul>
                    <li>車型名稱加註＊者為進口車型。</li>
                    <li>各車型照片之顏色、內裝配備等僅供參考，實際租用車輛依現場取車為準。</li>
                    <li>不指定車型：將依調度提供同等級車輛，後續將有專人與您聯繫相關事宜。</li>
                </ul>
            </div>


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


            </script>
        </body>

        </html>