const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);

  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("sold_item[card_number]"),
      cvc: formData.get("sold_item[security_code]"),
      exp_month: formData.get("sold_item[expiration_month]"),
      exp_year: `20${formData.get("sold_item[expiration_year]")}`,
    };
    console.log(card)
    console.log(process.env.PAYJP_PUBLIC_KEY)

    Payjp.createToken(card, (status, response) => {
      console.log(response)
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden"> `;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("card-number").removeAttribute("name");
      document.getElementById("card-cvc").removeAttribute("name");
      document.getElementById("card-exp-month").removeAttribute("name");
      document.getElementById("card-exp-year").removeAttribute("name");

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);