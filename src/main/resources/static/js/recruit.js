// Get the modal
const modal = document.getElementById("myModal");

// Get the button that opens the modal
const btns = document.querySelectorAll(".show");

// Get the <span> element that closes the modal
const span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
for (var i=0; i<btns.length; i++){
    btns[i].onclick = () => modal.style.display = "block";
}
// When the user clicks on <span> (x), close the modal
span.onclick = function() {
  modal.style.display = "none";
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
const result = document.querySelector(".result");
const result_content = document.querySelector(".result_content")
const detail = document.querySelector(".search_detail");
const basic = document.querySelector(".search_basic");
const expand = document.querySelector(".expand");

const makeli = document.createElement("li");
const makeliText = document.createTextNode("검색결과, 조건을 토대로 DB에서 검색해서 출력해야하니까 이부분은 crud");

const search = document.querySelectorAll(".execute_search");

expand.onclick = () => { 
  basic.style.display = "none";
  detail.style.display = "flex"; 
}

function searching(event){
  search.forEach(element => {
    result.classList.remove("hidden");
    makeli.appendChild(makeliText);
    result_content.appendChild(makeli);
    event.preventDefault();
    
  });
}

[].forEach.call(search, function(s){
  s.addEventListener("click", searching);
})


