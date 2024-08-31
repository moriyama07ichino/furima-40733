const pay = () => {
  const publicKey = gon.public_key; // エラーが発生している部分
  const payjp = Payjp(publicKey);
  const elements = payjp.elements();
  const numberElement = elements.create('cardNumber');
  const expiryElement = elements.create('cardExpiry');
  const cvcElement = elements.create('cardCvc');

  numberElement.mount('#number-form');
  expiryElement.mount('#expiry-form');
  cvcElement.mount('#cvc-form');

  const submitButton = document.getElementById('button');
  submitButton.addEventListener('click', (event) => {
    event.preventDefault();

    console.log("購入ボタンがクリックされました"); // イベントが発火していることを確認

    // カード情報のトークン生成
    payjp.createToken(numberElement).then((response) => {
      if (response.error) {
        console.log("トークン生成エラー: ", response.error); // エラーメッセージをログに表示
        alert(response.error.message);
      } else {
        // トークンの取得
        const token = response.id;
        console.log("トークンが生成されました: ", token); // トークンが生成されたことを確認
        // トークンをフォームに追加
        const form = document.getElementById('charge-form');
        const tokenInput = document.createElement('input');
        tokenInput.setAttribute('type', 'hidden');
        tokenInput.setAttribute('name', 'token');
        tokenInput.setAttribute('value', token);
        form.appendChild(tokenInput);

        // フォームの送信
        form.submit();
      }
    });
  });
};

window.addEventListener("turbo:load", pay);