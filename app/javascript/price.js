window.addEventListener('load', () => {
  const price = document.getElementById("item-price");
  const tax = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");
  
  price.addEventListener('input', function(){
    const sell_price = price.value;
    tax.innerHTML = sell_price * 0.1;
    profit.innerHTML = sell_price * 0.9;
  });
});