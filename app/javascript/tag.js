if (location.pathname.match("posts/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("post_name");
    inputElement.addEventListener("keyup", ()=>{
      const keyword = document.getElementById("post_name").value;
      const XHR = new XMLHttpRequest();
      XHR.open("GET", `search/?keyword=${keyword}`, true);
      XHR.responseType = "json";
      XHR.send();
      XHR.onload = ()=>{
        const tagName = XHR.response.keyword;
      };
    });
  });
};