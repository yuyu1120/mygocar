document.addEventListener('DOMContentLoaded', function() {
    const cartContainer = document.getElementById('cartContainer');
    const totalAmount = document.getElementById('totalAmount');
    const checkoutBtn = document.getElementById('checkoutBtn');
    const removeAllBtn = document.getElementById('removeAllBtn');
    const messageArea = document.getElementById('messageArea');

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

    // // 渲染購物車
    // function renderCart() {
    //     cartContainer.innerHTML = '';
    //     if (cart.length === 0) {
    //         cartContainer.innerHTML = '<p>目前購物車是空的。</p>';
    //         totalAmount.textContent = '總金額：NT$ 0';
    //         return;
    //     }

    //     let total = 0;
    //     const rowWrapper = document.createElement('div');
    //     rowWrapper.className = 'row g-3';

    //     cart.forEach(item => {
    //         total += Number(item.monthPrice) || 0;

    //         const col = document.createElement('div');
    //         col.className = 'col-12';

    //         const card = document.createElement('div');
    //         card.className = 'card flex-row align-items-center p-2 shadow-sm';

    //         // 圖片
    //         const img = document.createElement('img');
    //         img.src = `/img/cars/${item.vehicleImage}`;
    //         img.className = 'card-img-left rounded';
    //         img.style.width = '120px';
    //         img.style.height = '80px';
    //         img.style.objectFit = 'cover';
    //         img.alt = item.vehicleName;

    //         // 文字資訊
    //         const cardBody = document.createElement('div');
    //         cardBody.className = 'card-body';
    //         cardBody.innerHTML = `
    //             <h5 class="card-title mb-1">${item.vehicleName}</h5>
    //             <p class="card-text mb-1">品牌：${item.vehicleBrand}</p>
    //             <p class="card-text mb-1">租期：${item.borrowDateTime} ~ ${item.returnDateTime}</p>
    //             <p class="card-text mb-1">取車|還車：${item.borrowLocation} | ${item.returnLocation}</p>
    //             <p class="card-text mb-0 fw-bold">月租：NT$ ${item.monthPrice}</p>
    //         `;

    //         // 刪除按鈕（Ajax）
    //         const actionsDiv = document.createElement('div');
    //         actionsDiv.className = 'card-actions ms-auto pe-2';
    //         const deleteBtn = document.createElement('button');
    //         deleteBtn.type = 'button';
    //         deleteBtn.className = 'btn btn-sm btn-outline-danger';
    //         deleteBtn.innerHTML = '<i class="fas fa-trash"></i> 刪除';

    //         // 點擊刪除事件
    //         deleteBtn.addEventListener('click', () => {
    //             if (!confirm('確定要刪除嗎？')) return;

    //             fetch('/cart/remove', {
    //                 method: 'POST',
    //                 headers: {'Content-Type': 'application/json'},
    //                 body: JSON.stringify({
    //                     vehicleId: item.vehicleId,
    //                     borrowDateTime: item.borrowDateTime,
    //                     returnDateTime: item.returnDateTime,
    //                     borrowLocation: item.borrowLocation,
    //                     returnLocation: item.returnLocation
    //                 })
    //             })
    //             .then(res => res.json())
    //             .then(data => {
    //                 if (data.status === 'success') {
    //                     // 從 cart 陣列移除該項目
    //                     cart = cart.filter(c => !(c.vehicleId === item.vehicleId &&
    //                                             c.borrowDateTime === item.borrowDateTime &&
    //                                             c.returnDateTime === item.returnDateTime &&
    //                                             c.borrowLocation === item.borrowLocation &&
    //                                             c.returnLocation === item.returnLocation));
    //                     renderCart();
    //                     showMessage('已刪除該項目', 'success');
    //                 } else {
    //                     showMessage('刪除失敗', 'warning');
    //                 }
    //             })
    //             .catch(err => {
    //                 console.error(err);
    //                 showMessage('刪除失敗', 'danger');
    //             });
    //         });

    //         actionsDiv.appendChild(deleteBtn);

    //         card.appendChild(img);
    //         card.appendChild(cardBody);
    //         card.appendChild(actionsDiv);
    //         col.appendChild(card);
    //         rowWrapper.appendChild(col);
    //     });

    //     cartContainer.appendChild(rowWrapper);
    //     totalAmount.textContent = '總金額：NT$ ' + total;
    // }
function renderCart() {
    const cartContainer = document.getElementById('cartContainer');
    const totalAmount = document.getElementById('totalAmount');

    if (!cartContainer || !totalAmount) return;

    cartContainer.innerHTML = '';

    if (!cart || cart.length === 0) {
        cartContainer.innerHTML = '<p>目前購物車是空的。</p>';
        totalAmount.textContent = '總金額：NT$ 0';
        return;
    }

    let total = 0;
    const rowWrapper = document.createElement('div');
    rowWrapper.className = 'row g-3';
    console.log(cart);
    cart.forEach(item => {

        // 計算總金額
        // let itemPrice = item.pricingStrategyType === 'monthly'
        //     ? item.monthPrice * item.rentalQuantity
        //     : item.dayPrice * item.rentalQuantity;
         let unitprice = 0;
        if(item.pricingStrategyType === 'monthly'){
            unitprice = item.monthPrice
        }else if(item.pricingStrategyType === 'daily'){
            unitprice = item.dayPrice
        }
        let itemPrice = unitprice * item.rentalQuantity

        total += Number(itemPrice);

        const col = document.createElement('div');
        col.className = 'col-12';

        const card = document.createElement('div');
        card.className = 'card flex-row align-items-center p-2 shadow-sm';

        // 圖片
        const img = document.createElement('img');
        img.src = `/img/cars/${item.vehicleImage || 'default.jpg'}`;
        img.className = 'card-img-left rounded';
        img.style.width = '120px';
        img.style.height = '80px';
        img.style.objectFit = 'cover';
        img.alt = item.vehicleName || '車輛圖片';

        // 文字資訊
        const cardBody = document.createElement('div');
        cardBody.className = 'card-body';

        const typeLabel = item.pricingStrategyType === 'monthly' ? '月租' : '日租';

        cardBody.innerHTML = `
            <h5 class="card-title mb-1">${item.vehicleName}</h5>
            <p class="card-text mb-1">品牌：${item.vehicleBrand || '-'}</p>
            <p class="card-text mb-1">租期：${item.borrowDateTime} ~ ${item.returnDateTime}</p>
            <p class="card-text mb-1">取車|還車：${item.borrowLocation} | ${item.returnLocation}</p>
            <p class="card-text mb-0 fw-bold">${typeLabel}小計：NT$ ${itemPrice} (=${unitprice} * ${item.rentalQuantity})</p>
        `;

        // 刪除按鈕
        const actionsDiv = document.createElement('div');
        actionsDiv.className = 'card-actions ms-auto pe-2';
        const deleteBtn = document.createElement('button');
        deleteBtn.type = 'button';
        deleteBtn.className = 'btn btn-sm btn-outline-danger';
        deleteBtn.innerHTML = '<i class="fas fa-trash"></i> 刪除';

        deleteBtn.addEventListener('click', () => {
            if (!confirm('確定要刪除嗎？')) return;

            fetch('/cart/remove', {
                method: 'POST',
                headers: {'Content-Type': 'application/json'},
                body: JSON.stringify({
                    vehicleId: item.vehicleId,
                    borrowDateTime: item.borrowDateTime,
                    returnDateTime: item.returnDateTime,
                    borrowLocation: item.borrowLocation,
                    returnLocation: item.returnLocation,
                    rentalType: item.pricingStrategyType
                })
            })
            .then(res => res.json())
            .then(data => {
                if (data.status === 'success') {
                    cart = cart.filter(c => !(
                        c.vehicleId === item.vehicleId &&
                        c.borrowDateTime === item.borrowDateTime &&
                        c.returnDateTime === item.returnDateTime &&
                        c.borrowLocation === item.borrowLocation &&
                        c.returnLocation === item.returnLocation &&
                        c.pricingStrategyType === item.pricingStrategyType
                    ));
                    renderCart();
                    showMessage('已刪除該項目', 'success');
                } else {
                    showMessage('刪除失敗', 'warning');
                }
            })
            .catch(err => {
                console.error(err);
                showMessage('刪除失敗', 'danger');
            });
        });

        actionsDiv.appendChild(deleteBtn);

        card.appendChild(img);
        card.appendChild(cardBody);
        card.appendChild(actionsDiv);
        col.appendChild(card);
        rowWrapper.appendChild(col);
    });

    cartContainer.appendChild(rowWrapper);
    totalAmount.textContent = '總金額：NT$ ' + total;
}




    // 刪除單一商品
    function removeItem(vehicleId) {
        fetch('/cart/remove', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ vehicleId })
        })
        .then(res => res.json())
        .then(data => {
            if(data.status === 'success') {
                cart = cart.filter(i => i.vehicleId !== vehicleId);
                renderCart();
                showMessage('商品已刪除', 'success');
            } else {
                showMessage('刪除失敗', 'warning');
            }
        })
        .catch(err => {
            console.error(err);
            showMessage('刪除失敗', 'warning');
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
                        showMessage('購物車已清空！', 'success');
                    } else {
                        showMessage('清空購物車失敗', 'warning');
                    }
                    removeAllBtn.disabled = false;
                    removeAllBtn.innerHTML = '<i class="fas fa-trash"></i> 清空購物車';
                })
                .catch(err => {
                    console.error("清空購物車失敗", err);
                    showMessage('清空購物車失敗', 'warning');
                    removeAllBtn.disabled = false;
                    removeAllBtn.innerHTML = '<i class="fas fa-trash"></i> 清空購物車';
                });
        });
    }

    // 結帳
    if (checkoutBtn) {
        checkoutBtn.addEventListener('click', () => {
            
            if (cart.length === 0) {
                showMessage('購物車為空，無法結帳', 'warning');
                return;
            }

            if (confirm('確定要使用 Line Pay 結帳嗎？')) {
                // 改按鈕文字 & 禁用按鈕
                checkoutBtn.disabled = true;
                checkoutBtn.innerHTML = `
                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                    處理中...
                `;

                // 模擬延遲或立即跳轉
                setTimeout(() => {
                    window.location.href = 'checkout';
                }, 500); // 0.5秒延遲，給使用者感覺
            }
        });
    }

    // 顯示訊息
    function showMessage(message, type) {
        if (!messageArea) return;

        const alertDiv = document.createElement('div');
        alertDiv.className = 'alert alert-' + type + ' alert-dismissible fade show';
        let icon = type === 'success' ? 'check-circle' : 'exclamation-triangle';

        alertDiv.innerHTML = `<i class="fas fa-${icon}"></i> ${message} 
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>`;
        messageArea.appendChild(alertDiv);

        setTimeout(() => { if (alertDiv.parentNode) alertDiv.remove(); }, 3000);
    }

    // 初始化
    fetchCart();
});
