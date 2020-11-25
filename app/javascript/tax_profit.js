function price() {
   const priceInput = document.getElementById("item-price");
      priceInput.addEventListener('input', () => {
      const inputValue = priceInput.value;
      const priceTax = document.getElementById("add-tax-price");
      const priceProfit = document.getElementById('profit');
      priceTax.innerHTML = inputValue/10;
      priceProfit.innerHTML = inputValue - inputValue/10;
   });
};

window.addEventListener("DOMContentLoaded", price)