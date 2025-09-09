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
                    background-color: blanchedalmond;
                }

                .carInfo-container {
                    display: grid;
                    grid-template-areas:
                        "top"
                        "wrapper"
                        "recommend";


                    justify-content: center;
                    align-content: center;
                    background-color: antiquewhite
                }

                .top {
                    grid-area: top;
                    display: flex;


                }

                .car-img {
                    width: 450px;
                    height: 350px;
                    border-radius: 8px;
                }

                .car-info {
                    display: flex;
                    flex-direction: column;
                    width: 400px;
                    height: 350px;
                    background-color: white;
                }




                .car-info .price {

                    font-size: 18px;
                    color: #d32f2f;
                }

                .car-info .actions {
                    display: flex;
                    margin-top: 10px;
                    justify-content: space-evenly;
                }

                .car-info .actions button {


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

                .info-wrapper {
                    grid-area: wrapper;
                    display: flex;



                    flex-wrap: wrap;
                    /* 小螢幕會自動換行 */
                }





                /* 詳細資訊跟評論 */
                .info-tabs-container {
                    width: 450px;
                    height: 350px;
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


                .notice-section {
                    width: 400px;
                    height: 350px;
                    padding: 20px;


                    font-size: 16px;
                    line-height: 1.8;
                    color: #333;
                }

                .notice-section h3 {
                    margin-bottom: 12px;
                    font-size: 20px;
                    color: #c0392b;
                    font-weight: bold;
                }

                .notice-section ul {
                    padding-left: 24px;
                    margin: 0;
                }

                .notice-section li {
                    margin-bottom: 8px;
                }



                .vehicle-specs {
                    list-style: none;
                    padding: 0;
                    margin: 0;
                }

                .vehicle-specs li {
                    margin-bottom: 10px;
                    font-size: 16px;
                    color: #333;
                }

                .vehicle-specs li strong {
                    color: #555;
                }

                .review {
                    display: flex;
                }

                .memberName {
                    display: block;
                    width: 100px;
                }

                /* 推薦汽車 */
                .car-recommend {
                    grid-area: recommend;
                    padding: 40px;

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
            <section class="carInfo-section">
                <div class="carInfo-container">
                    <div class="top mt-5">
                        <div class="car-img">
                            <img src="https://picsum.photos/450/350?image=100" alt="車輛圖片">
                        </div>
                        <div class="car-info ps-3">
                            <div class="rating mt-3 pe-3">
                                ⭐${avgRating} / 5<br>
                                成交次數：${recordCount} 筆
                            </div>
                            <h1 class="pt-2">${vehicle.type}</h1>
                            <div class="meta ml-5 pt-2 " style="font-size: 24px; font-weight: 500;">地區：${plan.region}
                            </div>
                            <div class="meta pt-1" style="font-size: 24px; font-weight: 500;">年份：${plan.year} 年</div>
                            <div class="price pt-1" style="font-size: 24px; font-weight: 500;">日費NT$${plan.daily_Price}
                            </div>
                            <div class="price pt-1" style="font-size: 24px; font-weight: 500;">里程費 NT$${plan.km_Fee}
                            </div>
                            <div class="actions ">
                                <button class="btn-secondary">⭐ 收藏</button>
                                <button class="btn-secondary">🔗 複製連結</button>
                                <button class="btn-primary ">立即預約</button>
                            </div>
                        </div>
                    </div>
                    <div class="info-wrapper mt-3 mb-3">
                        <div class="info-tabs-container">
                            <h3>📖 詳細資訊 / 評論</h3>
                            <div class="tabs">
                                <button class="active" onclick="switchTab('tab1')">詳細資訊</button>
                                <button onclick="switchTab('tab2')">所有評論</button>
                            </div>
                            <div class="tab-content">
                                <div id="tab1" class="tab-pane active">
                                    <ul class="vehicle-specs">
                                        <li><strong>車型：</strong>${vehicle.type}</li>
                                        <li><strong>出廠年份：</strong> ${vehicle.year}</li>
                                        <li><strong>傳動方式：</strong> ${vehicle.transmission}</li>
                                        <li><strong>排氣量：</strong>${vehicle.engine}</li>
                                        <li><strong>油耗：</strong> 市區 ${vehicle.fuelConsumptionCity}km/L，高速
                                            ${vehicle.fuelConsumptionHighway}km/L</li>
                                        <li><strong>核載人數：</strong> ${vehicle.seatCount}人</li>
                                        <li><strong>車輛配備：</strong> ${vehicle.equipment}</li>
                                        <li><strong>車身顏色：</strong> ${vehicle.color}</li>
                                    </ul>
                                </div>
                                <div id="tab2" class="tab-pane" style="display:none">
                                    <c:forEach var="review" items="${reviews}">
                                        <div class="review">
                                            <span class="memberName"><strong>${review.memberName}</strong></span>

                                            <span>
                                                <span class="star-rating">
                                                    <c:forEach var="i" begin="1" end="5">
                                                        <c:choose>
                                                            <c:when test="${i <= review.rating}">
                                                                <span style="color: gold;">★</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span style="color: lightgray;">★</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </span>
                                            </span>

                                            <span>${review.comment}</span>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>


                        <div class="notice-section">
                            <h3>📌 訂閱須知（日租）</h3>
                            <ul class="notice">
                                <li>日租費用不含保險與配件。</li>
                                <li>訂單成立後請準時取車，逾時需額外計費。</li>
                                <li>里程費每公里 NT$2.8。</li>
                                <li>取消訂單請於 24 小時前完成。</li>
                                <li>車輛皆為定期保養與清潔。</li>
                            </ul>
                        </div>


                    </div>


                    <div class="car-recommend">
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
                    </div>
                </div>
            </section>


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