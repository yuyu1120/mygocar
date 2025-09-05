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
                    background-color: bisque;

                }

                .vihicle-container {
                    background-color: #f0f2f5;
                    width: 1000px;
                    height: 800ox;
                    margin: 100px auto;
                }

                /* -------- 上方分類選單 -------- */
                .top-menu {
                    display: flex;
                    flex-wrap: wrap;
                    justify-content: center;
                    background: #f5f5f5;
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
                    padding-left: 50px;
                    font-size: 14px;
                    color: #666;
                }

                /* 汽車 */

                .card-list {
                    display: grid;
                    grid-template-columns: repeat(3, 1fr);
                    gap: 10px;
                    justify-items: center;

                    width: 1000px;
                    height: 1450px;


                }


                .car-card {

                    background: white;
                    border-radius: 12px;
                    box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
                    width: 300px;
                    height: 450px;
                    margin-top: 20px;



                }

                .car-header-container {
                    position: relative;
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

                    width: 300px;
                    height: 250px;
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
                    position: absolute;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    top: 240px;
                    left: 10px;
                    background: #ffa726;
                    color: white;
                    width: 70px;
                    height: 30px;
                    font-size: 15px;

                    border-radius: 4px;
                    margin: 8px 0;
                    z-index: 999;
                }

                .price-info {
                    display: flex;

                    text-align: center;
                    background: #f1f3f5;
                    border-radius: 8px;

                    height: 80px;
                    width: 300px;
                }

                .price-row {
                    display: flex;
                    flex-direction: column;
                    width: 110px;
                    justify-content: center;
                    align-items: center;


                }

                .price-row del {
                    color: #999;
                    font-size: 12px;
                }



                .arrow-btn {
                    display: block;
                    font-size: 20px;
                    color: #2b80ff;
                    margin: auto auto;
                    border: 2px solid blue;
                    width: 50px;
                    height: 50px;
                    padding-top: 7px;
                    border-radius: 50%;
                }
            </style>

        </head>

        <body>
            <section class="vihicle-section">
                <div class="vihicle-container">
                    <!-- 🔵 上方分類選單 -->
                    <div class="vehicel-search">
                        <div class="top-menu">
                            <button class="active">熱門優惠</button>
                            <button>熱銷車款</button>
                            <button>超激優惠</button>
                            <button>N7限時優惠</button>
                            <button>電車供應</button>
                            <button>限時推薦</button>
                            <span class="filter-bar">
                                年份 ｜ 月租費 ↓
                            </span>
                        </div>

                        <!-- 🔵 篩選條件（右上角） -->

                    </div>
                    <!-- 🔵 車輛列表 -->
                    <div class="card-list">
                        <c:forEach var="plan" items="${rentalPlans}">
                            <!-- 🟡 一台車 -->
                            <div class="car-card">

                                <div class="car-header-container">
                                    <div class="car-header">🏆 全球熱銷 實力派車款 🏆

                                    </div>
                                    <img src="${plan.image_url}" alt="TOYOTA ALTIS">
                                    <div class="car-body">
                                        <div class="tag">${plan.promotion}
                                        </div>

                                        <span
                                            class="car-meta">${plan.year}</span><span>年｜</span></span>${plan.region}</span>
                                        <div class="car-name">${plan.model}</div>
                                    </div>

                                </div>

                                <div class="price-info">

                                    <div class="price-row">
                                        <div>優惠日費</div>
                                        <div style="color: #d32f2f;"><span>NT$</span><span>${plan.daily_Price}</span>
                                        </div>
                                    </div>
                                    <div class="price-row">
                                        <div>里程費</div>
                                        <div>NT$</span><span>${plan.km_Fee}</div>
                                    </div>
                                    <div class="arrow-btn">
                                        <a href="/rental/detail?rentalPlanId=${plan.id}"
                                            style="text-decoration: none;">→</a>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>





                    </div>

                    <!-- 分頁按鈕 -->
                    <nav>
                        <ul class="pagination justify-content-center">
                            <c:if test="${currentPage > 1}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage - 1}">上一頁</a>
                                </li>
                            </c:if>

                            <c:forEach var="i" begin="1" end="${totalPages}">
                                <li class="page-item ${i == currentPage ? 'active' : ''}">
                                    <a class="page-link" href="?page=${i}">${i}</a>
                                </li>
                            </c:forEach>

                            <c:if test="${currentPage < totalPages}">
                                <li class="page-item">
                                    <a class="page-link" href="?page=${currentPage + 1}">下一頁</a>
                                </li>
                            </c:if>
                        </ul>
                    </nav>
            </section>
        </body>

        </html>