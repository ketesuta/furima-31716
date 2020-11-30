window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
console.log(priceInput);
priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTAxDom = document.getElementById("add-tax-price")
    addTAxDom.innerHTML = Math.floor(inputValue * 0.1)
    const addProfit = document.getElementById("profit")
    addProfit.innerHTML = Math.floor(inputValue * 0.9)
})
});