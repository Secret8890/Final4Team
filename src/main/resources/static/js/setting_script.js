const open = () => {
    document.querySelector(".pass_modal").classList.remove("hidden");
    
}

const close = () => {
    document.querySelector(".pass_modal").classList.add("hidden");
}

const passModal = document.querySelector('.pass_modal');

window.onclick = (event)=>{
    if(event.target == passModal) {
        passModal.classList.add("hidden");
    }
}

document.querySelector(".pass_button").addEventListener("click", open);
document.querySelector(".closeBtn").addEventListener("click", close);
document.querySelector(".pass_submit").addEventListener("click", checkConfirm);

function checkConfirm() {
 
}