window.addEventListener('load', () => {


  const priceInput = document.getElementById("item-price");
    priceInput.addEventListener("input", () => {

    const inputValue = priceInput.value;


    const addTaxDom = document.getElementById("add-tax-price");
    const fee = Math.floor(inputValue * 0.1); 
    addTaxDom.innerHTML = fee ;

    const profitNumber = document.getElementById("profit");
    profitNumber.innerHTML = inputValue - fee ;
})});
  
