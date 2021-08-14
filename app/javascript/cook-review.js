function post() {
  const stars = document.querySelector(".ratings").children;
  const ratingValue = document.getElementById("rating-value");
  const ratingValueDisplay = document.getElementById("rating-value-display");

  for(let i=0; i<stars.length; i++){
    console.log(stars.length)
    // 星にカーソルが乗ったときに実行する関数を定義
    stars[i].addEventListener("mouseover",function(){
      // stars.lengthの値（5）だけ繰り返し
      // つまり、星カーソルが乗った時、5回繰り返される
      for(let j=0; j<stars.length; j++){
        console.log(stars.length)
        // まず全て星をくり抜く
        stars[j].classList.remove("far fa-star");
        stars[j].classList.add("fas fa-star");
      }
      // そのあと星の数だけ以下の関数が繰り返される。
      for(let j=0; j<=i; j++){
        console.log(stars.length)
        stars[j].classList.remove("fas fa-star");
        // カーソルが乗った星まで星を塗りつぶす
        stars[j].classList.add("far fa-star");
      }
    })
    // クリックされた星の番号+1をratingValueに代入
    stars[i].addEventListener("click",function(){
      ratingValue.value = i+1;
      ratingValueDisplay.textContent = ratingValue.value;
      // indexにクリックされた星の番号を代入
      index = i;
    })
    // 星からカーソルが離れたときに実行される関数
    stars[i].addEventListener("mouseout",function(){
      // まず5回繰り返す
      for(let j=0; j<stars.length; j++){
        // まず全ての星をくり抜く
        stars[j].classList.remove("far fa-star");
        stars[j].classList.add("fas fa-star");
      }
      for(let j=0; j<=index; j++){
        // クリックされている星まで塗りつぶす
        stars[j].classList.remove("fas fa-star");
        stars[j].classList.add("far fa-star");
      }
    })
  }
};

window.addEventListener('load', post)