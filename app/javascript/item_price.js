document.addEventListener('DOMContentLoaded', () => {
  console.log("DOMContentLoaded OK");
});
window.addEventListener('turbo:load', () => {
  console.log("OK");
});

// 1. 要素の取得
const priceInput = document.getElementById("item-price");
console.log(priceInput);

const feeDisplay = document.getElementById("add-tax-price");
console.log(feeDisplay);

const profitDisplay = document.getElementById("profit");
console.log(profitDisplay);

