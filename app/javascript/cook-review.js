function post (){
  const stars = document.querySelector(".ratings").children;
  const ratingValue = document.getElementById("rating-value");
  const ratingValueDisplay = document.getElementById("rating-value-display");

  let index;


  for(let i=0; i<stars.length; i++){


    // 星にカーソルが乗ったときに実行する関数を定義
    stars[i].addEventListener("mouseover", ()=>{
      for(let j=0; j<stars.length; j++){
        // まず全て星をくり抜く
        stars[j].classList.remove("fas");
        stars[j].classList.add("far");
      }

      // そのあと星の数だけ以下の関数が繰り返される。
      for(let j=0; j<=i; j++){
  
        stars[j].classList.remove("far");
        // カーソルが乗った星まで星を塗りつぶす
        stars[j].classList.add("fas");
      }
    })



    // クリックされた星の番号+1をratingValueに代入
    stars[i].addEventListener("click", ()=>{
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
        stars[j].classList.remove("fas");
        stars[j].classList.add("far");
      }
      for(let j=0; j<=index; j++){
        // クリックされている星まで塗りつぶす
        stars[j].classList.remove("far");
        stars[j].classList.add("fas");
      }
    })
  }



};

window.addEventListener('load', post);