function sum (){
  const sum = document.getElementById('getmoney-income-sum');
  const s = sum.textContent;
  if (s.includes("-")){
    sum.classList.remove('plus');
    sum.classList.add('minus');
  } else{
    sum.classList.remove('minus');
    sum.classList.add('plus');
  }
};

window.addEventListener('load', sum);