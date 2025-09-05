<%@ page contentType="text/html; charset=UTF-8" %>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>

        <!DOCTYPE html>
        <html lang="zh-Hant">

        <head>
            <meta charset="UTF-8">
            <title>雙桿滑桿</title>
            <style>
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
            </style>
        </head>

        <body>
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






                // let isDragging = false;

                // 1️⃣ 按下滑軌後開始追蹤
                slider.addEventListener('mousedown', function (e) {
                    // isDragging = true;
                    handleMove(e);
                });

                // 2️⃣ 滑鼠移動時，只要正在拖曳就持續更新
                // document.addEventListener('mousemove', function (e) {
                //     if (isDragging) {
                //         handleMove(e);
                //     }
                // });

                // // 3️⃣ 放開滑鼠時結束拖曳
                // document.addEventListener('mouseup', function () {
                //     isDragging = false;
                // })

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
                    console.log("直" + value);
                    console.log("最小" + distanceToMin);
                    console.log("最大" + distanceToMax);

                    if (distanceToMin < distanceToMax) {

                        // 靠近 min → 更新 minRange
                        minR.value = value;
                        console.log("有進入");

                    } else {

                        maxR.value = value;
                        console.log("有進入2");

                        // 靠近 max → 更新 maxRange
                    }
                    update();

                }


                // 啟動時先算一次
                update.call(minR);



            </script>


        </body>

        </html>