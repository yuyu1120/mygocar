document.addEventListener('DOMContentLoaded', function() {
    const cartContainer = document.getElementById('cartContainer');
    const totalAmount = document.getElementById('totalAmount');
    const checkoutBtn = document.getElementById('checkoutBtn');
    const removeAllBtn = document.getElementById('removeAllBtn');

    let cart = [];

    // 取得購物車 JSON
    function fetchCart() {
        fetch('/cart/json')
            .then(res => res.json())
            .then(data => {
                cart = data;
                renderCart();
            })
            .catch(err => console.error("無法取得購物車", err));
    }

    // 渲染購物車
    function renderCart() {
        cartContainer.innerHTML = '';
        if (cart.length === 0) {
            cartContainer.innerHTML = '<p>目前購物車是空的。</p>';
            totalAmount.textContent = '總金額：NT$ 0';
            return;
        }

        let total = 0;
        cart.forEach(item => {
            total += item.monthPrice;

            const row = document.createElement('div');
            row.className = 'd-flex align-items-center mb-3 vehicle-item';

            const imgDiv = document.createElement('div');
            imgDiv.style.width = '100px';
            const img = document.createElement('img');
            img.src = item.vehicleImage;
            img.style.height = '80px';
            imgDiv.appendChild(img);

            const infoDiv = document.createElement('div');
            infoDiv.style.marginLeft = '15px';
            infoDiv.innerHTML = `
                <div><strong>${item.vehicleName}</strong></div>
                <div>品牌：${item.vehicleBrand}</div>
                <div>租期：${item.borrowDateTime} ~ ${item.returnDateTime}</div>
                <div>取車|還車：${item.borrowLocation} | ${item.returnLocation}</div>
                <div>月租：NT$ ${item.monthPrice}</div>
            `;

            row.appendChild(imgDiv);
            row.appendChild(infoDiv);
            cartContainer.appendChild(row);
        });

        totalAmount.textContent = '總金額：NT$ ' + total;
    }

    // 結帳
    if (checkoutBtn) {
        checkoutBtn.addEventListener('click', () => {
            if (confirm('確定要使用 Line Pay 結帳嗎？')) {
                checkoutBtn.disabled = true;
                checkoutBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> 處理中...';
                window.location.href = 'checkout';
            }
        });
    }

    // 清空購物車
    if (removeAllBtn) {
        removeAllBtn.addEventListener('click', () => {
            if (!confirm('確定要清空購物車嗎？')) return;

            removeAllBtn.disabled = true;
            removeAllBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> 清空中...';

            fetch('/cart/clear', { method: 'POST' })
                .then(res => res.json())
                .then(data => {
                    if (data.status === "success") {
                        cart = [];
                        renderCart();
                        removeAllBtn.disabled = false;
                        removeAllBtn.innerHTML = '清空購物車';
                        showMessage('購物車已清空！', 'success');
                    }
                })
                .catch(err => {
                    console.error("清空購物車失敗", err);
                    removeAllBtn.disabled = false;
                    removeAllBtn.innerHTML = '清空購物車';
                    showMessage('清空購物車失敗', 'warning');
                });
        });
    }

    // 顯示訊息
    function showMessage(message, type) {
        const messageArea = document.getElementById('messageArea');
        if (!messageArea) return;

        const alertDiv = document.createElement('div');
        alertDiv.className = 'alert alert-' + type + ' alert-dismissible fade show';
        let icon = type === 'success' ? 'check-circle' : 'exclamation-triangle';

        alertDiv.innerHTML = `<i class="fas fa-${icon}"></i> ${message} <button type="button" class="btn-close" data-bs-dismiss="alert"></button>`;
        messageArea.appendChild(alertDiv);

        setTimeout(() => { if (alertDiv.parentNode) alertDiv.remove(); }, 3000);
    }

    // 初始化
    fetchCart();
});
