if (location.pathname.match("posts/new")){
  document.addEventListener("DOMContentLoaded", () => {
    const inputElement = document.getElementById("post_name");
    inputElement.addEventListener("keyup", ()=>{
      const keyword = document.getElementById("post_name").value;
      console.log(keyword);
    });
  });
};