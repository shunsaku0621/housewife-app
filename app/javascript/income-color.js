function sum (){
  const sum = document.getElementById('getmoney-income-sum');
  const s = sum.textContent;
  if (s.includes("-")){
    sum.classList.remove('l');
    sum.classList.add('a');
  } else{
    sum.classList.remove('a');
    sum.classList.add('l');
  }
};

window.addEventListener('load', sum);