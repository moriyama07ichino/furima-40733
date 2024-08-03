document.addEventListener('DOMContentLoaded', () => {
  console.log("DOMContentLoaded OK");

  window.addEventListener('turbo:load', () => {
    console.log("OK");
  });

  // 要素の取得
  const priceInput = document.getElementById("item-price");
  const feeDisplay = document.getElementById("add-tax-price");
  const profitDisplay = document.getElementById("profit");

  // 取得した要素を確認
  console.log(priceInput);
  console.log(feeDisplay);
  console.log(profitDisplay);

  // 入力するたびにイベントを発火
  if (priceInput) {
    priceInput.addEventListener("input", () => {
      console.log("イベント発火");
      
        // 入力された金額の値を取得
        const inputValue = priceInput.value;
        console.log("入力された金額: ", inputValue);

        // 手数料と利益の計算
        const fee = inputValue * 0.1; // 手数料を10%と仮定
        const profit = inputValue - fee;

        // 計算結果を表示
        if (feeDisplay) {
          feeDisplay.innerHTML = fee.toFixed(2); // 小数点以下2桁まで表示
        }
        if (profitDisplay) {
          profitDisplay.innerHTML = profit.toFixed(2);
        }
    });
  }



});
