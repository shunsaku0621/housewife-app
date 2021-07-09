// function post (){
//   const submit = document.getElementById("post-comment-submit");
//   submit.addEventListener("click", (e)=>{
//     e.preventDefault();
//     const form = document.getElementById("comment-form");
//     const formData = new FormData(form);
//     const test = document.getElementById("comment_text");
//     console.log(test);
//     const XHR = new XMLHttpRequest();
//     XHR.open("POST", `/posts/62/comments`, true);
//     XHR.responseType = "json";
//     XHR.send(formData);
//   });
// };

// window.addEventListener('load', post);
