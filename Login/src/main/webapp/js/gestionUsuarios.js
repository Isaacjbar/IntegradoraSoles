const a=alert;

const $confirmarBajaContainer = d.createElement("div");
const $body = d.getElementById("body");

d.addEventListener("DOMContentLoaded",()=>{
    const bajaUsuarioBtnArr = Array.from(d.getElementsByClassName("eliminarUsuario"));
    bajaUsuarioBtnArr.forEach(element => {
        element.addEventListener("click",desplegarVentanaConfirmarBaja);
    });
});

function desplegarVentanaConfirmarBaja(){
    $confirmarBajaContainer.setAttribute("class","confirmarBajaContainer");
    $confirmarBajaContainer.innerHTML = `
            <div class="confirmarBaja">
             <button onclick="cancelConfirmarBaja()" class="close-btn"><svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-circle" viewBox="0 0 16 16">
          <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"/>
          <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708"/>
        </svg></button> 
      <h5>¿Seguro que desea dar de baja a este usuario?</h5>
      <div class="botonesConfirmarBaja">
        <button class="btn-secundary-danger" onclick="cancelConfirmarBaja()">Cancelar</button>
        <button class="btn-secundary">Aceptar</button>
      </div>
    </div>
    `;
    $body.appendChild($confirmarBajaContainer);
}
function cancelConfirmarBaja(){
    $body.removeChild($confirmarBajaContainer);
}


