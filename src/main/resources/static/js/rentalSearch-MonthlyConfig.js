// rentalSearch-config.js
document.addEventListener("DOMContentLoaded", function () {

    // --- 登出提示 ---
    if (window.location.search.includes("action=logout")) {
        alert("您已成功登出，將為您返回首頁！");
        history.replaceState(null, "", window.location.pathname);
        setTimeout(() => { window.location.href = "../login.jsp"; }, 2000);
    }

    // --- 從 JSP session 拿參數 ---
    const config = window.appConfig || {};
    const selectedLocation = config.location || "";
    const selectedStartTime = config.startTime || "08:00";
    const selectedStartDate = config.startDate || "";

    const selectedPeriod = config.period || "";


    

    // --- 取車區域選單 ---
    const locations = ["台北", "新北", "桃園", "台中", "高雄"];
    const locationSelect = document.getElementById("location");
    if(locationSelect){
        locations.forEach(loc => {
            const opt = document.createElement("option");
            opt.value = loc;
            opt.textContent = loc;
            if (loc === selectedLocation) opt.selected = true;
            locationSelect.appendChild(opt);
        });
    }

    // --- 訂閱期間選單 ---
   const periods = [
        { text: "一個月", value: 1 },
        { text: "兩個月", value: 2 },
        { text: "三個月", value: 3 },
        { text: "四個月", value: 4 },
        { text: "五個月", value: 5 },
        { text: "六個月", value: 6 },
        { text: "十二個月", value: 12 }
    ];

    const periodSelect = document.getElementById("period");
    if (periodSelect) {
        periods.forEach(period => {
            const opt = document.createElement("option");
            opt.value = period.value;       // 數字
            opt.textContent = period.text;  // 中文
            // 如果有預設值就選取
            if (String(period.value) === String(selectedPeriod)) opt.selected = true;
            periodSelect.appendChild(opt);
        });
    }

    // --- 產生時間選單（30 分鐘間隔） ---
    function generateTimeOptions(selectId, selectedValue) {
        const select = document.getElementById(selectId);
        if(!select) return;
        select.innerHTML = "";
        for (let h = 8; h < 22; h++) {
            for (let m = 0; m < 60; m += 30) {
                let hh = h.toString().padStart(2, '0');
                let mm = m.toString().padStart(2, '0');
                let timetext = hh + ":" + mm;
                const opt = document.createElement('option');
                opt.value = timetext;
                opt.text = timetext;
                if (timetext === selectedValue) opt.selected = true;
                select.appendChild(opt);
            }
        }
    }

    generateTimeOptions("startTimeSelect", selectedStartTime);
})

// --- flatpickr 日期選擇（直接掛在 input 上） ---
    flatpickr.localize(flatpickr.l10ns.zh);

    const pickupInput = document.getElementById("pickupDatetime");

    function formatDate(date){
        return date.getFullYear() + "/" +
               (date.getMonth()+1).toString().padStart(2,'0') + "/" +
               date.getDate().toString().padStart(2,'0');
    }


// 隱藏的日期範圍選擇器
    let dateRange = flatpickr("#rentalRange", {
        mode: "single",
        dateFormat: "Y/m/d",
        minDate: "today",
        showMonths: 2,
        onClose: function(selectedDates){
            if(selectedDates.length===1){
                // 填回取車、還車日期欄位
                console.log(selectedDates);
                document.getElementById("pickupDatetime").value = formatDate(selectedDates[0]);
            }   
        }
    });
    
    // 點擊任一完整日期時間 input 時顯示隱藏日期範圍
    document.getElementById("pickupDatetime").addEventListener("focus", ()=>{
        document.getElementById("rentalRange").classList.remove('d-none');
        dateRange.open();
    });

    