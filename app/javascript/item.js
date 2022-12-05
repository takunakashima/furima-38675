
//  window.addEventListener('load', () => {
//   const priceInput = document.getElementById("item-price");
//   priceInput.addEventListener("input", () => {
//   const inputValue = priceInput.value;
//   const addTaxDom = document.getElementById("add-tax-price");
//   addTaxDom.innerHTML = "入力した金額をもとに販売手数料を計算する処理"
//  });

window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
 //  console.log(priceInput)
   priceInput.addEventListener("input", () => {
     const addTaxDom = document.getElementById("add-tax-price");
     // console.log(priceInput.innerHTML);
     addTaxDom.innerHTML = Math.floor(priceInput.value * 0.1 );
     const addPofitDom = document.getElementById("profit");
     // console.log(priceInput.innerHTML);
     addPofitDom.innerHTML = Math.floor(priceInput.value - Math.floor(priceInput.value * 0.1 ))
 })
});
