document.addEventListener('DOMContentLoaded', function() {
    document.querySelectorAll('.card-normal').forEach(card => {
        card.addEventListener('click', function(event) {
            const target = event.target;
            // Asegurarnos de que el click no es en un botón o formulario
            if (!target.classList.contains('btn') && !target.closest('form')) {
                const id = card.dataset.id;
                window.open(window.location.origin + '/Login_war/historia?id_his=' + id + '&nu=' + encodeURIComponent(contrasenaCifrada), '_blank');
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

    // Manejar la búsqueda
    const searchForm = document.getElementById('searchForm');
    const searchInput = document.getElementById('searchInput');

    searchForm.addEventListener('submit', function(event) {
        event.preventDefault();

        const titulo = searchInput.value.trim();

        if (titulo === '') {
            window.location.reload(); // Recargar la página si el campo de búsqueda está vacío
            return;
        }

        fetch(`buscarHistoriaServlet?titulo=${encodeURIComponent(titulo)}`)
            .then(response => response.json())
            .then(data => {
                if (data.error) {
                    Swal.fire({
                        title: "Error",
                        text: data.error,
                        icon: "error",
                        confirmButtonText: "Ok",
                        confirmButtonColor: "#DC3545"
                    });
                } else if (data.mensaje) {
                    Swal.fire({
                        title: "No encontrado",
                        text: data.mensaje,
                        icon: "warning",
                        confirmButtonText: "Ok",
                        confirmButtonColor: "#0B6490"
                    });
                } else {
                    // Mostrar las historias encontradas
                    const contenedorPrincipalCard = document.getElementById('contenedorPrincipalCard');
                    contenedorPrincipalCard.innerHTML = ''; // Limpiar el contenedor
                    data.forEach(historia => {
                        contenedorPrincipalCard.innerHTML += `
                            <div class="col">
                                <div class="card shadow-sm card-normal" data-id="${historia.id}">
                                    <div class="embed-responsive mb-3 mx-auto">
                                        <img src="${historia.multimedia}" class="embed-responsive-item img_d_card" alt="previsualizaciónHistoria">
                                    </div>
                                    <div class="card-body">
                                        <h5 class="card_title">${historia.titulo}</h5>
                                        <p class="card-text">${historia.descripcion}</p>
                                        <div class="d-flex flex-column items-card-container">
                                            <div class="btn-group">
                                                <button type="button" class="btn btn-sm btn-outline-secondary btn-editar" onclick="window.location.href='gestionHistoria.jsp?id_his=${historia.id}'">Editar</button>
                                                <button type="button" class="btn btn-sm btn-outline-secondary btn-copiar" onclick="copiarEnlace('${historia.id}')">Copiar enlace</button>
                                                <form method="post" action="estadoPublicacion" style="display: inline;">
                                                    <input type="hidden" name="id" value="${historia.id}">
                                                    <input type="hidden" name="accion" value="${historia.estado === 'publicada' ? 'archivar' : 'publicar'}">
                                                    <button id="btn-pub-despub" type="submit" class="btn btn-sm btn-outline-secondary ${historia.estado === 'publicada' ? 'btn-archivar' : 'btn-publicar'}" data-id="${historia.id}" data-accion="${historia.estado === 'publicada' ? 'archivar' : 'publicar'}">
                                                        ${historia.estado === 'publicada' ? 'Archivar' : 'Publicar'}
                                                    </button>
                                                </form>
                                            </div>
                                            <button id="editar-portada-btn" type="button" class="btn btn-sm btn-outline-secondary w-75 mt-1 mb-4 mx-auto" onclick="window.location.href='editarPortada.jsp?id_his=${historia.id}'">Editar Portada</button>
                                            <small class="text-body-secondary mt-2"><span class="ultima-mod">Últm. mod:</span> ${historia.fechaCreacion}</small>
                                            <div><strong>Estado: </strong><span class="${historia.estado === 'publicada' ? 'estado-publicada' : 'estado-archivada'}">${historia.estado}</span></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        `;
                    });
                }
            })
            .catch(error => {
                console.error('Error:', error);
                Swal.fire({
                    title: "Error",
                    text: "Hubo un problema al realizar la búsqueda",
                    icon: "error",
                    confirmButtonText: "Ok",
                    confirmButtonColor: "#DC3545"
                });
            });
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
