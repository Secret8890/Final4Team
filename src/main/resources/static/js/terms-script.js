const join1 = document.querySelector("#join-text-1");
const join2 = document.querySelector("#join-text-2");
fetch("/txt/이용약관동의약관1.txt")
  .then((response) => response.text())
  .then((text) => (join1.value = text));
fetch("/txt/약관2개인정보수집방침.txt")
  .then((response) => response.text())
  .then((text) => (join2.value = text));


$(document).ready(function(){
  document.querySelector('#join').addEventListener('click',()=>{
    loadRegister();
  });
})
function allCheck(){
  if($('#allCheck').is(':checked')){
    $("input[name='check1'][value='accept']").prop("checked", true);
    $("input[name='check2'][value='accept']").prop("checked", true);
  } else {
    $("input[name='check1'][value='not']").prop("checked", true);
    $("input[name='check2'][value='not']").prop("checked", true);
  }
}
  

function loadRegister() {
  const chk1 = $('input:radio[name=check1]:checked').val();
  const chk2 = $('input:radio[name=check2]:checked').val();
  if(chk1 === 'accept' && chk2 === 'accept'){
    $("#load-section").load("join");
  } else {
    alert('모든 약관에 동의해주셔야 진행 가능합니다.');
  }
}
