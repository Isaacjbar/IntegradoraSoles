document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.card-normal').forEach(card => {
        card.addEventListener('click', function(event) {
            const target = event.target;
            // Asegurarnos de que el clic no es en un botón o formulario
            if (!target.classList.contains('btn') && !target.closest('form')) {
                const id = card.dataset.id;
                window.location.href = window.location.origin + '/Login_war/historia?id_his=' + id;
            }
        });
    });

    document.querySelectorAll('.btn-publicar').forEach(button => {
        button.addEventListener('click', function(event) {
            event.preventDefault();
            const id = this.dataset.id;
            const accion = this.dataset.accion;
            const boton = this;

            const form = document.createElement('form');
            form.method = 'post';
            form.action = 'estadoPublicacion';

            const inputId = document.createElement('input');
            inputId.type = 'hidden';
            inputId.name = 'id';
            inputId.value = id;
            form.appendChild(inputId);

            const inputAccion = document.createElement('input');
            inputAccion.type = 'hidden';
            inputAccion.name = 'accion';
            inputAccion.value = accion;
            form.appendChild(inputAccion);

            document.body.appendChild(form);
            form.submit();

            const nuevoEstado = accion === 'publicar' ? 'publicada' : 'archivada';
            const nuevaAccion = accion === 'publicar' ? 'archivar' : 'publicar';
            const nuevoTexto = accion === 'publicar' ? 'Archivar' : 'Publicar';

            boton.dataset.accion = nuevaAccion;
            boton.innerText = nuevoTexto;
            form.remove();
        });
    });

    const userIcon = document.getElementById('user-icon');
    const userInfoContainer = document.getElementById('user-info-container');
    const closeInfoContainer = document.getElementById('close-info-container');

    // Mostrar/Ocultar menú dinámico
    userIcon.addEventListener('click', (event) => {
        event.stopPropagation(); // Prevenir que el evento se propague y cierre el menú inmediatamente
        const isVisible = userInfoContainer.style.display === 'flex';
        userInfoContainer.style.display = isVisible ? 'none' : 'flex';
    });

    closeInfoContainer.addEventListener('click', (event) => {
        event.stopPropagation(); // Prevenir que el evento se propague y vuelva a abrir el menú
        userInfoContainer.style.display = 'none';
    });

    // Ocultar menú si se hace clic fuera de él
    window.addEventListener('click', (event) => {
        if (!userInfoContainer.contains(event.target) && event.target !== userIcon) {
            userInfoContainer.style.display = 'none';
        }
    });
});

function copiarEnlace(id) {
    const enlace = window.location.origin + '/Login_war/historia?id_his=' + id;
    Swal.fire({
        title: 'Copiar enlace',
        html: '<input type="text" id="enlaceInput" class="swal2-input" value="' + enlace + '" readonly style="width: 80%;">',
        showCancelButton: true,
        confirmButtonText: 'Copiar',
        cancelButtonText: 'Cancelar',
        confirmButtonColor: "#0B6490",
        cancelButtonColor: "#DC3545",
        didOpen: () => {
            const input = Swal.getPopup().querySelector('#enlaceInput');
            input.focus();
            input.select();
        }
    }).then((result) => {
        if (result.isConfirmed) {
            const input = Swal.getPopup().querySelector('#enlaceInput');
            navigator.clipboard.writeText(input.value).then(() => {
                Swal.fire({
                    title: "Copiado!",
                    text: "El enlace ha sido copiado al portapapeles.",
                    imageUrl: "img/copiar-link.png",
                    imageWidth: "150px",
                    confirmButtonText: "Ok",
                    timer: 5000,
                    confirmButtonColor: "#0B6490"
                });
            }).catch(err => {
                console.error('Error al copiar el texto: ', err);
            });
        }
    });
}



const userIcon = document.getElementById('user-icon');
const userInfoContainer = document.getElementById('user-info-container');
const closeInfoContainer = document.getElementById('close-info-container');

// Mostrar/Ocultar menú dinámico
userIcon.addEventListener('click', (event) => {
    event.stopPropagation(); // Prevenir que el evento se propague y cierre el menú inmediatamente
    const isVisible = userInfoContainer.style.display === 'flex';
    userInfoContainer.style.display = isVisible ? 'none' : 'flex';
});

closeInfoContainer.addEventListener('click', (event) => {
    event.stopPropagation(); // Prevenir que el evento se propague y vuelva a abrir el menú
    userInfoContainer.style.display = 'none';
});

// Ocultar menú si se hace clic fuera de él
window.addEventListener('click', (event) => {
    if (!userInfoContainer.contains(event.target) && event.target !== userIcon) {
        userInfoContainer.style.display = 'none';
    }
});