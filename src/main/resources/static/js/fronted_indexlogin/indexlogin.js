document.addEventListener("DOMContentLoaded", function () {
    const tabs = document.querySelectorAll(".tab");
    const dailyFields = document.querySelectorAll(".daily-field");
    const subscribeFields = document.querySelectorAll(".subscribe-field");
    const form = document.getElementById("searchForm");

    tabs.forEach(tab => {
      tab.addEventListener("click", function () {
        tabs.forEach(t => t.classList.remove("active"));
        this.classList.add("active");

        if (this.dataset.tab === "daily") {
          // 顯示日租欄位，隱藏月租
          dailyFields.forEach(f => f.style.display = "block");
          subscribeFields.forEach(f => f.style.display = "none");
          form.action = "/rental";
        } else if (this.dataset.tab === "subscribe") {
          // 顯示月租欄位，隱藏日租
          dailyFields.forEach(f => f.style.display = "none");
          subscribeFields.forEach(f => f.style.display = "block");
          form.action = "/search";
        }
      });
    });
  });