const join1 = document.querySelector("#join-text-1");
const join2 = document.querySelector("#join-text-2");
fetch("/txt/이용약관동의약관1.txt")
  .then((response) => response.text())
  .then((text) => (join1.value = text));
fetch("/txt/약관2개인정보수집방침.txt")
  .then((response) => response.text())
  .then((text) => (join2.value = text));

document.querySelector('#join').addEventListener('click',()=>{
    loadRegister();
})
function loadRegister() {
  $("#load-section").load("register");
}
