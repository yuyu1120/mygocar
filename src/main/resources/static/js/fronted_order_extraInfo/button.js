document.querySelectorAll('.quantity-container').forEach(container => {
    const decreaseBtn = container.querySelector('.decrease');
    const increaseBtn = container.querySelector('.increase');
    const countSpan = container.querySelector('.count');

    let count = 0;

    function updateButtons() {
      decreaseBtn.disabled = count <= 0;
    }

    decreaseBtn.addEventListener('click', () => {
      if (count > 0) {
        count--;
        countSpan.textContent = count;
        updateButtons();
      }
    });

    increaseBtn.addEventListener('click', () => {
      count++;
      countSpan.textContent = count;
      updateButtons();
    });

    updateButtons();
  });