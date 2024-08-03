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
      // ここで手数料や利益の計算ロジックを追加する
    });
  }
});
