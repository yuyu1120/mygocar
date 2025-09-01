const startDateInput = document.getElementById("startTimeSelect");
const endDateInput = document.getElementById("endTimeSelect");

// 設定 min 為明天（預防今天以前日期被填）
const today = new Date();
const tomorrow = new Date(today);
tomorrow.setDate(today.getDate());

const minDateStr = tomorrow.toISOString().split("T")[0];
startDateInput.min = minDateStr;
endDateInput.min = minDateStr;

startDateInput.addEventListener('change', () => {
    if (startDateInput.value) {
        endDateInput.min = startDateInput.value;

        if (endDateInput.value && endDateInput.value < startDateInput.value) {
            endDateInput.value = startDateInput.value;
        }
    } else {
        endDateInput.min = minDateStr; // 回到明天
    }
});

endDateInput.addEventListener('change', () => {
    if (endDateInput.value) {
        startDateInput.max = endDateInput.value;

        if (startDateInput.value && startDateInput.value > endDateInput.value) {
            startDateInput.value = endDateInput.value;
        }
    } else {
        startDateInput.max = ""; // 清除限制
    }
});

function validateDates() {
    if (!startDateInput.value || !endDateInput.value) return true;

    if (startDateInput.value > endDateInput.value) {
        alert("開始時間不能晚於結束時間！");
        return false;
    }
    return true;
}

