const d = document, c = console, w = window, a=alert;

const $ventanaCopiarLink = d.createElement("div");
const $body = d.getElementById("body");

d.addEventListener("DOMContentLoaded",()=>{
    const copyLinkArr = Array.from(d.getElementsByClassName("btn-copiar"));
    copyLinkArr.forEach(element => {
        element.addEventListener("click",desplegarVentanaCopiarLink);
    });
});

function desplegarVentanaCopiarLink(){
    $ventanaCopiarLink.setAttribute("class","copy-link-container");
    $ventanaCopiarLink.innerHTML = `
        <div class="copy_link_modal">
        <button onclick="closeCopyLinkModal()" class="close-btn"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
          <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
        </svg></button> 
        <h5 class="copy_link_modal__text">Copia el enlace de la historia</h5>
        <input disabled type="text" value="http://histority.com/historias/ladecisiondepablo">
        <button onclick="copiarLink(this.previousElementSibling)" class="btn-secundary copyLinkBtn">Copiar link</button>
      </div>
    `;
    $body.appendChild($ventanaCopiarLink);
}
function closeCopyLinkModal(){
    $body.removeChild($ventanaCopiarLink);
}
function copiarLink(input){
    const linkText = input.value;
    navigator.clipboard.writeText(linkText);
}