window.addEventListener('load', () => {
  console.log("OK");

  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {
    console.log("イベント発火");
    const inputValue = priceInput.value;
    console.log(inputValue);

    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = inputValue * 0.1;
  });
});
  
