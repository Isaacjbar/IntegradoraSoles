const d = document;
const $confirmarBajaContainer = d.createElement("div");
const $body = d.getElementById("body");
let currentForm = null;

d.addEventListener("DOMContentLoaded", () => {
    const bajaUsuarioBtnArr = Array.from(d.getElementsByClassName("eliminarUsuario"));
    bajaUsuarioBtnArr.forEach(element => {
        element.addEventListener("click", desplegarVentanaConfirmarBaja);
    });
});

function desplegarVentanaConfirmarBaja(event) {
    event.preventDefault(); // Evitar el comportamiento por defecto del botón

    currentForm = event.target.closest("form");

    $confirmarBajaContainer.setAttribute("class", "confirmarBajaContainer");
    $confirmarBajaContainer.innerHTML = `
        <div class="confirmarBaja">
            <h5>¿Seguro que desea dar de baja a este usuario?</h5>
            <div class="botonesConfirmarBaja">
                <button class="btn-secundary-danger" onclick="cancelConfirmarBaja()">Cancelar</button>
                <button class="btn-secundary" onclick="confirmarBajaUsuario()">Aceptar</button>
            </div>
        </div>
    `;
    $body.appendChild($confirmarBajaContainer);
}

function confirmarBajaUsuario() {
    if (currentForm) {
        currentForm.submit(); // Enviar el formulario
    }
    cancelConfirmarBaja();
}

function cancelConfirmarBaja() {
    if ($body.contains($confirmarBajaContainer)) {
        $body.removeChild($confirmarBajaContainer);
    }
}
