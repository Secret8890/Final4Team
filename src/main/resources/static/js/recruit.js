const modalHeader = document.querySelector(".incruit_modal_header h2");
const modalFooter = document.querySelector(".incruit_modal_footer h3");
const modalBody = document.querySelector(".incruit_modal_body p");
// Get the modal
const loginModal = document.querySelector('.modal');
const modal = document.querySelector(".incruit_modal");
const modalWork = document.querySelector(".m_worktype");
const modalRegion = document.querySelector(".m_region")
const modalMajor = document.querySelector(".m_major");
// Get the button that opens the modal
const btns = document.querySelectorAll(".show");

// Get the <span> element that closes the modal
const span = document.getElementsByClassName("close")[0];

// When the user clicks the button, open the modal 
/*for (var i=0; i<btns.length; i++){
    btns[i].onclick = () => {
      modal.style.display = "block";
    };   
}*/
btns.forEach(btn =>{
  btn.onclick = () => {
    
    if(btn.classList.contains("btn_work")){
      modalWork.style.display = "block";
    }
    else if(btn.classList.contains("btn_region")){
      modalRegion.style.display = "block";
    }
    else if(btn.classList.contains("btn_major")){
      modalMajor.style.display = "block";
    }
  }
});

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modalWork || event.target == modalRegion || event.target == modalMajor || event.target == loginModal) {
    modalWork.style.display = "none";
    modalRegion.style.display = "none";
    modalMajor.style.display = "none";
    loginModal.style.display = "none"; 
  }
}

const result = document.querySelector(".result");
const result_content = document.querySelector(".result_content")
const detail = document.querySelector(".search_detail");
const basic = document.querySelector(".search_basic");
const expand = document.querySelector(".expand");
const foldButton = document.querySelector(".fold");

const makeli = document.createElement("li");
const makeliText = document.createTextNode("검색결과, 조건을 토대로 DB에서 검색해서 출력해야하니까 이부분은 crud");

const search = document.querySelectorAll(".execute_search");


function fold(event){ //펼치기
  const foldedObjects = document.querySelectorAll(".folded");
  foldedObjects.forEach(element => {
    element.classList.remove("folded");
    element.classList.add("spreaded");
  });
  basic.style.display = "flex";
  detail.style.display = "none"; 
}

expand.onclick = () => { //접기
  const spreadedObjects = document.querySelectorAll(".spreaded");
  spreadedObjects.forEach(element => {
    element.classList.remove("spreaded");
    element.classList.add("folded");
  });
  basic.style.display = "none";
  detail.style.display = "flex";
}

function searching(event){ //검색버튼
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

foldButton.addEventListener("click",fold);
