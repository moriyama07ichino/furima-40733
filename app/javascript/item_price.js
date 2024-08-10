document.addEventListener('DOMContentLoaded', () => {
  console.log("DOMContentLoaded OK");

  const price = () => {
    console.log("イベント発火 OK");

    // 要素の取得
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    // 取得した要素を確認
    console.log(priceInput);
    console.log(addTaxDom);
    console.log(profitDom);

    // 入力するたびにイベントを発火
    if (priceInput) {
      priceInput.addEventListener("input", () => {
        console.log("イベント発火");

        // 入力された金額の値を取得
        const inputValue = priceInput.value;
        console.log("入力された金額: ", inputValue);

        // 手数料の計算
        const fee = Math.floor(inputValue * 0.1); // 手数料を10%と仮定し、整数に切り捨て

        // 利益の計算
        const profit = Math.floor(inputValue - fee); // 利益も整数に切り捨て

        // 計算結果を表示
        if (addTaxDom) {
          addTaxDom.innerHTML = fee; // 手数料を表示
        }
        if (profitDom) {
          profitDom.innerHTML = profit; // 利益を表示
        }
      });
    }
  };

  window.addEventListener('turbo:load', price);
  window.addEventListener('turbo:render', price);
});





document.addEventListener('DOMContentLoaded', () => {
  console.log("DOMContentLoaded OK");

  const price = () => {

    // 要素の取得
    const priceInput = document.getElementById("item-price");
    const addTaxDom = document.getElementById("add-tax-price");
    const profitDom = document.getElementById("profit");

    if (priceInput) {
      priceInput.addEventListener("input", () => {

        // 入力された金額の値を取得
        const inputValue = priceInput.value;

        // 手数料の計算
        const fee = Math.floor(inputValue * 0.1); // 手数料を10%と仮定し、整数に切り捨て

        // 利益の計算
        const profit = Math.floor(inputValue - fee); // 利益も整数に切り捨て

        // 計算結果を表示
        if (addTaxDom) {
          addTaxDom.innerHTML = fee; // 手数料を表示
        }
        if (profitDom) {
          profitDom.innerHTML = profit; // 利益を表示
        }
      });
    }
  };

  window.addEventListener('turbo:load', price);
  window.addEventListener('turbo:render', price);
});
